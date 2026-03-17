class Validators {
  static String? requiredText(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  static String? phone(String? value) {
    final error = requiredText(value, 'Phone number');
    if (error != null) {
      return error;
    }

    final normalized = value!.replaceAll(RegExp(r'\D'), '');
    if (normalized.length < 10) {
      return 'Enter a valid phone number';
    }
    return null;
  }

  static String? pin(String? value) {
    final error = requiredText(value, 'PIN');
    if (error != null) {
      return error;
    }

    if (value!.length != 4) {
      return 'PIN must be 4 digits';
    }
    return null;
  }
}
