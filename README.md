# FlexPay Flutter App

Behavioral biometric payments prototype with onboarding, dashboard, payment flow, security center, and community pool modules.

## Included

- App shell with Material 3 themes and route map
- Onboarding screens (Welcome, Patterns, Security)
- Auth screens (Signup, Login)
- Home dashboard screen
- Payment flow screens (Amount, Confirmation, Processing, Success)
- Security screens (Security Center, Fraud Alert)
- Community pool screen
- API service scaffold using Dio
- Behavioral biometrics singleton service with 47-pattern taxonomy

## Run

1. Install Flutter SDK (3.16+ recommended).
2. From this folder run:
   - flutter pub get
   - flutter run

## Notes

- Font assets are referenced by style names but not bundled yet. Add actual font files and update pubspec when ready.
- TensorFlow model loading is optional. Add `assets/models/behavior_model.tflite` and register in pubspec to enable local inference.
