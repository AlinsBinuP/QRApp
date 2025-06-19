# 📱 QR Code Scanner & Generator App

A sleek and intuitive Flutter app that allows users to **scan** QR codes using the camera or from the gallery, and **generate** custom QR codes from any input text or link. Built with modern UI and real-time barcode processing.

![Banner](assets/banner.png) <!-- Optional: Add an actual screenshot path -->

---

## 🚀 Features

- 🔍 **Scan QR codes** using camera (real-time)
- 🖼️ **Scan QR codes** from images in the gallery
- 🧾 **Generate** QR codes from any text or URL
- 🌐 **Launch UPI/payment links** instantly
- 🧑‍🎨 Beautiful and minimal UI design
- 📦 Uses `mobile_scanner`, `google_mlkit_barcode_scanning`, and `qr_flutter`

---

## 📸 Screenshots

| Scan from Camera | Scan from Gallery | Generate QR |
|:--:|:--:|:--:|
| ![camera](assets/camera.png) | ![gallery](assets/gallery.png) | ![generate](assets/generate.png) |

---

## 🛠️ Built With

- [Flutter](https://flutter.dev/) 🐦
- [`mobile_scanner`](https://pub.dev/packages/mobile_scanner)
- [`google_mlkit_barcode_scanning`](https://pub.dev/packages/google_mlkit_barcode_scanning)
- [`image_picker`](https://pub.dev/packages/image_picker)
- [`qr_flutter`](https://pub.dev/packages/qr_flutter)
- [`url_launcher`](https://pub.dev/packages/url_launcher)

---

## 📂 Project Structure

```
lib/
├── main.dart
├── scan_qr_code.dart
├── generate_qr_code.dart
└── ...
```

---

## 🧑‍💻 Getting Started

1. **Clone the repo**
   ```bash
   git clone https://github.com/your-username/qr-scanner-generator.git
   cd qr-scanner-generator
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

---

## ⚠️ Permissions

Ensure the following permissions are added in `AndroidManifest.xml`:

```xml
<uses-permission android:name="android.permission.CAMERA" />
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />
```

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).

---

## 🙌 Credits

Made with ❤️ by [Your Name](https://github.com/your-username)  
*If you like this project, leave a ⭐ on GitHub!*
