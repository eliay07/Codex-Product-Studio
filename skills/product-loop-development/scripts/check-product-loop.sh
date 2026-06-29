#!/usr/bin/env bash
set -u

PROJECT_PATH="${1:-.}"

if [ ! -d "$PROJECT_PATH" ]; then
  echo "错误: 找不到项目目录: $PROJECT_PATH"
  exit 2
fi

echo "产品闭环检查: $PROJECT_PATH"
echo

missing=0

find_text_files() {
  find "$PROJECT_PATH" \
    \( -path '*/.git' -o -path '*/.git/*' \
    -o -path '*/node_modules' -o -path '*/node_modules/*' \
    -o -path '*/dist' -o -path '*/dist/*' \
    -o -path '*/build' -o -path '*/build/*' \
    -o -path '*/coverage' -o -path '*/coverage/*' \
    -o -path '*/.next' -o -path '*/.next/*' \
    -o -path '*/.turbo' -o -path '*/.turbo/*' \
    -o -path '*/__pycache__' -o -path '*/__pycache__/*' \) -prune -o \
    -type f \( -name '*.md' -o -name '*.mdx' -o -name '*.tsx' -o -name '*.ts' \
    -o -name '*.jsx' -o -name '*.js' -o -name '*.vue' -o -name '*.html' \
    -o -name '*.css' -o -name '*.scss' -o -name '*.json' \) -print0
}

find_ui_files() {
  find "$PROJECT_PATH" \
    \( -path '*/.git' -o -path '*/.git/*' \
    -o -path '*/node_modules' -o -path '*/node_modules/*' \
    -o -path '*/dist' -o -path '*/dist/*' \
    -o -path '*/build' -o -path '*/build/*' \
    -o -path '*/coverage' -o -path '*/coverage/*' \
    -o -path '*/.next' -o -path '*/.next/*' \
    -o -path '*/.turbo' -o -path '*/.turbo/*' \) -prune -o \
    -type f \( -name '*.tsx' -o -name '*.jsx' -o -name '*.vue' -o -name '*.html' \
    -o -name '*.css' -o -name '*.scss' \) -print0
}

grep_project() {
  pattern="$1"
  while IFS= read -r -d '' file; do
    grep -I -n -E "$pattern" "$file" 2>/dev/null | sed "s#^#$file:#"
  done < <(find_text_files)
}

grep_ui_project() {
  pattern="$1"
  while IFS= read -r -d '' file; do
    grep -I -n -E "$pattern" "$file" 2>/dev/null | sed "s#^#$file:#"
  done < <(find_ui_files)
}

check_any_file() {
  label="$1"
  shift
  found=""
  for pattern in "$@"; do
    match="$(find "$PROJECT_PATH" \
      \( -path '*/.git' -o -path '*/node_modules' -o -path '*/dist' -o -path '*/build' -o -path '*/coverage' \) -prune -o \
      -type f -name "$pattern" -print 2>/dev/null | head -n 1)"
    if [ -n "$match" ]; then
      found="$match"
      break
    fi
  done

  if [ -n "$found" ]; then
    echo "通过: $label -> $found"
  else
    echo "缺失: $label"
    missing=$((missing + 1))
  fi
}

check_text() {
  label="$1"
  pattern="$2"
  if grep_project "$pattern" | head -n 1 >/dev/null; then
    echo "通过: $label"
  else
    echo "提醒: 未发现 $label"
  fi
}

check_ui_leak() {
  label="$1"
  pattern="$2"
  match="$(grep_ui_project "$pattern" \
    | grep -v -E ':[[:space:]]*(//|/\*|\*|<!--)' \
    | head -n 1 || true)"
  if [ -n "$match" ]; then
    echo "提醒: 可能存在 $label -> $match"
  else
    echo "通过: 未发现 $label"
  fi
}

check_hex_leak() {
  match="$(grep_ui_project '#[0-9a-fA-F]{3,8}\b' \
    | grep -v -E '/(tokens?|theme|themes|styles?|variables?)[^/]*\.(ts|tsx|js|jsx|css|scss|json):' \
    | grep -v -E '/themes?/' \
    | grep -v -E '/tailwind\.config\.(js|ts):' \
    | grep -v -E '/postcss\.config\.(js|ts):' \
    | grep -v -E '/vite\.config\.(js|ts):' \
    | grep -v -E '/package(-lock)?\.json:' \
    | head -n 1 || true)"
  if [ -n "$match" ]; then
    echo "提醒: 可能存在组件内散落裸 hex 色值 -> $match"
  else
    echo "通过: 未发现组件内散落裸 hex 色值"
  fi
}

echo "一、关键文档"
check_any_file "项目/需求说明" "README.md" "项目说明.md" "需求文档.md" "产品闭环计划.md" "*需求*.md" "*PRD*.md"
check_any_file "决策或任务记录" "决策记录.md" "任务记录.md" "*todo*.md" "*TODO*.md"
check_any_file "项目级 AGENTS 规则" "AGENTS.md" "Codex工作区规则.md"
echo

echo "二、产品闭环信号"
check_text "用户任务/目标用户描述" "目标用户|用户任务|使用动线|用户旅程|job-to-be-done|JTBD|User role|Primary task"
check_text "产品定位/最高频场景/用户成功瞬间" "产品定位|最高频场景|成功瞬间|目标用户|用户价值|业务价值|Product context"
check_text "功能优先级/使用频率排序" "功能优先级|使用频率|高频|低频|用户价值|业务价值|优先级|Frequency"
check_text "通用产品表面选择" "Entry surface|Workflow surface|Management surface|Editor surface|Reader surface|Asset surface|Monitoring surface|Settings surface|产品表面|Surface type"
check_text "步骤/流程描述" "第一步|第二步|第三步|Step 1|stepper|流程|动线|workflow|progress"
check_text "动线模型选择" "线性向导|hub and spoke|列表-详情|画布-工具栏|搜索-筛选|仪表盘-下钻|动线模型|Navigation model"
check_text "交互层级/渐进披露设计" "交互层级|Interaction Depth|L0 固定|L1 默认|L2 可收起|L3 临时|L4 深层|默认收起|可收起|抽屉|浮层|命令菜单|command menu|drawer|sheet|popover|collapsible"
check_text "2C 首屏/转化策略" "首屏|2C|转化|试用|开始路径|最高频动作|结果预期|Entry surface"
check_text "AI/生成类后置确认策略" "发送后|开始后|后置确认|预填确认|问卷后置|确认流|post-submit|clarify"
check_text "按钮层级描述" "Primary|primary|主动作|次动作|危险动作|CTA|Action Hierarchy"
check_text "按钮摆放依据" "按钮摆放|动作位置|页面级主动作|对象级动作|批量操作|危险动作|Placement Checks"
check_text "状态覆盖描述" "loading|empty|error|disabled|success|空状态|错误状态|加载|State Matrix"
check_text "接口/数据契约描述" "API|接口|响应|错误码|权限|schema|contract|契约"
echo

echo "三、代码层交互信号"
check_text "按钮或动作组件" "<button|Button|type=\"button\"|type=\"submit\""
check_text "加载状态" "loading|isLoading|pending|isPending|加载中|Skeleton|spinner"
check_text "错误状态" "error|isError|错误|失败|retry"
check_text "禁用状态" "disabled|aria-disabled"
check_text "空状态" "empty|Empty|空状态|暂无|No .* yet"
check_text "可访问性标签" "aria-label|aria-labelledby|<label|htmlFor|title="
check_text "收起/浮层/深层交互信号" "Sheet|Drawer|Dialog|Popover|Dropdown|Command|Resizable|Collapsible|Accordion|aria-expanded|role=\"dialog\"|data-state|Floating|Inspector|Panel"
echo

echo "四、视觉系统信号"
check_text "色彩 token / 主题变量" "primary|secondary|accent|surface|--color-|theme|tokens|semantic|语义色|色彩角色"
check_text "字体层级 / 排版规则" "font-size|line-height|typography|page-title|section-title|字体层级|排版"
check_text "布局网格 / 间距规则" "grid|gap|max-width|spacing|breakpoint|断点|间距|网格"
check_text "图标语义 / 工具动作" "lucide|Icon|aria-label|tooltip|图标语义|icon"
check_text "素材库 / 品牌资产计划" "素材库|brand assets|logo|wordmark|favicon|hero background|empty state|social preview|产品截图|Asset Inventory"
check_hex_leak
echo

echo "五、前端文案和模板污染风险"
check_ui_leak "PRD/需求/验收说明泄露到 UI" "PRD|需求分析|验收标准|产品闭环|内部说明|技术方案|实现策略|设计原则"
check_ui_leak "团队内部取舍说明泄露到 UI" "我们要|我们不|本版本不做|为了避免|根据用户要求"
check_ui_leak "常见 AI 味视觉默认值" "purple|violet|indigo|gradient|glassmorphism|orb|bokeh"
echo

if [ "$missing" -gt 0 ]; then
  echo "结果: 有 $missing 项关键文档缺失。建议先补齐产品闭环计划或项目级 AGENTS 约束。"
  exit 1
fi

echo "结果: 关键文档存在。请结合 references/04-review-and-qa-checklist.md 和 references/14-product-quality-standard.md 做人工复核。"
