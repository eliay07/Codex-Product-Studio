---
name: product-loop-development
description: "Use when building, redesigning, reviewing, or planning a frontend/backend product feature, web app, dashboard, admin tool, AI product surface, or prototype that needs closed-loop UX, clear user flow, disciplined buttons/actions, frontend IA, backend API/data contracts, states, QA, and acceptance criteria. 适用于前后端产品开发约束、AI 生成产品界面纠偏、功能动线梳理、按钮层级约束、接口契约和上线前检查。"
---

# Product Loop Development

把“一个想法”约束成可实现、可使用、可验证的前后端产品闭环。优先解决这些失败：

- 功能排序混乱：没有按使用频率、用户价值、业务优先级和风险安排入口。
- 功能按键散乱：没有主动作、次动作、危险动作、状态和反馈。
- 使用动线不清：用户不知道第一步、第二步、第三步在哪里。
- 2C 首屏失败：首屏没有展示最高频、最吸引人、最能说明产品用途的入口。
- 按钮摆放无依据：同一级页面的动作位置只是随机堆放，不符合用户操作习惯。
- 前后端不闭环：UI 有按钮，后端没有契约；接口有字段，页面没有状态；功能有入口，缺少验收。
- 内部说明泄露：把 PRD、实现策略、设计原则、“我们要/不要怎么做”直接写到前端页面。
- 素材风格割裂：logo、背景、插画、图标、空状态和社交预览没有统一视觉资产系统。
- 品牌视觉降级：需要背景图、插画、封面、社交图或产品氛围图时，只用 HTML/SVG/CSS 临时画线条，没有调用 GPT 图像生成产出可复用 bitmap 资产。
- 产品类型误判：所有产品都套成同一种 dashboard、landing page 或卡片流，而不是根据用户任务选择合适的产品表面。
- 默认 ToB 化：用户没有明确要求 ToB、后台、管理系统或企业内部工具时，仍把原型做成表格、指标卡、三栏后台和功能菜单。
- 视觉引导缺失：首屏没有一个大的创作入口、示例预览或下一步引导，而是把来源、候选、详情、设置和数据一次性堆给用户。
- 首屏问卷平铺：AI 产品、生成类工具、调研工具或产品启动工具还没等用户发送需求，就把问卷、参数、方法论和确认项直接铺在首页。
- 页面层级扁平：导航有一级/二级，但页面内部没有按复杂度建立层级，所有模块同权重展示，用户不知道先点哪里。
- 创作者动线断裂：个人创作者产品没有按“目标与灵感库 -> 沉浸式工作台 -> 发布与复盘”组织，导致灵感、草稿、素材、发布和数据彼此割裂。
- 工作区交互粗糙：编辑器、工作台、创作者工具把列表、详情、设置、编辑器、日志和 AI 工具全部摊在同一层，缺少进入深浅层、可恢复折叠、右侧检查器、底部面板、浮动工具或命令入口。
- 折叠状态死路：任何 sidebar、rail、panel、drawer、inspector、草稿栏或工具栏被收起后，没有持续可见的恢复按钮、rail、快捷入口或菜单项。

## 触发后先做

1. 读项目内最近的 `AGENTS.md`、需求文档、原型、路由、组件、接口和数据模型。
2. 如果是从零生成产品，先输出“产品闭环计划”，再写代码。
3. 如果是改造已有产品，先做“动线和按钮审计”，再改 UI 或接口。
4. 如果用户只要求查找或决策，不要擅自实现；如果用户要求“搞一套/做出来/落地”，直接创建文件或改代码。
5. 前端实现前，把内容分成三类：用户可见文案、PRD/内部说明、代码/工程说明。只有第一类可以进入 UI。
6. 涉及前端页面、2C 产品、官网、工作台、dashboard、AI 工具或功能改造时，必须先输出“PM 前置判断”：产品定位、目标用户、ToC/ToB 取向、功能优先级、动线模型、按钮摆放依据、首屏策略和素材库计划。素材库计划必须区分 GPT 图像生成资产、代码原生 SVG/图标资产和真实产品截图。
7. 涉及从零生成、重构或大改产品体验时，先读取 `references/14-product-quality-standard.md`，选择合适的通用产品表面，并建立质量门槛。
8. 用户未明确要求 ToB、后台、管理系统、企业控制台、CRM、ERP、内部运营台时，默认按 ToC 或 prosumer 创作者产品处理：先给一个高吸引力创作入口，再逐步展开来源、设置、详情和高级能力；AI 产品、生成类工具、调研工具和产品启动工具必须优先采用“输入 -> 发送 -> 预填确认 -> 工作台”，不要把完整问卷默认铺在首屏。
9. 涉及个人创作者、自媒体、短视频、图文、播客、课程、作品库、草稿库或内容生产工具时，必须优先审阅创作者三段动线：第一步目标管理与灵感库，第二步沉浸式编辑工作台，第三步发布确认与复盘追踪。
10. 涉及前端页面、工作台、编辑器、IDE-like 产品、AI 助手、多面板工具、画布、草稿库、素材库、复杂创作流，或用户反馈“功能平铺/没有层次/交互不舒服/缺少收起和悬浮”时，必须先读取 `references/15-interaction-depth-and-disclosure.md`，明确交互深浅层级、默认打开/默认收起、右侧面板、抽屉、浮层、命令入口和可恢复折叠策略。

## 主流程

### 1. 产品闭环定义

必须先回答：

- 用户是谁：具体角色，不写泛泛的“用户”。
- 用户要完成什么：用动词表达，例如“导入素材、生成分析、确认发布”。
- 成功路径是什么：第一步、第二步、第三步。
- 失败路径是什么：空状态、加载、错误、权限不足、撤销或重试。
- 当前版本不做什么：避免功能无限扩张。

需要细节时读取 `references/01-product-loop-workflow.md`。

涉及产品经理思维、功能排序、按钮位置、用户使用频率、2C 首屏、创作者工具、目标用户、产品定位、动线结构、渐进披露、页面层级或素材库时，读取 `references/13-pm-prioritization-flow-and-2c-ux.md`。

涉及产品类型判断、页面结构泛化、成熟产品质量标准或避免套用具体案例时，读取 `references/14-product-quality-standard.md`。

涉及交互层级、渐进披露、可收起侧栏、右侧面板、抽屉、浮层、悬浮操作、命令菜单、工作台布局、沉浸编辑、预览位置或用户反馈“所有功能铺在一页”时，读取 `references/15-interaction-depth-and-disclosure.md`。

### 2. 信息架构和动线

先定结构，再定视觉：

- 产品表面：先选择 entry、workflow、management、editor、reader、asset、monitoring 或 settings 等通用表面，再决定布局。
- 全局导航：用户从哪里进入。
- 页面层级：每页只承担一个主要目的，并按功能复杂度写清层级；功能少可以浅，功能多再加深，常见参考是产品域 -> 一级模块 -> 任务入口 -> 步骤/状态 -> 详情/高级设置。
- 创作者产品动线：默认从目标进度和灵感库开始，再进入单条内容的沉浸式工作台，最后进入发布确认和复盘；灵感、草稿、素材、成片、链接和数据必须围绕同一个作品或项目归档。
- 任务步骤：复杂任务用 stepper、tabs、分段表单或向导承接。
- 渐进披露：先展示一个主入口或一个主决策，再进入候选、详情、参数和高级配置；不要把来源、候选、详情三栏同时摊开作为默认 ToC 页面。
- 后置确认：AI 产品、生成类工具、调研工具和产品启动工具，首屏只放主输入、主动作和少量示例；问卷、参数和确认项必须在用户发送/开始后基于输入预填，再进入确认流。
- 交互层级：先定义 L0 固定壳层、L1 默认任务层、L2 可收起上下文、L3 临时浮层、L4 深层详情；不要把所有功能同屏同权重平铺。
- 工作台层级：复杂编辑类产品默认拆成 activity rail / sidebar 或对象列表 / main canvas 或 editor / inspector drawer / bottom panel / command palette 或 floating action；每层必须有清楚用途，不得把全部层同时作为默认态展开。
- 可恢复折叠：任何可收起区域必须保留一个可见的 rail、trigger、handle、tab、command 或菜单入口；恢复入口必须可键盘聚焦，有 aria-label 或 tooltip，并记住上一次宽度或打开状态。
- 进入确认：工作台和编辑器默认不应自动展开深层编辑态；用户选择对象、点击继续、创建后确认或从最近记录打开后，才进入单对象编辑区。
- 标签命名：面向用户语言，不用内部术语。
- 上下文位置：用户始终知道自己在哪里、下一步是什么。

需要细节时读取 `references/02-frontend-ia-ui-constraints.md`。

前端成熟度、视觉和交互细节需要更严格约束时，读取 `references/06-frontend-product-standards.md`。

涉及页面文案、空状态、说明文字、AI 生成页或 marketing-like 页面时，读取 `references/07-ui-copy-and-prd-separation.md`。

### 3. 按钮和动作约束

每个视图默认只允许一个 primary action。其他动作必须降级：

- Primary：推进主流程，只保留一个。
- Secondary：辅助查看、保存草稿、返回。
- Tertiary：弱操作、更多菜单、筛选排序。
- Destructive：删除、覆盖、清空，必须确认或可撤销。

所有可点击动作必须有状态：默认、hover、focus、active、disabled、loading、success、error。AI 生成、发布、扣费、覆盖类动作必须有人类确认或撤销路径。

### 4. 前后端契约

UI 上的每个功能都要落到接口或本地状态：

- 实体：对象、字段、枚举、关系、权限。
- API：请求、响应、错误码、重试、幂等。
- 表单：校验、默认值、脏状态、提交中、提交失败。
- 列表：搜索、筛选、排序、分页、空状态。
- AI 功能：输入、上下文、生成中、引用来源、人工确认、回滚。

需要细节时读取 `references/03-backend-api-data-contracts.md`。

### 5. 实现顺序

推荐顺序：

1. 写 `产品闭环计划.md` 或在需求文档中补齐闭环。
2. 写路由/页面地图、主任务流和动作表。
3. 写 API/data contract。
4. 搭骨架：导航、页面标题、主区域、动作区、状态区。
5. 实现核心 happy path。
6. 补全 loading、empty、error、disabled、permission、undo/confirm。
7. 做移动端、键盘、焦点、对比度和回归检查。

### 6. 上线前检查

交付前必须跑一次闭环检查：

```bash
bash scripts/check-product-loop.sh <project-path>
```

如果脚本不适合当前项目，至少手动按 `references/04-review-and-qa-checklist.md` 检查。

如果用户在问 Codex 怎么用、Skill 怎么用、为什么需要教 Codex、这套规则如何复用，读取 `references/08-codex-and-skills-usage.md`。

如果用户要从一个想法开始做产品，或者要求用 vibe coding 方式探索，读取 `references/09-vibe-coding-workflow.md`。

如果用户提到酷炫前端、WebGL、3D、沉浸式官网、Active Theory、Awwwards/FWA 风格、视觉参考或审美偏好收集，读取 `references/10-immersive-frontend-and-reference-sites.md`。

如果用户要求页面更游戏化、更少文字、更多图标、tab/步骤视觉指引、降低阅读负担、避免解释型文案，读取 `references/11-visual-interaction-language.md`。

如果用户反馈色彩不舒服、配色业余、排版布局不舒服、页面没有统一色彩模式或不像专业 UI/UX，读取 `references/12-color-typography-layout-systems.md`，先建立色彩 token、语义色、亮暗模式、排版网格和视觉 QA，再改页面。

如果用户反馈交互太直白、所有功能摊开、缺少层次、缺少收起/悬浮、工作台不沉浸、折叠后找不回、编辑器自动弹出或面板状态混乱，读取 `references/15-interaction-depth-and-disclosure.md`，先做交互架构审计和交互层级图，再改组件。

## 输出格式

做计划时输出：

- 产品闭环一句话
- 产品定位和目标用户
- ToC/ToB 取向判断
- 功能优先级表
- 用户任务流
- 动线模型
- 产品表面模型
- 可变页面层级图
- 引导式流程和渐进披露策略
- 交互层级图
- 默认打开/默认收起规则
- 浮层、抽屉、命令菜单和详情层策略
- 工作台交互架构
- 面板状态与恢复入口
- 页面/路由地图
- 动作层级表
- 首屏策略
- 素材库计划
- GPT 图像生成资产计划
- 前后端契约
- 状态矩阵
- 质量门槛
- 验收清单

做代码时输出：

- 改了哪些文件
- 哪条用户动线被闭环
- 哪些状态已经覆盖
- 跑了哪些验证

## 约束来源

本 skill 综合了这些开源或公开方法的实践方向，但已改写为本工作区的通用开发约束：

- `Leonxlnx/taste-skill`：反 AI 模板化、按钮/导航/状态 pre-flight 思路。
- `vadimcomanescu/codex-skills` 的 `information-architect` 和 `frontend-design`：信息架构、导航、标签、设计系统、状态和 QA。
- `joshuadavidthomas/agent-skills` 的 `frontend-design-principles`：从用户、任务、领域语言出发，避免通用 AI UI。
- Material Design / Atlassian Design System：主次按钮和动作层级。
- Material Design / Apple HIG / IBM Carbon / Atlassian Design System：色彩角色、语义 token、状态色、对比度、亮暗模式和专业设计系统方法。
- NN/g usability heuristics / visual hierarchy、Material Design FAB、Apple HIG navigation：识别优先于记忆、视觉层级、主动作聚焦、熟悉导航模式和渐进披露。
- Radix UI、Floating UI、shadcn/ui、cmdk、react-resizable-panels、Vaul、React Spectrum、xyflow、tldraw、TanStack Router：可访问基础组件、悬浮层、命令菜单、可调整面板、抽屉、节点式流程、画布和深层路由等交互结构。
- OpenAI Codex customization / skills 文档：用 skill 承载可复用工作流。
