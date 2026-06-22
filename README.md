# Codex Product Studio

一套面向 Codex 的产品开发插件，覆盖产品闭环、信息架构、UI 文案隔离、图标化交互、专业色彩排版、前后端契约、测试验证和上线流程，帮助避免杂乱页面、PRD 式文案和不成熟的 AI 默认 UI。

这是一个本地 Codex 插件，用于把产品从 idea 推到可实现、可检查、可上线的闭环流程。它重点解决三类问题:

- Codex 生成前端时把 PRD、内部策略和“我们要怎么做”写进用户界面。
- 页面缺少成熟产品的信息架构、按钮层级、状态和前后端契约。
- 色彩、排版、布局、图标和交互缺少统一设计系统，导致界面像拼贴 demo。

## 包含能力

- `product-loop-development`: 产品闭环、前端成熟度、UI 文案隔离、视觉语言、专业色彩排版和 QA。
- `create-plan`: 生成简洁执行计划。
- `theme-factory`: 主题和视觉资产方向。
- `webapp-testing`: 本地 Web 应用测试。
- `mcp-builder`: MCP 服务构建参考。
- `codebase-migrate`: 代码迁移和多文件重构。
- `deploy-pipeline`: 部署流水线。
- `sentry-triage`: Sentry 问题排查。
- `changelog-generator`: 变更日志生成。
- `support-ticket-triage`: 用户反馈分流。
- `domain-name-brainstormer`: 域名创意和可用性检查。

## 重点前端约束

做 Web 产品、后台、AI 工具或原型时，优先使用 `product-loop-development`。它要求 Codex:

- 先区分“用户可见文案”和“PRD/内部说明”。
- 页面标题、tab、按钮使用短而成熟的产品语言。
- 用图标、步骤、状态、badge、进度和交互表达流程，减少解释型文字。
- 先定义色彩 token、字体层级、布局网格和状态映射，再写页面。
- 使用专业色卡和语义色，避免随机渐变、一色到底和裸 hex 散落。
- 交付前检查 mobile、focus、loading、empty、error、disabled、permission 和视觉截图。

## 本地安装

本工作区通过 marketplace 注册:

```bash
codex plugin add codex-product-dev-kit@personal
```

插件源目录:

```text
/Users/eliayan/Desktop/codex/插件/codex-product-dev-kit
```

## 许可证与来源

本插件是一个本地组合包，包含用户自定义 skill 和从公开 Codex skill 仓库筛选的第三方 skill。第三方 skill 的原始许可证保留在对应 skill 目录中；没有明确许可证的内容仅按原来源说明保留，不在本仓库中重新授权。

详见 `THIRD_PARTY_NOTICES.md`。
