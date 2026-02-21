# KitchenLens Design System Audit

## Overview
This document outlines the core design tokens and components extracted from the KitchenLens HTML designs and implemented in the Flutter application.

## 1. Color Palette (`AppColors`)

### Primary Identity
- **Primary Green:** `#19e65e` (Used for CTAs, active states, glowing accents)

### Light Mode (`ThemeMode.light`)
- **Background:** `#f6f8f6` (Off-white with a slight green tint)
- **Surface:** `#ffffff` (Pure white for cards)
- **Surface Variant:** `#f0f3f0` (Slightly darker surface for input fields or secondary cards)
- **Text Main:** `#112116` (Deep forest green, almost black, for high contrast readability)
- **Text Secondary:** `#4a5e50` (Muted green-grey for secondary information)

### Dark Mode (`ThemeMode.dark`)
- **Background:** `#112116` (Deep forest black)
- **Surface:** `#1b2f21` (Slightly lighter forest dark for cards)
- **Surface Variant:** `#253d2d` (For borders or elevated inputs)
- **Text Main:** `#ffffff` (Pure white)
- **Text Secondary:** `#a0b3a6` (Muted light green-grey)

### Glassmorphism Tokens
- **Glass Background Light:** `Colors.white.withOpacity(0.5)` + BackdropFilter (`sigma: 10`)
- **Glass Background Dark:** `Colors.black.withOpacity(0.5)` + BackdropFilter (`sigma: 10`)
- **Glass Border Light:** `Colors.white.withOpacity(0.5)`
- **Glass Border Dark:** `#253d2d`

## 2. Typography (`AppTheme` textTheme)
The application uses the **"Manrope"** Google Font globally for its clean, modern, and readable geometric characteristics.

- **Display Large:** `32px, w800` (Hero Headers)
- **Display Medium:** `28px, w800` (Screen Headers, Greetings)
- **Display Small:** `24px, w700` (Section Titles)
- **Title Large:** `20px, w700` (Card Titles)
- **Title Medium:** `16px, w600` (Subtitles, Core Content)
- **Body Large:** `16px, w400` (Standard Body text)
- **Body Medium:** `14px, w400` (Secondary text)
- **Body Small:** `12px, w400` (Captions, Metadata)
- **Label Large:** `14px, w600` (Button Text)

## 3. Spacing & Dimensions (`AppDimensions`)
A 4-point grid system is utilized.

- **`xs`:** 4.0
- **`sm`:** 8.0
- **`md`:** 16.0
- **`lg`:** 24.0
- **`xl`:** 32.0
- **`xxl`:** 48.0
- **`xxxl`:** 64.0
- **`screenPadding`:** 20.0 (Global horizontal edge padding)

## 4. Border Radii
Extensive use of heavily rounded corners for a friendly, modern aesthetic.

- **`radiusSm`:** 8.0
- **`radiusMd`:** 16.0
- **`radiusLg`:** 24.0
- **`radiusMax`:** 9999.0 (Fully rounded pills/circles)

## 5. UI Components & Patterns

### Buttons
- **Filled CTAs:** Use `AppColors.primary` with dark text (`#112116`), `radiusMax`, padding `16px` vertically.
- **Glass Buttons:** Circular (`48x48`), transparent white/black background with backdrop blur, used primarily for navigation (Back, Save, Flash, Settings).
- **Toggle Pills:** Active states highlight with solid colored backgrounds, inactive text is muted.

### Hero Images & Overlays
- Found in Onboarding, Capture, Processing, and Recipe Detail screens.
- Implement fading gradients from transparent to background color to blend text seamlessly over imagery.

### Animations (`flutter_animate`)
- **Staggered Entry:** Lists and cards slide up (`slideY`) with a slight fade (`fadeIn`) with staggered delays (`(index * 100).ms`).
- **Pulsing/Glowing:** The Processing screen uses repeated scaling and shadow spreading to replicate the "KitchenLens AI" analytical glow.

## 6. Iconography
The application uses `lucide_icons_flutter` to replicate the clean, line-art SVG icons found in the original designs (e.g., `aperture` for the logo, `scanLine` for the capture focus).
