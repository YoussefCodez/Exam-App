# 🎓 Exam App - Flutter Professional Project

A modern, robust, and scalable Examination Platform built with **Flutter**, following high-standard **Clean Architecture** principles and **SOLID** design patterns. This project was developed as part of the Elevate Flutter program, demonstrating advanced state management and architectural excellence.

---

## 🚀 Key Features

- **🔐 Secure Authentication**: Full user flow including Sign Up, Login (with "Remember Me"), and a secure multi-step Password Reset flow (Email -> Validation Code -> New Password).
- **📚 Subject Explorer**: Browse available subjects with an integrated **real-time search** functionality.
- **📝 Interactive Exams**: 
  - Dynamic question loading.
  - Real-time exam timer.
  - Persistent state (timer state saved locally).
  - Safety Exit Dialogs to prevent accidental test closure.
- **📊 Result Tracking**: Detailed scoring and feedback after exam completion.
- **📱 Responsive UI**: State-of-the-art UI design using `flutter_screenutil` for perfect display across all device sizes.
- **🌗 Platform Adaptive**: Custom global themes and iOS-style navigation icons for a premium feel.

---

## 🏗️ Architecture & Design Patterns

The project strictly adheres to **Clean Architecture** (Feature-First approach) to ensure the code is maintainable, testable, and scalable.

### Layers:
1. **Presentation Layer**: 
   - Uses **BLoC/Cubit** for reactive state management.
   - Decoupled UI components for maximum reusability.
2. **Domain Layer**: 
   - Contains **Entities** and **Use Cases** (the core business logic).
   - Independent of any external libraries or data sources.
   - Repository Contracts (Interfaces) to enforce dependency inversion.
3. **Data Layer**: 
   - **Repository Implementations**: Bridge between domain and data sources.
   - **Data Sources**: Remote (REST API with Retrofit) and Local (Hive & Secure Storage).
   - **Models**: DTOs for JSON serialization/deserialization.

### Design Principles:
- **SOLID**: Single Responsibility, Open/Closed, and Dependency Inversion are strictly followed.
- **Dependency Injection**: Fully implemented using `get_it` and `injectable`.
- **MVI (Model-View-Intent)**: Cubits utilize an intent-based structure (transformed from local doEvent patterns to explicit methods for type safety).

---

## 🛠️ Tech Stack

- **Framework**: [Flutter](https://flutter.dev/)
- **State Management**: [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- **Networking**: [Dio](https://pub.dev/packages/dio) & [Retrofit](https://pub.dev/packages/retrofit)
- **Dependency Injection**: [get_it](https://pub.dev/packages/get_it) & [injectable](https://pub.dev/packages/injectable)Youssef
- **Local Database**: [Hive](https://pub.dev/packages/hive_ce)
- **Security**: [flutter_secure_storage](https://pub.dev/packages/flutter_secure_storage)
- **UI & Styling**: [flutter_screenutil](https://pub.dev/packages/flutter_screenutil) & [gap](https://pub.dev/packages/gap)
- **Validation**: [email_validator](https://pub.dev/packages/email_validator) & [password_validator_mate](https://pub.dev/packages/password_validator_mate)

---

## 📂 Project Structure

```text
lib/
 ├── config/            # DI, Themes, and Global Configs
 ├── core/              # Common widgets, constants, and utilities
 ├── features/          # Feature-based modules
 │    ├── login/
 │    │    ├── api/           # Data Sources & Api Clients
 │    │    ├── data/          # Models & Repository Impls
 │    │    ├── domain/        # Entities, Use cases & Repository Contracts
 │    │    └── presentation/  # Screens, Cubits & Widgets
 │    ├── signup/
 │    ├── exam/
 │    └── ... (other features)
 └── main.dart          # App Entry point
```

## Screen Shots

<img width="1920" height="1080" alt="exam1" src="https://github.com/user-attachments/assets/ebb4559d-8cbc-448c-a19d-9e6c79b18b1a" />
<img width="1920" height="1080" alt="exam2" src="https://github.com/user-attachments/assets/b9811b90-ffd8-4af9-a7ed-0413bb72ab4e" />
<img width="1920" height="1080" alt="exam3" src="https://github.com/user-attachments/assets/d89c9502-905a-456d-a8b0-d0353edb1935" />
<img width="1920" height="1080" alt="exam5" src="https://github.com/user-attachments/assets/6ec4f8f2-b9e4-4108-b0c4-e54c98718e5b" />


---

## ⚙️ How to Run

1. **Clone the repository**:
   ```bash
   git clone https://github.com/your-username/exam-app.git
   ```
2. **Setup dependencies**:
   ```bash
   flutter pub get
   ```
3. **Generate needed files** (Retrofit/Injectable):
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```
4. **Run the app**:
   ```bash
   flutter run
   ```

---

## 👨‍💻 Authors
**Youssef** - Flutter Developer
**Abdalrahman** - Flutter Developer

---
*This project was audited and refactored to meet "Production-Ready" standards.*
