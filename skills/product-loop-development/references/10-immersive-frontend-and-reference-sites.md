# 沉浸式前端与参考网站

## 一句话原则

酷炫前端不是把 UI 做花，而是把品牌叙事、空间感、动效、实时图形、声音或交互反馈组织成一个稳定可用的体验。

## Active Theory 这类站为什么酷

观察 `https://activetheory.net/work` 的页面结构和资源信号:

- 页面是全屏 `#Stage` 应用，不是普通文档流页面。
- `body/html/#Stage` 都是 `100%` 高度、黑色背景、隐藏普通 overflow。
- JS 入口是单个大型应用 bundle，约 1.8MB。
- 数据配置里有大量 `CAMERA_*`、`Shader`、`Particles`、`PBR`、`matcap`、`KTX2`、`Bloom`、`Composite` 参数。
- 它使用定制字体、压缩纹理、相机 lerp、鼠标/滚动驱动、后期处理和可调 shader 参数。

结论: 这种效果接近“实时 3D 引擎 + 网站导航”，不是传统 CSS 动画堆叠。

## 常见技术栈

可用组合:

```text
Three.js / React Three Fiber
GSAP / Framer Motion
Lenis / 自定义 smooth scroll
GLSL shader
KTX2 / Basis 压缩纹理
GLTF / Draco / Meshopt
Canvas 2D / WebGL particles
Postprocessing: bloom, depth, distortion, chromatic aberration
Web Audio / pointer interaction
```

不推荐一开始就全上。先确定体验目标，再选技术。

## 可实现等级

### Level 1: 高级 Web 动效

- 滚动触发。
- 视差。
- 页面转场。
- 大图/视频 hover。
- 光标反馈。
- 文案和图像入场动画。

适合产品官网、作品集、轻量 landing。

### Level 2: Canvas/WebGL 视觉层

- 背景粒子。
- 鼠标驱动噪声/流体/折射。
- WebGL 图片变形。
- 3D 卡片/物体。
- 自定义 shader。

适合品牌官网、活动页、AI 产品展示页。

### Level 3: 实时 3D 站点

- 3D 场景作为主导航。
- 相机路径和页面状态绑定。
- 3D 模型、材质、光照、后期处理。
- 资源预加载、降级、性能监控。

适合大型 campaign、studio 官网、艺术化作品集。成本高，需要资产、动效导演和性能预算。

## 设计红线

- 不要为酷而酷。每个动效必须服务品牌、内容或导航反馈。
- 不要牺牲可读性。文字不能被 3D、粒子、光效遮挡。
- 不要把工作型 SaaS 做成重 WebGL 站，除非只是营销页。
- 不要一上来做完整 3D 引擎。先做一个 hero/section 原型验证审美。
- 必须有低性能设备降级: 静态 poster、视频 fallback、减少粒子、关闭后期。
- 必须有 `prefers-reduced-motion` 处理。
- 移动端要有独立设计，不要直接缩小桌面 3D。

## 实现流程

1. 定义体验关键词: 例如 dark、cinematic、spatial、tactile、editorial。
2. 收集 5 到 10 个参考站，标注喜欢/不喜欢的点。
3. 做 motion board: 首屏、滚动、hover、转场、加载、失败降级。
4. 先做一个 10 到 20 秒的可交互原型。
5. 定性能预算: bundle、纹理、FPS、移动端 fallback。
6. 再进入真实页面和内容生产。
7. 用截图、录屏和实际设备 QA，不只看代码。

## 参考网站清单

### 创意技术 / WebGL / 沉浸式

- Active Theory: `https://activetheory.net/work`
- Lusion: `https://lusion.co/`
- Bruno Simon: `https://bruno-simon.com/`
- Resn: `https://resn.co.nz/`
- Immersive Garden: `https://immersive-g.com/`
- Unseen Studio: `https://unseen.co/`
- Dogstudio: `https://dogstudio.co/`
- Hello Monday: `https://www.hellomonday.com/`
- makemepulse: `https://www.makemepulse.com/`
- Ouchhh: `https://ouchhh.tv/`

### 高级品牌 / 编辑感 / 视觉叙事

- Build in Amsterdam: `https://www.buildinamsterdam.com/`
- Locomotive: `https://locomotive.ca/`
- Monopo: `https://monopo.london/`
- Instrument: `https://www.instrument.com/`
- Pentagram: `https://www.pentagram.com/`
- Collins: `https://www.wearecollins.com/`

### 案例库

- Awwwards: `https://www.awwwards.com/`
- The FWA: `https://thefwa.com/`
- CSS Design Awards: `https://www.cssdesignawards.com/`
- SiteInspire: `https://www.siteinspire.com/`
- Godly: `https://godly.website/`
- Land-book: `https://land-book.com/`

## 偏好记录模板

看每个参考站时记录:

```text
网站:
链接:
喜欢:
不喜欢:
可借鉴:
不要学:
适合用在:
动效强度: 低 / 中 / 高
技术复杂度: CSS / Canvas / WebGL / 3D
移动端表现:
对我们产品的启发:
```

## 给 Codex 的执行约束

当用户要求“像 Active Theory 那样酷”时:

1. 先问或推断它是营销页、作品集、产品官网还是工作型应用。
2. 先做参考分析，不直接写完整站。
3. 先交付一个小范围交互原型。
4. 对 WebGL/3D 明确资源、性能和移动端降级。
5. 如果是实际产品界面，优先保留产品闭环和可读性，只在品牌层/hero/展示层做沉浸效果。
