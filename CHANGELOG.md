# Changelog

Changelog for AMRAdapterAdserver.

## [1.3.2] - 2026-08-05
### Added
- `showCloseButton` on the ad response. When `false` the close and info buttons are not
  drawn over a banner. Defaults to `true`, so a response without the field behaves as
  before.

### Fixed
- Banners carrying a third party tag no longer paint the styled `adBackColor` behind the
  creative. A tag is scaled to fit and rarely matches its box exactly, so the backdrop
  showed as black bars either side of it. Other templates keep the configured colour.
- A tag scales itself against the viewport it was measured in — the offscreen full screen
  box. Any change to its box after the first 8 seconds left it transformed for a box it
  was no longer in. The page now recomputes on its own `resize`, and the banner reacts to
  height changes as well as width.

### Updated
- AdmostAdServer 1.3.2. Measurement logs now report what the tag actually drew, and Safari's
  Web Inspector can attach to the tag's web view under debug logging.

## [1.3.1] - 2026-08-05
### Fixed
- Third party tags that declare no size of their own now render. Such a tag collapsed the
  measuring wrapper to zero, so no size was ever reported and the banner was never
  released — it was dropped on the mediation request timeout instead of being shown. The
  size is now measured through a fallback chain, and a tag that still has none is
  stretched over the slot it was given.
- 728x90 zones (`AMRBannerSizeHeight90`) were handed a 300x250 slot. `AASBannerSize` gains
  `leaderboard` and the adapter maps to it. 320x50 and 300x250 zones are unchanged.
- A 300x250 tag in an mpu slot is no longer trimmed by the height guard meant for banner
  slots.

### Updated
- AdmostAdServer 1.3.1.

## [1.3.0] - 2026-08-05
### Added
- Third party tag (`html_tag`) banner support. Tags are wrapped with a measure and scale
  script, fit into the banner box with their aspect ratio preserved, and report their real
  size back so the banner can size itself.
- IAB Open Measurement (OMID) support for third party tags, via the `kokteyl1` namespaced
  OM SDK 1.6.9. `[APIFRAMEWORKS]` and `[OMIDPARTNER]` macros are filled in and the OMID JS
  service is injected ahead of the tag's own script.

### Updated
- AdmostAdServer 1.3.0.
- Tag click-throughs opened with `window.open()` now open externally instead of navigating
  the ad's own web view.

## [1.2.5] - 2026-03-29
### Updated
- Bundle executable removed for App Store submission.
- pinToCorner layout bug fixed.

## [1.2.4] - 2026-03-29
### Updated
- Min iOS version 13.0+
- Bundle issue fixed.

## [1.2.3] - 2026-03-19
### Updated
- AdmostAdServerResources bundle fixed for App Store submission.

## [1.2.2] - 2026-03-19
### Updated
- SPM support added.
- Min iOS version 13.0
- AMRSDK dependency updated to 1.5.84

## [1.2.1.0] - 2025-12-09
### Updated
- Native ad assets updated.

## [1.1.9.0] - 2025-07-25
### Updated
- image and video click issues fixed.

## [1.1.8.0] - 2025-05-15
### Updated
- stickyRate added.

## [1.1.6.0] - 2024-09-04
### Updated
- didComplete bug fixed.

## [1.1.5.2] - 2024-09-02
### Updated
- minor bug fixed.

## [1.1.5.1] - 2024-08-28
### Updated
- minor bug fixed.

## [1.1.4.0] - 2023-07-28
### Updated
- DidShow event added to Native ads.

## [1.1.3.0] - 2023-07-25
### Updated
- DidShow event added to Native ads.

## [1.1.2.0] - 2023-05-09
### Updated
- ReportManager crash fixed.

## [1.1.1.0] - 2023-03-21
### Updated
- Critical bug fix.

## [1.1.0.0] - 2023-03-03
### Updated
- Encoding URL crashes fixed.


## [1.0.0.0] - 2023-02-09
### Added
- Banner, native, interstitial and rewarded video formats added.
