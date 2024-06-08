class FormValidatorService {
  String? validatePhoneNumber(String? value) {
    if (value!.isEmpty) {
      return 'Phone number should not be empty';
    } else if (!RegExpApp.validatePhoneNumber(value)) {
      return 'Invalid phone number';
    } else {
      return null;
    }
  }

  String? validateNumber(String? value) {
    if (value!.isEmpty) {
      return 'This field should not be empty';
    } else if (num.tryParse(value) == null) {
      return 'Should be a number';
    } else {
      return null;
    }
  }

  String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'Password should not be empty';
    } else if (value.length < 6) {
      return 'Password should be at least 6 characters';
    } else {
      return null;
    }
  }

  String? validateConfirmPassword(String? value, String? firstPassword) {
    if (value!.isEmpty) {
      return 'Password should be empty';
    } else if (value.length < 6) {
      return 'Password should be at least 6 characters';
    } else if (value != firstPassword) {
      return 'Password should be the same';
    } else {
      return null;
    }
  }

  String? validateFirstName(String? value) {
    if (value!.isEmpty) {
      return 'First name should not be empty';
    } else {
      return null;
    }
  }

  String? validateLastName(String? value) {
    if (value!.isEmpty) {
      return 'Last name should not be empty';
    } else {
      return null;
    }
  }

  String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return 'Email should not be empty';
    } else if (!RegExpApp.validateEmail(value)) {
      return 'Invalid email';
    } else {
      return null;
    }
  }

  String? validateAreaOfResidence(String? value) {
    if (value!.isEmpty) {
      return 'Area should not be empty';
    } else {
      return null;
    }
  }

  String? validateOtp(String? value) {
    if (value!.isEmpty) {
      return 'OTP should not be empty';
    } else {
      return null;
    }
  }

  String? validateSimple(String? value) {
    if (value!.isEmpty) {
      return 'This field should not be empty';
    } else {
      return null;
    }
  }
}

class RegExpApp {
  static bool validateEmail(String email) {
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email.trim());
  }

  static bool validatePhoneNumber(String phoneNumber) {
    return RegExp(r"(?:(\+237|237))?(?:\s)?(6|2)(2|3|[5-9])[0-9]{7}$").hasMatch(phoneNumber.trim());
  }
}
