# Changelog

Changelog for AMRAdapterAdserver.

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
