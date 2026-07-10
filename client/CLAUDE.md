# CLAUDE.md

# Project Overview

Project Name: Zhevion Workoout App

This project is a Flutter application built primarily for powerlifters. The long-term goal is to become the app I personally use for training, while also being polished enough for public release.

The application should prioritize:

- Fast and responsive offline experience
- Simple and intuitive UI
- Long-term maintainability
- Clean Architecture
- Scalability for future features

Always optimize for code quality over short-term convenience.

---

# Vision

The app should allow users to:

- Create and manage powerlifting programs
- Log completed workouts
- Track progress over time
- View meaningful training statistics
- Optionally create an online account for cloud synchronization

The app should work completely offline.

Online features are optional enhancements, not requirements.

---

# Authentication Philosophy

Authentication is OPTIONAL.

When the application is first installed:

- The user should NOT be required to sign in.
- The user should immediately be able to use the application.
- All workout data should be stored locally.

Supabase authentication only unlocks cloud features such as:

- User profile
- Cloud backup
- Data synchronization
- Multi-device support

Never design the application assuming authentication is required.

Offline-first is the default.

---

# Current Product Scope

The current focus is building the core offline experience.

For now:

- Programs are fixed/predefined.
- Program editing will come later.
- Build the complete workout experience before adding advanced features.

Do not introduce unnecessary complexity.

---

# Planned Features

## Workout Program

- Fixed programs
- Program selection
- Weekly sessions
- Planned exercises
- Planned sets

## Workout Logging

- Perform planned workouts
- Record weight
- Record repetitions
- Record RPE
- Record completion time
- Save workout history

## Statistics

- Volume tracking
- Estimated 1RM
- Personal records
- Progress charts
- Weekly and monthly summaries

---

# Architecture

Always follow:

- Clean Architecture
- Feature-first folder structure
- Riverpod Notifier
- Isar Local Database
- Supabase (optional online features)

---

# Architecture Rules

These rules should never be violated.

## Dependencies

Presentation
→ Domain
→ Data

Never reverse these dependencies.

The Domain layer must never import Data.

Presentation should communicate through Use Cases or other Domain abstractions—not directly with repositories or data sources.

Data implements Domain contracts.

---

## Domain Layer

The Domain layer should contain only business logic.

Allowed:

- Entities
- Repository interfaces
- Use Cases
- Domain-specific value objects

Avoid framework dependencies whenever possible.

---

## Data Layer

Responsible for:

- Isar
- Supabase
- DTOs / Models
- Repository implementations
- Local and remote data sources

Business logic should not live here.

---

## Presentation Layer

Responsible only for:

- UI
- Riverpod providers
- State
- User interaction

Business decisions belong in the Domain layer.

---

# State Management

Use Riverpod.

Prefer:

- Notifier
- AsyncNotifier when asynchronous state is required

Avoid unnecessary providers.

Keep state minimal.

---

# Database

Primary database:

- Isar

Future cloud:

- Supabase

The application should continue functioning without an internet connection.

Always think offline-first.

---

# Coding Principles

Follow:

- SOLID
- DRY
- KISS
- Composition over inheritance

Prefer:

- Small functions
- Small classes
- Clear naming
- Explicit code over clever code

Readable code is more important than short code.

---

# Naming

Use descriptive names.

Avoid abbreviations unless universally understood.

Good:

- WorkoutProgram
- PlannedSession
- PerformedSession

Bad:

- Prog
- Sess
- Tmp

---

# Immutability

Prefer immutable models.

Only use mutable state when absolutely necessary.

---

# Error Handling

Handle failures gracefully.

Do not ignore exceptions.

Return meaningful errors.

---

# Before Writing Code

Always:

1. Read the existing architecture.
2. Understand surrounding code.
3. Follow existing conventions.
4. Minimize changes.
5. Explain architectural decisions when introducing new patterns.

Never rewrite working code without justification.

---

# When Making Changes

Before implementing:

- Explain the proposed solution.
- Mention trade-offs if multiple approaches exist.
- Keep changes focused.
- Avoid unrelated refactoring.

If a change affects architecture, explain why.

---

# Code Reviews

When asked to review code:

- Look for Clean Architecture violations.
- Check SOLID principles.
- Look for unnecessary complexity.
- Suggest simplifications.
- Prefer maintainability over clever optimizations.

---

# Long-Term Goal

The goal is not simply to build another workout tracker.

The goal is to build a high-quality powerlifting application that is:

- Fast
- Reliable
- Offline-first
- Maintainable
- Pleasant to use every day

Every implementation decision should support this vision.