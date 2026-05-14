<h1 align="center">Cairo Metro 🚇</h1>
<p align="center">Navigate Cairo's metro network with ease — find stations, plan routes, and get real-world directions without breaking a sweat.</p>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-3.x-blue?logo=flutter" />
  <img src="https://img.shields.io/badge/Platform-Android%20%7C%20iOS-lightgrey" />
  <img src="https://img.shields.io/badge/State-GetX-brightgreen" />
</p>

---

## ✨ Highlights

- **Live location awareness** — uses `geolocator` to find the nearest metro station to the user's current position
- **Address resolution** — `geocoding` translates coordinates into human-readable station addresses and vice versa
- **External navigation handoff** — `url_launcher` opens directions in Google Maps or the device's default map app
- **Lightweight & fast** — no backend, no auth; pure local logic with GetX state management

## 🧠 State Management

Built on **GetX** — controllers manage station data and location state, with reactive updates keeping the UI in sync as the user's position changes.

## 📦 Key Packages

| Package | Purpose |
|---|---|
| `get` | State management, routing & DI |
| `geolocator` | GPS-based current location |
| `geocoding` | Coordinate ↔ address resolution |
| `url_launcher` | Hand off navigation to Maps app |

## 🚀 Getting Started

```bash
git clone https://github.com/roaxo/Cairo-Metro.git
cd Cairo-Metro
flutter pub get
flutter run
```

> Requires Flutter 3.x+ (Dart SDK ^3.8.1). Location permissions must be granted on device.

---

<p align="center">Built with Flutter 💙 by <a href="https://github.com/roaxo">roaxo</a></p>
