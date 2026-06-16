# Codex 与 Skill 使用说明

## Codex 怎么用

Codex 更适合当“能读写代码和运行验证的工程搭档”，不要只把它当聊天模型。

推荐用法：

1. 给它真实工作区、真实 repo、真实目标。
2. 让它先读代码、读 `AGENTS.md`、读需求，再改。
3. 明确验收标准：跑什么命令、看什么页面、哪些状态必须覆盖。
4. 让它实现后自查：代码、截图、lint/test/build、用户动线。
5. 把反复出现的问题沉淀到 `AGENTS.md` 或 Skill。

不推荐用法：

- 只说“做得高级一点”“像成熟产品”，但不定义页面任务、文案边界、状态矩阵。
- 一次让它生成完整大系统，却不给数据模型、接口契约和验收标准。
- 把偏好只写在聊天里，不沉淀到可复用文件。

## 为什么有人教你用 Codex

Codex 的能力很强，但它默认不知道你的产品品味、团队边界和验收方式。会用 Codex 的关键不是背提示词，而是建立工作流：

- 用 `AGENTS.md` 固化项目长期规则。
- 用 Skill 固化可复用流程。
- 用脚本固化机械检查。
- 用截图和测试固化验收。
- 用持续反馈固化你的审美和取舍。

所以“教你用 Codex”本质是在教你如何把个人判断、产品标准和工程流程变成机器可执行的约束。

## AGENTS.md 用来做什么

适合写：

- 项目目录结构。
- 技术栈和常用命令。
- 代码风格和测试规则。
- 前端产品红线。
- 提交前必须跑的检查。
- 当前项目特有的业务规则。

不适合写：

- 大段教程。
- 临时任务细节。
- 只对某一次对话有效的想法。

## Skill 用来做什么

Skill 是可复用的任务工作流。适合写：

- 某类任务固定步骤，例如“从 idea 到产品闭环”。
- 专门领域知识，例如 UI 文案隔离、AI 功能状态矩阵。
- 需要按需读取的参考文档。
- 可重复运行的检查脚本。

Skill 的基本结构：

```text
skill-name/
├── SKILL.md
├── references/
└── scripts/
```

`SKILL.md` 保持短，只放触发条件和主流程；细节放 `references/`；确定性检查放 `scripts/`。

## 这套 Skill 怎么复用

项目内复用：

```text
项目根目录/
├── AGENTS.md
└── .agents/
    └── skills/
        └── product-loop-development/
            └── SKILL.md
```

个人全局复用：

```text
/Users/eliayan/.codex/skills/product-loop-development/SKILL.md
```

当前工作区的模板源在：

```text
/Users/eliayan/Desktop/codex/模板/前后端产品开发约束工具/product-loop-development/
```

如果要在某个项目启用，把整个 `product-loop-development/` 复制或链接到该项目的 `.agents/skills/`，并在项目 `AGENTS.md` 中引用 `references/05-agents-snippet.md` 的规则片段。

## 什么时候用哪一层

```text
只对这次任务有效 -> 当前对话里说清楚
某个项目长期有效 -> 写进项目 AGENTS.md
多个项目反复复用 -> 做成 Skill
需要机械拦截或自动检查 -> 写脚本或 Hook
需要外部数据或账号操作 -> 用 MCP / connector
```

## 对前端产品任务的推荐启动语

```text
请使用 product-loop-development 约束来做这个产品。
先把我的 idea 拆成：用户任务、页面地图、用户可见文案、内部 PRD 说明、前后端契约、状态矩阵。
注意：PRD、设计原则、实现策略、我们要/不要怎么做，不能出现在前端页面。
确认计划后再实现，并在交付前列出可见文案做审查。
```
