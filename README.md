# 🐱 Cat Facts Widgets — WidgetKit

A SwiftUI iOS app with a WidgetKit extension that displays random cat facts on your home screen — a practical intro to building widgets that fetch live data.

---

## 🤔 What this is

CatFactsWidgets demonstrates how to build a WidgetKit home screen widget that fetches live data from an API. The `CatWidget` extension fetches random cat facts and displays them in a widget timeline that refreshes periodically. It includes both the main app target and the widget extension in a single Xcode project, showing how the two targets work together.

## ✅ Why you'd use it

- **`TimelineProvider`** — the core WidgetKit protocol, shows how to supply entries for scheduled refreshes
- **`CatFact` Codable model** — decodes API responses for use in widget timeline entries
- **Two targets in one project** — main app + `CatWidget` extension properly configured together
- **API data in a widget** — the most common real-world widget pattern: fetch → decode → display
- **Entitlements included** — shows the correct sandbox entitlement setup for network-capable widgets

## 📺 Watch on YouTube

[![Watch on YouTube](https://img.shields.io/badge/YouTube-Watch%20the%20Tutorial-red?style=for-the-badge&logo=youtube)](https://youtu.be/KalCtyjgfRc)

> This project was built for the [NoahDoesCoding YouTube channel](https://www.youtube.com/@NoahDoesCoding97).

---

## 🚀 Getting Started

### 1. Clone the Repo
```bash
git clone https://github.com/NDCSwift/CatFactsWidgets.git
cd CatFactsWidgets
```

### 2. Open in Xcode
Double-click `CatFactsWidgets.xcodeproj`.

### 3. Set Your Development Team
TARGET → Signing & Capabilities → Team (set for both app and widget targets)

### 4. Update the Bundle Identifier
Change `com.example.MyApp` to a unique identifier for both targets.

### 5. Run
Build and run the main app, then long-press the home screen to add the Cat Facts widget.

---

## 🛠️ Notes
- Widgets run in a separate process — network calls belong in `TimelineProvider`, not the main app.
- Use the Xcode widget simulator scheme to test timeline refreshes without waiting.
- Both targets need matching entitlements for network access.

## 📦 Requirements
- Xcode 16+
- iOS 17+

📺 [Watch the guide on YouTube](https://youtu.be/KalCtyjgfRc)
