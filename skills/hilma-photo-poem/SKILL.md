---
name: hilma-photo-poem
description: "Transform one photograph into a high-resolution 9:16 editorial diptych: the untouched photo fills the upper region and a photo-derived, Hilma af Klint-informed abstract painting appears in a refined frame below with a short English poem. Use for symbolic photo abstraction; never copy a specific artwork."
metadata:
  version: "2026-08-21"
---

# Hilma Photo Poem

Create one 2160 × 3840 PNG from one supplied photograph. Preserve the upper photograph as photography. Build the lower artwork from the current photograph and Hilma af Klint's conceptual grammar, not from previous generated images.

## Workflow

1. Inspect the photograph. Identify its strongest tension, directional rhythm, value structure, and color hierarchy. Decide which relationships matter and which spatial facts may be discarded.
2. Read [references/relational-grammar.zh-CN.md](references/relational-grammar.zh-CN.md), then choose one theoretical operation: polarity moving toward integration, evolution through stages, reciprocal transformation, or nature becoming measured spiritual order.
3. Privately consider two or three formal realizations inside af Klint's geometric-organic and diagrammatic grammar. Choose the one with the clearest inner necessity, not the one that most literally traces the photograph.
4. Read [references/abstract-panel-prompt.zh-CN.md](references/abstract-panel-prompt.zh-CN.md). Generate one landscape 4:3 abstract panel with the built-in image-generation tool. Supply the current photograph and, when useful, one or two actual Hilma works from `assets/style-references/`. Label those works as language references only and forbid copying their composition, palette, symbols, letters, or figures.
5. Inspect the abstract panel. It must be an autonomous painting with a connected geometric-organic system, opaque matte color fields, and visible transformation. Reject literal illustration, generic expressionism, cosmic biomorphism, free surrealism, purely Bauhaus geometry, decorative sacred geometry, copied motifs, text, translucent wash, unsupported dominant hues, or a simple logo-like composition. Allow at most one targeted regeneration for a specific failure.
6. Write one photo-specific English poem, preferably two lines totaling 4–10 words. Avoid place labels, art commentary, slogans, and generic spiritual language.
7. Compose the final image with `scripts/compose.swift`; do not ask the image model to render the photo, wall, frame, mat, or poem. The script automatically derives the wall, frame, mat, and poem colors from the accepted abstract panel. Reuse the accepted abstract panel for layout revisions.
8. Inspect the final PNG and verify: exactly 2160 × 3840; the original photograph touches all four edges of the upper slot; no generated pixels occur in the photographic region; the lower artwork remains 4:3; poem spelling and line breaks are correct.
9. Return only the completed image and saved path unless the user asks for process notes.

## Non-negotiable creative hierarchy

1. Hilma's theory determines the operation.
2. The current photograph determines content, palette hierarchy, mood, value roles, and relational cues.
3. Actual Hilma references calibrate formal language and material character.
4. Prior outputs never influence generation. Do not inspect or pass completed diptychs, prior abstracts, or user-approved examples to the image model.

Innovation must occur inside the grammar: invent a transition, intermediary, reversal, scale progression, or geometric-to-organic change that the current photograph supports. Do not chase novelty through arbitrary disruption. Do not optimize toward a house style formed by previous outputs.

Circles, ovals, spirals, botanical growth, axes, partitions, bands, grids, triangles, wedges, and arcs are all available. Use any of them boldly when they cause transformation, containment, progression, pairing, or integration. Never impose a numeric quota on any shape family.

## Layout invariants

- Canvas: 2160 × 3840 PNG, exactly 9:16.
- Upper photo slot: 2160 × 2220. Default `--photo-mode fill`; use `--photo-anchor top|center|bottom` to protect the subject. `fit` is allowed only when the user explicitly accepts visible margins.
- Lower wall panel: 2160 × 1620, exactly 4:3 across the full width. Its uniform color is derived from the abstract panel's dominant hue with deliberate lightness contrast: predominantly dark artwork receives a light related wall; predominantly light artwork receives a dark related wall.
- The framed artwork occupies about 54%–62% of the lower width, with a restrained color-adaptive frame, a high-contrast near-neutral mat, subtle shadow, and generous wall. The frame may shift within the artwork's hue family but must remain quieter than the painting.
- Poem color follows wall luminance: dark lettering on a light wall; soft white lettering on a dark wall. Preserve readable contrast without pure black or glaring white.
- The poem sits on the wall below the frame. No furniture, floor, lamps, plants, gallery signage, or room mockup.
- The photographic region may be cropped and resampled only. Never regenerate, extend, filter, retouch, or recolor it.

## Composition command

```bash
swift /absolute/path/to/hilma-photo-poem/scripts/compose.swift \
  --photo /absolute/path/source.jpg \
  --abstract /absolute/path/abstract-panel.png \
  --output /absolute/path/final.png \
  --line1 "Between the cliffs" \
  --line2 "the sea keeps its blue" \
  --panel-style framed \
  --photo-mode fill \
  --photo-anchor center
```

If Swift cannot write its module cache, use `/private/tmp/hilma-photo-poem-swift-cache` for both `CLANG_MODULE_CACHE_PATH` and `SWIFT_MODULECACHE_PATH`.
