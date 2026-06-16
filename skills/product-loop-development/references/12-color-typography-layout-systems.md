# 专业色彩、排版与布局系统

## 一句话原则

不要让 Codex 凭感觉配色。每个 Web 产品都必须先定义一套可复用的色彩 token、语义色、字体层级、间距网格和组件状态，再把它们落到页面。

## 参考依据

成熟设计系统的共同做法:

- Material Design 3: 用 tonal palettes 和角色色表达 primary、secondary、surface、error 等用途。
- Apple HIG: 色彩要适配 light/dark、可访问性、语义状态和不同背景。
- IBM Carbon: 用设计 token 管理颜色、层级、交互状态和主题。
- Atlassian Design System: 强调 color token 以角色命名，而不是直接按视觉颜色命名。

落地到 Codex 时，结论是: 页面不应该散落十几个无解释的 `#xxxxxx`，而应先有一张“色彩角色表”。

## 色彩系统必须先产出

从零做产品或重构前端时，先写下:

```text
品牌色: primary
辅助色: secondary / accent
中性色: background / surface / border / text / muted
语义色: success / warning / danger / info
状态色: hover / active / focus / disabled / selected
模式: light / dark 或至少说明只做 light
```

每个颜色必须说明用途，不允许只写“好看”“高级”“科技感”。

## 专业配色比例

默认使用 60 / 30 / 10:

```text
60% 中性背景和 surface
30% 内容层级、边框、分区、弱强调
10% 品牌色、主按钮、关键状态和引导
```

禁忌:

- 大面积使用高饱和品牌色。
- 整页被一种色相统治，例如全紫、全蓝、全棕、全米色。
- 随机渐变、发光、玻璃拟态替代真实层级。
- 成功、警告、危险状态使用接近的颜色。
- 文本和背景对比度不足。

## 推荐色卡结构

每个主色至少定义 9 档色阶:

```text
50  最浅背景
100 轻提示背景
200 弱边框
300 禁用或弱装饰
400 辅助图标
500 标准色
600 hover / active
700 强调文字
800 深色背景
900 最高对比
```

颜色命名示例:

```text
--color-primary-50
--color-primary-600
--color-surface
--color-surface-raised
--color-text-primary
--color-text-secondary
--color-border-subtle
--color-status-success-bg
--color-status-success-text
```

页面代码优先使用 token，不直接写裸 hex。允许在 token 定义文件里出现 hex。

## 舒服的色彩方向

优先用“低饱和、明确层级、少量高亮”的专业产品色卡:

```text
中性底: zinc / stone / slate 中选择一套，不混用太多灰
主色: 选择一套 500-700 可读的品牌色
点缀: 只选 1 个，用于进度、奖励、强调或视觉锚点
状态: success、warning、danger 必须独立清晰
```

不要为了游戏化而变成彩虹界面。游戏化可以来自进度、徽章、动效、地图式步骤和反馈，不应主要靠高饱和色堆出来。

## 亮暗模式

如果项目需要 dark mode，不能只把背景改黑:

```text
light: surface 比 background 略高，边框轻，阴影轻
dark: surface 比 background 略亮，边框可见，阴影减弱，文字避免纯白刺眼
```

dark mode 必须重新检查:

- 文本可读性。
- 图标是否过亮或过暗。
- primary button 是否刺眼。
- success / warning / danger 是否仍然能区分。
- hover / focus / selected 是否可见。

## 排版系统

先定义文字层级，再写页面:

```text
display: 只给真正首屏 hero 或沉浸式页面用
page-title: 页面对象或任务名
section-title: 分区标题
body: 正文和表单内容
label: 表单标签、表头、tab
caption: 辅助信息、时间、元信息
button: 动作文字
```

工作型产品默认不要用超大标题。页面标题要短，section 标题要能扫描，正文不要成为说明书。

中文 UI 建议:

- 页面标题 4 到 8 个汉字优先。
- tab 标签 2 到 4 个汉字优先。
- 按钮用动词短语，例如“生成草稿”“锁定定位”“发布”。
- 行高不要太挤，正文推荐 1.45 到 1.7。
- 不用负字距；中文界面更容易显脏。

## 布局系统

页面必须有稳定网格:

```text
基础间距: 4px
常用间距: 8 / 12 / 16 / 24 / 32 / 48
页面边距: desktop 24-40，mobile 16
内容宽度: 表单和阅读区设置 max-width
工具栏: 高度固定，按钮尺寸统一
卡片: 只用于重复对象、详情块、弹窗，不做卡片套卡片
```

布局要先保证“舒服”和“可扫描”:

- 上下留白服务分组，不要随机空洞。
- 左右对齐要稳定，表单 label、输入框、操作区不能漂。
- 主内容、右侧状态栏、底部动作区要有明确职责。
- 一屏内不要同时出现太多不同尺寸的卡片。
- hover、loading、错误文案不能推歪布局。

## 组件状态色

每个可交互组件必须覆盖:

```text
default
hover
active
focus
selected
disabled
loading
success
error
```

状态表达优先级:

```text
位置 / 图标 / 文案 / 色彩
```

不要只靠颜色表达状态。颜色必须配合图标、形状、badge、边框或文字。

## Codex 生成前端前必须输出

当任务涉及视觉改造、从零做 UI、用户反馈“不舒服/业余/乱”时，先输出这四张表:

```text
1. 色彩角色表: token / 色值 / 用途 / 使用限制
2. 字体层级表: token / size / line-height / weight / 使用位置
3. 布局网格表: 页面边距 / 栅格 / gap / max-width / 响应式断点
4. 状态映射表: success / warning / danger / info / disabled / selected
```

然后再写代码或改 CSS。

## 视觉 QA

交付前逐项检查:

- 页面有没有完整 token，而不是散落裸色值。
- 主色、辅助色、状态色是否职责清楚。
- 60 / 30 / 10 比例是否成立。
- light / dark 或单模式策略是否明确。
- 主按钮、危险按钮、成功状态不会互相混淆。
- 页面是否显得一色到底。
- 字号层级是否过多。
- 对齐、留白、间距是否有规律。
- 移动端文字、按钮、tab、卡片不重叠、不截断。
- 截图看起来像成熟产品，而不是拼贴 demo。

## 可直接给 Codex 的约束句

```text
在写前端前，先产出色彩 token、字体层级、布局网格和状态映射。不要在组件里散落裸 hex。配色遵循低饱和专业色卡、60/30/10 比例、语义状态色和 WCAG AA 对比度。页面不要全靠一种色相或大面积渐变，布局要有稳定栅格、对齐、留白和响应式规则。
```
