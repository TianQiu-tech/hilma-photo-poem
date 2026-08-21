# 4:3 抽象画面板提示规范

使用上传照片作为唯一的内容关系来源，生成一张独立、层次丰富、色块厚实的横向 4:3 抽象画。不要生成拼接成品，不要重画照片，不要加入画框、墙面或文字。

## 从照片提炼什么

先在内部识别三至六个最重要的视觉事实：主体之间的距离与大小、主方向、重复节奏、遮挡关系、明暗层级、运动趋势、负空间与关键色彩。再判断哪些关系值得保留、哪些空间信息会妨碍创作。允许删除、移位或重组地平线、透视、物体位置和轮廓，将少数关键事实转译成一套新的抽象关系。

同时建立原图色彩地图：记录占比最大的底色或环境色、主要次色、最深结构色、最浅中性色和小面积强调色。生成结果必须保留这些颜色的大致面积顺序、冷暖关系和明暗角色。

抽象画必须让人先感到它是一幅完整作品，随后才隐约感到它与原照片共享同一种结构和情绪。不要画成照片缩略图、线稿、扁平插画或滤镜效果。

## 视觉语言

以 Hilma af Klint 作品中常见的“关系语法”为参考，而非复制具体作品或罗列标志性图形：

- 先从照片选择一种主导感受或关系：分割、镜像、穿越、包围、生长、汇合、递进、相向或背离。再选择最能传神表达它的几何。圆形可以成为主角，但必须有作用与后果，而不是单纯证明风格出处。
- 圆、椭圆、种子状、细胞状、螺旋和植物性曲线可以与直线、中心轴、分区、阶梯、网格、三角、楔形和带状结构自由组合。不得为任一形状家族设定百分比或数量配额。
- 用尺度差、方向、间距、嵌套、交叠、切割、相遇、分离、升降和反向运动表达照片中的关系。每个元素必须与至少一个其他元素发生可解释的结构关系，避免散落的装饰图标。
- 构图兼具图解般的秩序与手绘的直觉。允许近似对称，但保留照片带来的偏移、停顿和不均衡。
- 使用高颜料覆盖的不透明蛋彩或水粉质感：色块平整、浓实、哑光，可见轻微手绘刷痕，但不能像稀释水彩一样发白、透明或纸底透出。
- 使用 5–8 色。完整画底必须来自原图占比最大的环境色或中性色；其他色彩也从原图的主色、暗部、亮部和强调色中提取，再通过提高不透明度、适度加深或拉开明度差获得浓郁感。不得因为风格参考中有深蓝、橙红或粉色，就把原图没有占主导的颜色升级为背景或最大色块。
- 允许粗细不同的奶油白、赭黄或橙色线条把多个母题连成系统；线条必须服务于照片关系，不写字母或伪神秘符号。

这些形式只作为形式语言。不要复制《The Ten Largest》《The Swan》《Altarpieces》等任何具体作品的构图；不要照搬字母、花朵、天鹅、金字塔或已有神秘学符号；不要伪造艺术家的签名或题字。为当前照片创造新的、无文字的关系系统。

不要把“两性”理解为浪漫配对或人物身份标签。在 af Klint 的体系中，更有用的生成启发是互补原则、分裂与统一、差异中的平衡，以及从一个状态向另一状态的演化。除非照片自身明确支持，否则不要机械套用蓝/黄、男女、阴阳或对称双圆。通过两块不同尺度或材质的场、两条相向轴线、交叠后出现的第三形、上下镜像中的偏差等方式表现关系，更贴近她的构图思维。

## 抽象画构图

- 尺寸与比例：横向 4:3，建议 1440 × 1080 或 1080 × 810。
- 使用一个主关系系统和 2–6 个辅助结构，共同覆盖画面约 68%–88%。主系统应包含方向、分层、转化或内外关系，不能只是一个简单圆标。
- 负空间主要来自完整的源图主导色画底，不来自大片未画的纸。画底可以是暖石色、灰绿、天空灰蓝、炭灰或其他原图支持的颜色，不默认使用深蓝。让源图支持的直线、色带、网格、楔形、弧线或有机块面产生遮挡、相遇、尺度差与节奏。
- 构图可以居中、偏移、镜像或分区。照片关系是起点，不是几何模板；若地平线、建筑、道路或透视结构令画面僵硬，可舍弃这些空间对应，改用源图的色彩分量、冷暖、明暗、密度与运动感组织全新形体。允许大胆使用圆形，但避免互不关联的圆点库存、机械曼陀罗和装饰性边框。
- 不需要为文字预留底栏。文字、画框和墙面由后续合成脚本生成。
- 不出现任何文字、数字、日期、logo、水印、画框、阴影、墙面或室内样机背景。

## 个人风格参考

使用 `assets/style-references/` 中的图片仅校准以下特征：

- 完整、厚实的有色画底；具体色相必须由当前原图决定。
- 不透明、饱和、厚实但仍平面的色块。
- 大小差明显且互相关联的直线结构、有机块面、圆弧或细胞形；具体组合由当前照片决定。
- 奶油白、粉红、橙、黄、蓝绿之间的高对比。
- 可见轻微手绘边缘和刷痕，而非光滑矢量或数字渐变。

不要复刻参考图的花朵、人物、文字、字母、具体几何布局或神秘学符号。

## 可直接交给生图模型的核心提示

```text
Use case: stylized-concept
Asset type: richly layered abstract artwork that will later be mounted inside a frame
Primary request: Create an original landscape 4:3 abstract painting derived from the supplied photograph's color relationships, mood, directional energy, rhythm, light, and a few selected spatial cues. First choose a relational grammar—division, mirroring, passage, enclosure, growth, convergence, progression, opposition, or integration—then build one connected primary system and 2–6 supporting structures. Choose freely among circles, ovals, spirals, cellular forms, botanical curves, straight axes, bands, grids, steps, triangles, wedges, and repeated measures. Circles may be prominent when they carry transformation, integration, pairing, containment, or life rhythm. Preserve photo kinship without requiring literal spatial correspondence. Evoke Hilma af Klint's geometric-organic and diagrammatic thinking without copying any specific artwork or established symbol arrangement.
Input image: the photograph is a visual reference for relationships and palette only; do not reproduce it literally and do not edit it.
Style/medium: high-pigment opaque matte tempera or gouache, solid flat painted ground, dense non-translucent color blocks, subtle brush marks and hand-painted edges, diagrammatic order balanced with organic motion. No pale watercolor wash and no paper showing through.
Composition: landscape 4:3; one connected relational system plus 2–6 supporting structures; forms collectively cover about 68–88% of the painting; use direction, division, overlap, scale contrast, measured repetition, and transformation. Every major element must affect, answer, cross, contain, or develop from another element. Spatial structure may be discarded or reorganized when it interferes with a stronger painting; maintain continuity with the photograph through palette hierarchy, temperature, value, mood, directional energy, and recurring accents. No dedicated text strip.
Color palette: build a 5–8 color map from the photograph first. The largest source color role determines the painted ground; preserve the source's approximate hue-area hierarchy, temperature, and value relationships. Intensify by increasing opacity, depth, and value separation—not by importing a dominant hue from style references. Use only source-supported accent colors.
Constraints: original photo-specific relational system; source photo is authoritative for palette hierarchy, mood, temperature, value roles, and selected relational cues, but not for complete spatial structure; no unsupported dominant background hue; no wholesale palette or motif transfer from style references; absolutely no numeric quota for straight, angular, round, organic, or any other shape family; relationships over recognizable silhouettes; no single simple logo motif; no literal objects; do not assign gender or spiritual meaning to photographed people or places; no copied reference composition, flowers, figures, letters, title, signature, or esoteric symbols; no text, numbers, logo, watermark, border, frame, wall, room mockup, translucent wash, neon glow, photorealism, or digital 3D effects.
```

