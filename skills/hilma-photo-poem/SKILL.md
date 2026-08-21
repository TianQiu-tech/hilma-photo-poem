---
name: hilma-photo-poem
description: Transform one photograph into a 9:16 vertical editorial diptych that keeps the photo above and presents a richly layered, opaque photo-derived symbolic abstract painting in a refined frame on a solid-color wall below, with a short English poetic line. Use for Hilma af Klint-inspired photo abstractions or framed photo-and-art compositions; do not use to copy a specific artwork.
---

# Hilma Photo Poem

Create one finished 9:16 image from one supplied photograph. Preserve the photograph as photography; derive a new lower painting from its relationships using the geometric, organic, diagrammatic, and spiritual visual language associated with Hilma af Klint.

## Required method

1. Inspect the source photograph. Internally identify three to six decisive visual facts, then decide which relationships are essential and which spatial details may be discarded for a stronger painting. Build a source color map: the dominant ground/field color, major secondary colors, dark structural color, light neutral, and any small accent. Preserve their approximate area hierarchy, temperature, and light-dark roles.
2. Write one original English poetic phrase grounded in those visible facts. Prefer two short lines totaling 4–10 words. Avoid place labels, art commentary, slogans, and vague words that could fit any photo.
3. Read [references/relational-grammar.zh-CN.md](references/relational-grammar.zh-CN.md) and [references/abstract-panel-prompt.zh-CN.md](references/abstract-panel-prompt.zh-CN.md), then generate only one richly layered 4:3 abstract artwork with the built-in image generation tool. Treat the photo as the authority for palette, color proportions, mood, light-dark roles, and selected relational cues—not as a demand to preserve its full spatial structure. Use `assets/style-references/` only for opacity, layering, mark language, and hand-painted character. Generate no frame, wall, or text; those are added deterministically.
4. Inspect the artwork. Reject it if it depicts recognizable objects literally, copies a reference composition, contains text, reduces the source to one simple logo-like motif, uses washed-out translucent color, or introduces a dominant hue/background that is not supported by the source photo.
5. Compose rather than regenerate the final image. Resolve `scripts/compose.swift` relative to this `SKILL.md`, then invoke it by absolute path to place the source photo above a solid-color wall, mount the abstract artwork inside a refined frame and mat, and typeset the exact poem below it. Reuse the same abstract asset for layout revisions instead of generating again.
6. Return the single completed image and its saved path. Do not return analysis, alternate poems, prompt notes, or intermediate panels unless the user asks.

## Layout invariants

- Final canvas: exactly 9:16, default 1080 × 1920.
- Lower wall panel: exactly 4:3 across the full canvas width, 1080 × 810, occupying 42.1875% of total height.
- Upper photo slot: 1080 × 1110, occupying the remaining 57.8125%.
- Separate the two regions with a clean color boundary: the photo stays photographic while the lower region is a uniform warm neutral wall sampled to harmonize with the photo.
- Keep the photo pixel-faithful. Default to `--photo-mode fit` so nothing is cropped; use `fill` only when the user accepts a crop or the crop is visibly harmless.
- Place the abstract artwork in a restrained dark-wood or muted-metal frame with an ivory mat. The framed work should occupy about 54%–62% of the lower panel width, leaving generous wall around it.
- Use only a subtle natural frame shadow. Exclude staged furniture, floors, lamps, plants, gallery signage, and photorealistic room decoration.
- Put the English poem on the wall below the frame. Never render it inside the generated artwork or over the photograph.
- Keep whitespace at the poster and wall level. Inside the frame, favor substantial opaque color coverage, layered motifs, and a complete painted ground rather than a mostly blank paper field.
- Richness means stronger opacity, value separation, and relational layering within the source-derived palette. It does not authorize replacing the source's dominant hues with the style references' colors. Circles may be prominent when they create a convincing life rhythm, transformation, pairing, or integration; they must not be inserted merely as a style badge.

## Composition command

Run on macOS with no third-party dependency:

```bash
swift /absolute/path/to/hilma-photo-poem/scripts/compose.swift \
  --photo /absolute/path/source.jpg \
  --abstract /absolute/path/abstract-panel.png \
  --output /absolute/path/final.png \
  --line1 "Between the cliffs" \
  --line2 "the sea keeps its blue" \
  --panel-style framed \
  --photo-mode fit
```

Omit `--line2` when unnecessary. Use a new output filename instead of overwriting an existing file unless replacement was explicitly requested.

If Swift cannot write its default module cache in a sandbox, create `/private/tmp/hilma-photo-poem-swift-cache` and run the same command with both `CLANG_MODULE_CACHE_PATH` and `SWIFT_MODULECACHE_PATH` set to that directory.

## Guardrails

- The source photo supplies the content and compositional relationships; the artist reference supplies only a visual grammar.
- Do not reduce af Klint's visual grammar to a recognizable motif kit, but do not suppress her strong use of circles either. Choose freely among circles, ovals, spirals, botanical growth, lines, bands, axes, grids, triangles, and arcs. Judge forms by how subtly they connect, transform, balance, or generate one another—not by their percentage or literal correspondence to the photograph.
- Never impose a numeric quota for straight, angular, round, organic, or any other shape family.
- When literal spatial fidelity would make the result stiff or illustrative, discard it. Maintain kinship with the photograph through palette hierarchy, temperature, value, mood, directional energy, repeated accents, and a few carefully chosen relationships.
- Treat polarity as a compositional relationship between complementary forces moving toward balance or wholeness, not as a fixed male/female color code and not as a claim about the photographed subject.
- Use [assets/style-references](assets/style-references) to calibrate pigment density, contrast, layering, and hand-painted character only. Never transfer their palette wholesale or reproduce their subjects, exact geometry, letters, figures, or symbol arrangements.
- Do not reproduce, trace, or closely paraphrase any specific Hilma af Klint painting, title, letter sequence, or esoteric symbol arrangement.
- Do not invent symbolic meanings for people or personal events. Use shapes relationally, not as claims about the subject.
- Do not redraw, retouch, extend, filter, recolor, or otherwise alter the photographic region.
- Do not ask the image model to render the wall, frame, mat, or final poem; these are fast deterministic layout elements.
- If a usable local path for the source image is unavailable, ask the user to attach or provide the file rather than silently accepting a regenerated approximation.

