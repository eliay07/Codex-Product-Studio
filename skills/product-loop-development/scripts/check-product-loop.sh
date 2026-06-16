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

check_any_file() {
  label="$1"
  shift
  found=""
  for pattern in "$@"; do
    match="$(find "$PROJECT_PATH" -maxdepth 3 -type f -name "$pattern" 2>/dev/null | head -n 1)"
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
  if grep -R -I -n -E "$pattern" "$PROJECT_PATH" \
    --include='*.md' --include='*.tsx' --include='*.ts' --include='*.jsx' --include='*.js' --include='*.vue' --include='*.html' \
    2>/dev/null | head -n 1 >/dev/null; then
    echo "通过: $label"
  else
    echo "提醒: 未发现 $label"
  fi
}

check_ui_leak() {
  label="$1"
  pattern="$2"
  match="$(grep -R -I -n -E "$pattern" "$PROJECT_PATH" \
    --include='*.tsx' --include='*.ts' --include='*.jsx' --include='*.js' --include='*.vue' --include='*.html' \
    2>/dev/null | grep -v 'node_modules' | grep -v -E ':[[:space:]]*(//|/\*|\*|<!--)' | head -n 1 || true)"
  if [ -n "$match" ]; then
    echo "提醒: 可能存在 $label -> $match"
  else
    echo "通过: 未发现 $label"
  fi
}

echo "一、关键文档"
check_any_file "项目/需求说明" "项目说明.md" "需求文档.md" "产品闭环计划.md" "*需求*.md" "*PRD*.md"
check_any_file "决策或任务记录" "决策记录.md" "任务记录.md" "*todo*.md" "*TODO*.md"
check_any_file "项目级 AGENTS 规则" "AGENTS.md" "Codex工作区规则.md"
echo

echo "二、产品闭环信号"
check_text "用户任务/目标用户描述" "目标用户|用户任务|使用动线|用户旅程|job-to-be-done|JTBD"
check_text "步骤/流程描述" "第一步|第二步|第三步|Step 1|stepper|流程|动线"
check_text "按钮层级描述" "Primary|primary|主动作|次动作|危险动作|CTA"
check_text "状态覆盖描述" "loading|empty|error|disabled|success|空状态|错误状态|加载"
check_text "接口/数据契约描述" "API|接口|响应|错误码|权限|schema|contract|契约"
echo

echo "三、代码层交互信号"
check_text "按钮或动作组件" "<button|Button|type=\"button\"|type=\"submit\""
check_text "加载状态" "loading|isLoading|pending|isPending|加载中"
check_text "错误状态" "error|isError|错误|失败"
check_text "禁用状态" "disabled|aria-disabled"
check_text "可访问性标签" "aria-label|aria-labelledby|<label|htmlFor"
echo

echo "四、视觉系统信号"
check_text "色彩 token / 主题变量" "primary|secondary|accent|surface|--color-|theme|tokens|semantic|语义色|色彩角色"
check_text "字体层级 / 排版规则" "font-size|line-height|typography|page-title|section-title|字体层级|排版"
check_text "布局网格 / 间距规则" "grid|gap|max-width|spacing|breakpoint|断点|间距|网格"
check_ui_leak "组件内散落裸 hex 色值" "#[0-9a-fA-F]{3,8}"
echo

echo "五、前端文案泄露风险"
check_ui_leak "PRD/需求/验收说明泄露到 UI" "PRD|需求分析|验收标准|产品闭环|内部说明|技术方案|实现策略|设计原则"
check_ui_leak "团队内部取舍说明泄露到 UI" "我们要|我们不|本版本不做|为了避免|根据用户要求"
check_ui_leak "常见 AI 味视觉默认值" "purple|violet|indigo|gradient|glassmorphism|orb|bokeh"
echo

if [ "$missing" -gt 0 ]; then
  echo "结果: 有 $missing 项关键文档缺失。建议先补齐产品闭环计划或项目级 AGENTS 约束。"
  exit 1
fi

echo "结果: 关键文档存在。请结合 references/04-review-and-qa-checklist.md 做人工复核。"
