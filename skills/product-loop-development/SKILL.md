---
name: product-loop-development
description: "Use when building, redesigning, reviewing, or planning a frontend/backend product feature, web app, dashboard, admin tool, AI product surface, or prototype that needs closed-loop UX, clear user flow, disciplined buttons/actions, frontend IA, backend API/data contracts, states, QA, and acceptance criteria. 适用于前后端产品开发约束、AI 生成产品界面纠偏、功能动线梳理、按钮层级约束、接口契约和上线前检查。"
---

# Product Loop Development

把“一个想法”约束成可实现、可使用、可验证的前后端产品闭环。优先解决这四类失败：

- 功能按键散乱：没有主动作、次动作、危险动作、状态和反馈。
- 使用动线不清：用户不知道第一步、第二步、第三步在哪里。
- 前后端不闭环：UI 有按钮，后端没有契约；接口有字段，页面没有状态；功能有入口，缺少验收。
- 内部说明泄露：把 PRD、实现策略、设计原则、“我们要/不要怎么做”直接写到前端页面。

## 触发后先做

1. 读项目内最近的 `AGENTS.md`、需求文档、原型、路由、组件、接口和数据模型。
2. 如果是从零生成产品，先输出“产品闭环计划”，再写代码。
3. 如果是改造已有产品，先做“动线和按钮审计”，再改 UI 或接口。
4. 如果用户只要求查找或决策，不要擅自实现；如果用户要求“搞一套/做出来/落地”，直接创建文件或改代码。
5. 前端实现前，把内容分成三类：用户可见文案、PRD/内部说明、代码/工程说明。只有第一类可以进入 UI。

## 主流程

### 1. 产品闭环定义

必须先回答：

- 用户是谁：具体角色，不写泛泛的“用户”。
- 用户要完成什么：用动词表达，例如“导入素材、生成分析、确认发布”。
- 成功路径是什么：第一步、第二步、第三步。
- 失败路径是什么：空状态、加载、错误、权限不足、撤销或重试。
- 当前版本不做什么：避免功能无限扩张。

需要细节时读取 `references/01-product-loop-workflow.md`。

### 2. 信息架构和动线

先定结构，再定视觉：

- 全局导航：用户从哪里进入。
- 页面层级：每页只承担一个主要目的。
- 任务步骤：复杂任务用 stepper、tabs、分段表单或向导承接。
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

## 输出格式

做计划时输出：

- 产品闭环一句话
- 用户任务流
- 页面/路由地图
- 动作层级表
- 前后端契约
- 状态矩阵
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
- OpenAI Codex customization / skills 文档：用 skill 承载可复用工作流。
