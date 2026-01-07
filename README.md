# Task Tracker CLI

**GitHub Repository:** [https://github.com/ZarnoBush/task-tracker](https://github.com/ZarnoBush/task-tracker)

📌 CLI Task Tracker (Dart)

A command-line task management application built using Dart, featuring user authentication, task management, persistent storage, and clean architecture principles.

This project demonstrates real-world software engineering concepts applied in a CLI environment.

🚀 Features

User registration with input validation

Secure login with password hashing

Task creation and listing

User-specific task management

Persistent data storage using JSON files

Menu-driven command-line interface

Clean, scalable project architecture

🧠 Learning Objectives

This project was built to:

Practice Dart fundamentals and null safety

Understand clean architecture and separation of concerns

Implement authentication and authorization logic

Work with file-based persistence

Build scalable, maintainable applications

🗂 Project Structure

task_tracker/
├── bin/
│   └── task_tracker.dart        # Application entry point
├── lib/
│   ├── models/                  # Data models
│   │   ├── user.dart
│   │   └── task.dart
│   ├── services/                # Business logic & persistence
│   │   ├── user_service.dart
│   │   ├── user_storage.dart
│   │   ├── task_service.dart
│   │   ├── task_storage.dart
│   │   └── validators.dart
│   ├── utils/                   # Helper utilities
│   │   ├── input_helper.dart
│   │   └── hash_helper.dart
├── users.json                   # User data storage
├── tasks.json                   # Task data storage
├── pubspec.yaml
└── README.md

🏗 Architecture Overview

The project follows a layered architecture:

bin/ → Application entry point (no business logic)

models/ → Data structures (User, Task)

services/ → Business rules and data persistence

utils/ → Reusable helpers (input handling, hashing)

This ensures:

Separation of concerns

Easy scalability

Maintainable and testable code

🔐 Authentication Flow

User registers with name, email, and password

Input is validated before processing

Password is hashed using SHA-256

User data is stored in a JSON file

During login:

Email is verified

Password hash is compared

User session is established


📝 Task Management Flow

Logged-in user creates a task

Task is associated with the user’s email

Tasks are persisted in a JSON file

User can list all their tasks

🧪 Validation Rules

Name: Must not be empty

Email: Must follow valid email format

Password: Minimum of 6 characters

Validation follows a fail-fast approach to prevent invalid data from being saved.

▶️ Getting Started
Prerequisites

Dart SDK installed

Git (optional)

Installation
git clone https://github.com/ZarnoBush/task-tracker.git
cd task-tracker
dart pub get

Run the application
dart run

🛠 Technologies Used

Dart

Git & GitHub

JSON (file-based persistence)

SHA-256 password hashing

Command Line Interface (CLI)

📦 Deliverables

Fully functional CLI task tracking system

Secure authentication implementation

Clean, scalable codebase

Persistent data storage

Reusable validation and utility helpers

Professional documentation

🔮 Future Improvements

Task completion toggle

Task deletion and updates

User session menus

Database integration

Flutter UI implementation

Unit and integration testing

👨‍💻 Author

Zanoxolo Bushula
Mobile App Frontend Developer (Flutter & Dart)