class Validator {
  static String? valueExists(dynamic value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else {
      return null;
    }
  }

  static String? validateEmail(dynamic value) {
    var pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    var regExp = RegExp(pattern);
    var emptyResult = valueExists(value);
    if (emptyResult != null) {
      return emptyResult;
    } else if (!regExp.hasMatch(value)) {
      return 'Not a valid email address. Should be your@email.com';
    } else {
      return null;
    }
  }

  static String? validateDropDefaultData(value) {
    if (value == null) {
      return 'Please select an item.';
    } else {
      return null;
    }
  }

  static String? validatePassword(String value) {
    Pattern pattern = r'^.{6,}$';
    RegExp regex = RegExp(pattern as String);
    if (!regex.hasMatch(value)) {
      return '';
    } else {
      return null;
    }
  }

  static String? validateName(String value) {
    if (value.length < 3) {
      return '🚩 Note is too short.';
    } else {
      return null;
    }
  }

  static String? validateText(String value) {
    if (value.isEmpty) {
      return '🚩 Text is too short.';
    } else {
      return null;
    }
  }

  static String? validatePhoneNumber(String value) {
    if (value.isEmpty) {
      return 'Not valid mobile number';
    } else {
      return null;
    }
  }

  static String? validatOTP(String value) {
    if (value.length != 6 || value.trim().isEmpty && value is int) {
      return 'invalid pin code';
    } else {
      return null;
    }
  }
}
