class AppValidations {
  /// Validates if the field is not empty
  static String? validateRequired(
    String? value, {
    String fieldName = 'This field',
  }) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required.';
    }
    return null;
  }

  /// Validates if the value is a valid email address
  static String? validateEmail(String? value) {
    const emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    final regex = RegExp(emailPattern);
    if (value == null || value.trim().isEmpty) {
      return 'Email is required.';
    } else if (!regex.hasMatch(value.trim())) {
      // return 'Please enter a valid email address.';
      return 'Please enter a valid email address in the format of user@example.com';
    }
    return null;
  }

  /// Validates if the value is a valid phone number
  static String? validatePhoneNumber(String? value) {
    const phonePattern = r'^\+?[0-9]{7,15}$';
    final regex = RegExp(phonePattern);
    if (value == null || value.trim().isEmpty) {
      return 'Phone number is required.';
    } else if (!regex.hasMatch(value.trim())) {
      return 'Please enter a valid phone number.';
    }
    return null;
  }

  /// Validates if the password meets the required criteria
  /// At least one uppercase, one lowercase, one number, one special character, and 6 characters long
  static String? validatePassword(String? value) {
    const passwordPattern =
        r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&#])[A-Za-z\d@$!%*?&#]{6,}$';
    final regex = RegExp(passwordPattern);
    if (value == null || value.trim().isEmpty) {
      return 'Password is required.';
    } else if (!regex.hasMatch(value)) {
      return 'Password must have an uppercase, numbers, special characters, and must be 6+ characters.';
    }
    return null;
  }

  static String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Username cannot be empty';
    }

    if (!RegExp(r'^[a-z0-9_]{3,30}$').hasMatch(value)) {
      return 'Username must be 3–30 characters long, using only lowercase letters, numbers, and underscores.';
    }

    // Ensure username does not start or end with an underscore
    if (value.startsWith('_') || value.endsWith('_')) {
      return 'Username cannot start or end with an underscore';
    }

    return null; // ✅ Username is valid
  }

  /// Validates if the value is a valid date
  /// Expects a date in the format 'yyyy-MM-dd'
  static String? validateDate(String? value) {
    const datePattern = r'^\d{4}-\d{2}-\d{2}$';
    final regex = RegExp(datePattern);
    if (value == null || value.trim().isEmpty) {
      return 'Date is required.';
    } else if (!regex.hasMatch(value.trim())) {
      return 'Please enter a valid date in the format YYYY-MM-DD.';
    }
    return null;
  }

  /// Validates if the value is a number within a specific range
  static String? validateMobile(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Mobile number is required.';
    }

    final trimmedValue = value.trim();

    // Only digits, and 10 digits long
    final regex = RegExp(r'^[6-9]\d{9}$');
    if (!regex.hasMatch(trimmedValue)) {
      return 'Please enter a valid 10-digit mobile number.';
    }

    return null;
  }


  /// Validates if the URL is valid
  static String? validateUrl(String? value) {
    const urlPattern =
        r'^(https?:\/\/)?([a-zA-Z0-9.-]+)(\.[a-zA-Z]{2,})(\/\S*)?$';
    final regex = RegExp(urlPattern);
    if (value == null || value.trim().isEmpty) {
      return 'URL is required.';
    } else if (!regex.hasMatch(value.trim())) {
      return 'Please enter a valid URL.';
    }
    return null;
  }

  /// Validates if the age is greater than or equal to 18
  static String? validateAge(String? value) {
    final age = int.tryParse(value ?? '');
    if (value == null || value.trim().isEmpty) {
      return 'Age is required.';
    } else if (age == null || age < 18) {
      return 'You must be at least 18 years old.';
    }
    return null;
  }

  /// Validates if the two fields (e.g., password and confirm password) match
  static String? validateConfirmPassword(
    String? value,
    String originalPassword,
  ) {
    if (value == null || value.isEmpty) {
      return 'Please enter confirm password';
    }
    if (value != originalPassword) {
      return 'Password does not match';
    }
    return null;
  }

  static String? validateOTP(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter OTP';
    } else if (value.length != 6) {
      return 'OTP must be exactly 6 digits';
    } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'OTP should contain only digits';
    }
    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Name is required.';
    }

    const namePattern = r'^[a-zA-Z\s.]{2,30}$';
    final regex = RegExp(namePattern);

    final trimmedValue = value.trim();

    if (!regex.hasMatch(trimmedValue)) {
      return 'Name can only contain letters and spaces, and must be 2-30 characters long.';
    }

    return null;
  }

  static String? validateBrandName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Brand Name is required.';
    }

    const namePattern = r'^[a-zA-Z0-9\s.]{2,30}$';
    final regex = RegExp(namePattern);

    final trimmedValue = value.trim();

    if (!regex.hasMatch(trimmedValue)) {
      return 'Brand Name can only contain letters, numbers and spaces, and must be 2-30 characters long.';
    }

    return null;
  }

  static String? validateRoleName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Role Name is required.';
    }

    const namePattern = r'^[a-zA-Z0-9\s.]+$';
    final regex = RegExp(namePattern);

    final trimmedValue = value.trim();

    if (!regex.hasMatch(trimmedValue)) {
      return ' Role Name can only contain letters, numbers and spaces.';
    }

    return null;
  }
}
