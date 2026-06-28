# Codex Product Studio

Codex Product Studio 是一套面向 Codex 的产品开发插件。它把“从 idea 到上线”的工作约束成一套可复用流程：先做产品经理判断，再做信息架构、交互、视觉系统、前后端契约、测试验证和发布闭环。

它的目标不是让 Codex 写更多代码，而是让 Codex 在写代码前先回答正确的问题，避免生成看起来像 demo、PRD 或随机 dashboard 的产品界面。

## 解决的问题

- 功能入口没有按使用频率、用户价值、业务价值和风险排序。
- 页面没有根据任务选择合适的产品表面，所有东西都被套成 landing page、dashboard 或卡片流。
- 前端把 PRD、设计原则、实现策略和团队取舍直接写进用户界面。
- 同一级按钮摆放没有依据，主动作、辅助动作和危险动作混在一起。
- 2C 首屏不能让用户快速理解产品用途、看到最高频动作并立即开始。
- 色彩、排版、布局、图标和组件状态没有统一设计系统。
- logo、背景、图标、空状态、截图和社交预览缺少统一素材库。
- UI 有入口但后端没有数据契约、权限、错误码、状态矩阵或验收方式。
- 通用提示被具体项目名、真实业务对象、页面文案或品牌风格污染。

## 核心能力

- `product-loop-development`: 通用成熟产品标准、PM 优先级、产品表面选择、用户动线、按钮层级、2C 首屏、UI 文案隔离、设计 tokens、素材库、状态矩阵、前后端契约和 QA。
- `create-plan`: 生成简洁执行计划。
- `theme-factory`: 主题和视觉方向。
- `webapp-testing`: 本地 Web 应用测试。
- `mcp-builder`: MCP 服务构建参考。
- `codebase-migrate`: 代码迁移和多文件重构。
- `deploy-pipeline`: 部署流水线。
- `sentry-triage`: Sentry 问题排查。
- `changelog-generator`: 变更日志生成。
- `support-ticket-triage`: 用户反馈分流。
- `domain-name-brainstormer`: 域名创意和可用性检查。

## Product Loop 标准

使用 `product-loop-development` 时，Codex 必须先输出这些判断，再开始改前端：

```text
1. 产品定位和目标用户
2. 最高频场景和用户成功瞬间
3. 功能优先级表
4. 通用产品表面选择
5. 动线模型
6. 页面/路由地图
7. 按钮摆放依据
8. 2C 首屏策略，若不适用需说明
9. 设计 tokens 和视觉风格方向
10. 素材库计划
11. 状态矩阵
12. 前后端 API/data contract
13. 验收清单
```

核心质量门槛：

- 每个视图默认只有一个 primary action。
- 高频、高价值、低风险动作优先出现在首屏或默认路径。
- 低频、高风险动作必须降级到更多菜单、设置、确认弹窗或危险区域。
- 页面标题、tab、按钮和空状态使用用户语言，不使用 PRD 语言。
- UI 可见动作必须对应接口、本地状态、权限、错误码和恢复路径。
- 设计系统必须包含颜色 token、字体层级、布局网格、组件状态和图标语义。
- 官网、2C 产品和品牌化工具必须规划统一素材库。
- 模板和示例只允许使用占位符，不固化具体项目名词。

## 模板

`product-loop-development/templates/` 提供可复制的结构化模板：

- `design-tokens-template.md`
- `app-shell-template.md`
- `interaction-map-template.md`
- `state-matrix-template.md`
- `asset-library-template.md`

这些模板用于把产品判断落成可检查的工程输入，而不是作为固定 UI 套壳。

## 本地安装

本工作区通过 personal marketplace 注册：

```bash
codex plugin add codex-product-dev-kit@personal
```

插件源目录：

```text
/Users/eliayan/Desktop/codex/插件/codex-product-dev-kit
```

GitHub 仓库：

```text
https://github.com/eliay07/Codex-Product-Studio
```

## 使用方式

常用启动语：

```text
请使用 Codex Product Studio。先按 PM 思维梳理产品定位、功能优先级、产品表面、动线模型、按钮摆放、2C 首屏、设计 tokens、素材库、状态矩阵和前后端契约，再开始写代码。内部 PRD、实现策略和具体项目名词不能进入 UI 或通用模板。
```

交付前运行：

```bash
bash skills/product-loop-development/scripts/check-product-loop.sh <project-path>
```

## 许可证与来源

本插件是一个组合包，包含本地自定义 skill 和从公开 Codex skill 生态筛选的第三方 skill。第三方 skill 的原始许可证保留在对应 skill 目录中；没有明确许可证的内容仅按原来源说明保留，不在本仓库中重新授权。

详见 `THIRD_PARTY_NOTICES.md`。
