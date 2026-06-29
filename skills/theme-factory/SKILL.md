---
name: theme-factory
description: Toolkit for styling artifacts with a theme. These artifacts can be slides, docs, reportings, HTML landing pages, etc. There are 10 pre-set themes with colors/fonts that you can apply to any artifact that has been creating, or can generate a new theme on-the-fly.
license: Complete terms in LICENSE.txt
---


# Theme Factory Skill

This skill provides a curated collection of professional font and color themes themes, each with carefully selected color palettes and font pairings. Once a theme is chosen, it can be applied to any artifact.

## Purpose

To apply consistent, professional styling to presentation slide decks, use this skill. Each theme includes:
- A cohesive color palette with hex codes
- Complementary font pairings for headers and body text
- A distinct visual identity suitable for different contexts and audiences
- Guidance for when branded backgrounds, illustrations, covers, social previews, template thumbnails, or other bitmap visuals should be generated with GPT image generation instead of approximated with HTML/CSS/SVG placeholders.

## Usage Instructions

To apply styling to a slide deck or other artifact:

1. **Show the theme showcase**: Display the `theme-showcase.pdf` file to allow users to see all available themes visually. Do not make any modifications to it; simply show the file for viewing.
2. **Ask for their choice**: Ask which theme to apply to the deck
3. **Wait for selection**: Get explicit confirmation about the chosen theme
4. **Apply the theme**: Once a theme has been chosen, apply the selected theme's colors and fonts to the deck/artifact

## Themes Available

The following 10 themes are available, each showcased in `theme-showcase.pdf`:

1. **Ocean Depths** - Professional and calming maritime theme
2. **Sunset Boulevard** - Warm and vibrant sunset colors
3. **Forest Canopy** - Natural and grounded earth tones
4. **Modern Minimalist** - Clean and contemporary grayscale
5. **Golden Hour** - Rich and warm autumnal palette
6. **Arctic Frost** - Cool and crisp winter-inspired theme
7. **Desert Rose** - Soft and sophisticated dusty tones
8. **Tech Innovation** - Bold and modern tech aesthetic
9. **Botanical Garden** - Fresh and organic garden colors
10. **Midnight Galaxy** - Dramatic and cosmic deep tones

## Theme Details

Each theme is defined in the `themes/` directory with complete specifications including:
- Cohesive color palette with hex codes
- Complementary font pairings for headers and body text
- Distinct visual identity suitable for different contexts and audiences

## Application Process

After a preferred theme is selected:
1. Read the corresponding theme file from the `themes/` directory
2. Apply the specified colors and fonts consistently throughout the deck
3. Ensure proper contrast and readability
4. Maintain the theme's visual identity across all slides
5. When the artifact needs a background image, illustration, cover image, social preview, template thumbnail, or brand atmosphere visual, write a short image brief from the chosen theme and use GPT image generation to create a bitmap asset. Save the generated asset into the project before referencing it. Use SVG/HTML/CSS only for deterministic icons, diagrams, layout primitives, or assets that must remain code-editable.

## Product UI Styling Defaults

For product prototypes, default to a ToC / prosumer creator-tool feel unless the user explicitly asks for ToB, admin, enterprise dashboard, or internal operations tooling:

- Use visual anchors such as generated backgrounds, template covers, result previews, empty-state illustrations, and success visuals.
- Treat a lightweight IP/mascot or creator companion as a standard optional brand asset for ToC creator tools when it can make the product feel warmer and more memorable. Generate it with GPT image generation as a reusable bitmap asset, then place it into the project asset directory before referencing it.
- Prepare more than one product image when the flow has multiple stages. At minimum, consider assets for the entry/goal hub, inspiration library, immersive editor, publish/review, empty state, and social preview.
- Avoid making every surface a grid of equal cards, KPI tiles, tables, and sidebar menus.
- Use spacing, scale, imagery, and a single clear primary action to guide attention.
- Keep management, settings, logs, data sources, and debug-like controls behind secondary navigation or disclosure.
- For creator tools, make the first screen feel like a place to start creating, not a place to administer records.

## Create your Own Theme
To handle cases where none of the existing themes work for an artifact, create a custom theme. Based on provided inputs, generate a new theme similar to the ones above. Give the theme a similar name describing what the font/color combinations represent. Use any basic description provided to choose appropriate colors/fonts. After generating the theme, show it for review and verification. Following that, apply the theme as described above.
