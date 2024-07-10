extension ValidationExt on String {
  String? get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (isEmpty) {
      return ("Email is required");
    } else if (!emailRegExp.hasMatch(this)) {
      return ("Enter valid email");
    } else {
      return null;
    }
  }

  String? get isValidPassword {
    final passwordRegExp =
    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (isEmpty) {
      return ("Password is required");
    } else if (length < 8) {
      return ("Password Must be more than 8 characters");
    } else if (!passwordRegExp.hasMatch(this)) {
      return ("Your password is weak");
    } else {
      return null;
    }
  }

  String? get isValidName {
    if (isEmpty) {
      return ("Name is required");
    } else {
      return null;
    }

  }




  String? get isValidPhone {
    final phoneRegExp = RegExp(r'^\+?\d{10,15}$');
    if (isEmpty) {
      return ("Phone number is required");
    } else if (!phoneRegExp.hasMatch(this)) {
      return ("Enter a valid phone number");
    } else {
      return null;
    }
  }
}