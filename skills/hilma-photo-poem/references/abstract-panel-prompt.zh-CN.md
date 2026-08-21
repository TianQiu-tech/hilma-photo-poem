# 4:3 抽象面板生成规范

只生成一张独立的横向 4:3 抽象画。不要生成拼接成品，不要重画照片，不要加入画框、墙面、文字、标志或水印。

## 生成前的决定

先从当前照片提炼：最强张力、主方向、重复或突变、明暗角色、密度变化，以及主色/次色/最深色/最亮色/小面积强调色。随后选择一个 af Klint 理论操作：

- 两种状态经过差异与交叠走向整合；
- 一个形态经过可见阶段演化；
- 两个系统相遇并共同产生第三种状态；
- 自然生长转为可测量的精神秩序。

在这套理论内先设想两至三种形式实现，再选择内在关系最清楚的一种。照片是内容、色彩、情绪和关系的唯一权威；不要求保留完整透视、地平线、轮廓或物体位置。

## 画面标准

- 一套会产生后果的主关系系统；辅助结构按作品需要出现，不设数量或覆盖率。
- 图解秩序与生命生长必须同时存在。只有规则几何会滑向现代主义海报；只有有机形会滑向泛生物或超现实抽象。
- 圆、椭圆、螺旋、种子、细胞、植物曲线、直轴、分区、色带、网格、阶梯、三角、楔形和弧线均可自由使用。形体必须彼此穿过、支撑、分割、包围、镜像、汇合或演化，不能成为装饰库存。
- 允许大胆圆形、偏心、未闭合、尺度突变和非对称，但必须由当前转化过程产生；不得把“做得怪”当作创意。
- 使用厚实、不透明、哑光的蛋彩或水粉质感，完整有色画底，平面色块，轻微手绘边缘与刷痕。避免稀薄水彩、纸底透出、数字渐变、霓虹光和 3D 效果。
- 色彩取自原图并保留面积顺序、冷暖和明暗角色。用不透明度、深度和明度分离增强力量；保留一组原图支持的决定性张力，不把色彩平均成安全的中间值，也不从参考图借来新的主导背景色。
- 第一眼应是一幅自主完整的画，第二眼才通过色彩、节奏和少数关系与照片相认。不要画成照片的几何缩略图。

## 参考层级

生图输入只能包含：当前照片，以及至多一至两张 `assets/style-references/` 中的真实 Hilma 作品。真实作品只校准几何—植物语法、颜料密度、平面色场、手绘边缘和序列关系；不得复制构图、配色、字母、人物、花朵或神秘符号。

绝不输入过去生成的抽象画、完成拼图或“成功案例”。每次必须从当前照片和 Hilma 理论重新推导。

## 核心英文提示

```text
Use case: stylized-concept
Asset type: original landscape 4:3 abstract painting for later deterministic framing
Primary request: Interpret the supplied photograph through one operation inside Hilma af Klint's conceptual framework: polarity moving toward integration, evolution through stages, reciprocal transformation that produces a third state, or natural growth becoming measured spiritual order. Privately consider two or three formal realizations, then choose the one with the clearest inner necessity. Build one connected geometric-organic and diagrammatic system whose forms visibly affect and transform one another. Innovation must arise from a source-supported intermediary, reversal, scale progression, sequence, or transition between geometric and botanical/cellular states.
Source authority: The current photograph alone determines content, palette hierarchy, mood, temperature, value roles, directional energy, and relational cues. Preserve kinship without literal spatial correspondence; perspective, horizon, silhouettes, and object positions may be reorganized or discarded.
Formal language: Choose freely among circles, ovals, spirals, seed and cellular forms, botanical curves, axes, partitions, bands, grids, steps, triangles, wedges, arcs, and measured repetition. Every major form must cross, support, divide, contain, answer, merge with, or develop from another. Diagrammatic clarity is the skeleton and living growth is the animation. No numeric quota for any shape family.
Medium and color: High-pigment opaque matte tempera or gouache; complete painted ground; flat non-translucent fields; restrained brush marks and hand-painted edges. Build a source-derived color map and preserve approximate hue-area hierarchy, temperature, and light-dark roles. Keep one decisive source-supported contrast alive. Intensify with opacity, depth, and value separation, never by importing a dominant hue from references.
Reference hierarchy: Use at most one or two supplied Hilma works only to calibrate formal grammar and material character. Do not copy their composition, palette, symbols, letters, figures, or motifs. Never use prior generated images or completed diptychs as references.
Reject: literal objects; copied artwork; expressionistic clouds or explosions; generic cosmic biomorphism; free-form surrealism; purely Bauhaus geometry; decorative sacred geometry; static symbol inventories; logo-like simplicity; unsupported dominant hues; text, numbers, signature, watermark, border, frame, wall, room mockup; translucent wash, atmospheric blur, neon glow, photorealism, or digital 3D effects.
```
