 Habi (حابي) - Advanced Real Estate Mobile Application

A feature-rich, scalable, and high-performance cross-platform real estate mobile application built with Flutter, leveraging a robust feature-based architecture, Cubit for predictable state management, Supabase as a Backend-as-a-Service, and Auto Route for type-safe navigation.

🌟 Table of Contents

About The Project

Architecture & Design Patterns

Tech Stack & Tooling

App User Flows & Screens

Key Features

Project Structure (Feature-Based)

Author & Team

 About The Project

Habi is a comprehensive real estate ecosystem designed to connect property seekers with listings through a seamless mobile interface. Developed collaboratively by a skilled engineering team, the application handles the entire real estate discovery process, including secure user authentication, dynamic property catalog exploration, interactive map navigation, detailed property specifications, user ratings, and integrated payment checkout workflows.

 Architecture & Design Patterns

Feature-Based Architecture: The project codebase is strictly modularized by features (e.g., auth, home, property, map, payment), ensuring high maintainability, scalability, and clean separation of concerns among team members.

State Management & Backend: Built using Cubit to manage UI states reactively and predictably across all features, paired with Supabase as the primary Backend-as-a-Service for real-time PostgreSQL database interactions, authentication, and cloud storage management.

Navigation: Powered by Auto Route for type-safe routing and deep-linking capabilities across complex screen hierarchies.

 Tech Stack & Tooling

Framework: Flutter (Dart)

State Management: Flutter Cubit (Bloc library)

Backend & Database: Supabase (PostgreSQL Database, Authentication, and Cloud Storage)

Routing: auto_route (Type-safe navigation generator)

Maps & Location Services: Map integration services for real-time property location tracking

UI/UX Adaptation: Responsive layouts tailored for diverse mobile viewports.

 App User Flows & Screens

The application is structured around intuitive and user-centric flows:

Onboarding & Authentication: Splash screen, interactive onboarding slides, secure Sign In, Sign Up, and account setup backed by Supabase Auth.

Property Discovery & Exploration: Dynamic Home dashboard, featured properties, detailed property specifications, house exploration feeds, and user review modules.

Map & Geographical Navigation: Interactive location-based maps for visual property discovery and area filtering.

Checkout & Payment Management: Multi-step booking and payment details workflow, summary confirmation, and order completion screens.

User Dashboard & Preferences: Secondary screens for user profile management, saved listings, and application settings.

 Project Structure (Feature-Based)

habi-real-estate/
├── lib/
│   ├── core/                # Core utilities, Supabase configuration, themes, routes
│   ├── features/            # Feature-first modular structure
│   │   ├── auth/            # Login, Register, Profile setup (Cubit + Supabase services)
│   │   ├── home/            # Dashboard, Featured listings, Categories
│   │   ├── property/        # Property details, Virtual explore, Reviews
│   │   ├── map/             # Interactive map and location-based discovery
│   │   ├── payment/         # Checkout flow, Payment details, Confirmation
│   │   └── profile/         # User profile management and settings
│   └── main.dart
└── pubspec.yaml
