#  Habi Real Estate (حَابي) - Real Estate & Property Discovery Application

> A feature-rich, scalable, and high-performance cross-platform real estate mobile application built with Flutter, leveraging a robust feature-based architecture, Cubit for predictable state management, Supabase as a modern Backend-as-a-Service, and Auto Route for type-safe navigation.

---

##  Table of Contents
- [About The Project](#-about-the-project)
- [Architecture & Design Patterns](#-architecture--design-patterns)
- [Tech Stack & Tooling](#-tech-stack--tooling)
- [App User Flows & Screens](#-app-user-flows--screens)
- [Key Features](#-key-features)
- [Project Structure (Feature-Based)](#-project-structure-feature-based)
- [Author & Team](#-author--team)

---

##  About The Project

**Habi Real Estate** is a modern property discovery platform designed to connect real estate buyers, sellers, and renters. Developed collaboratively by an engineering team, the app streamlines property searching, interactive map exploration, virtual property details, user ratings/reviews, and secure payment processing.

---

## Architecture & Design Patterns

* **Feature-Based Architecture:** The project codebase is strictly modularized by features (e.g., auth, properties, map, payment, profile), ensuring high maintainability, scalability, and clean separation of concerns among team members.
* **State Management & Backend:** Built using **Cubit** to manage UI states reactively and predictably across all features, paired with **Supabase** as the backend layer for real-time data synchronization, authentication, storage, and database management.
* **Navigation:** Powered by **Auto Route** for type-safe routing and deep-linking capabilities across complex screen hierarchies.

---

##  Tech Stack & Tooling

* **Framework:** Flutter (Dart)
* **State Management:** Flutter Cubit (Bloc library)
* **Backend & Database:** Supabase (Database, Authentication, Storage)
* **Routing:** `auto_route` (Type-safe navigation generator)
* **Maps & Location:** Interactive Google Maps / Map services integration
* **UI/UX Adaptation:** Responsive layouts tailored for diverse mobile viewports.

---

##  App User Flows & Screens

The application is structured around intuitive and user-centric flows:
1. **Onboarding & Authentication:** Splash screen, interactive onboarding slides, secure Sign In, Sign Up, and OTP recovery.
2. **Property Exploration & Discovery:** Dynamic Home screen, interactive map view, advanced category filtering, property detail showcases, and user review modules.
3. **Transaction & Payment:** Secure payment workflow, reservation steps, and confirmation screens.
4. **User Profile & Settings:** Profile management, saved listings/favorites, and account settings.

---

##  Project Structure (Feature-Based)

```text
habi-app/
├── lib/
│   ├── core/                # Core utilities, Supabase client configuration, themes, routes
│   ├── features/            # Feature-first modular structure
│   │   ├── auth/            # Login, Register, Forgot Password (Cubit + Supabase)
│   │   ├── home/            # Listing, Discovery, Categories
│   │   ├── property/        # Property details, reviews, media gallery
│   │   ├── map/             # Interactive map search and location pins
│   │   ├── payment/         # Booking flow & payment gateways
│   │   └── profile/         # User profile & saved favorites
│   └── main.dart
└── pubspec.yaml
