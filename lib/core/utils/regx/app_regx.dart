abstract class AppRegex {
  static bool isEmailValid(String email) {
    return RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(email);
  }

  static bool isPasswordValid(String password) {
    return RegExp(
            r"^(?=.[a-z])(?=.[A-Z])(?=.\d)(?=.[@$!%?&])[A-Za-z\d@$!%?&]{8,}$")
        .hasMatch(password);
  }

  static bool isEgyptianNationalIDValid(String id) {
    if (!RegExp(r'^[23]\d{13}$').hasMatch(id)) return false;
    String month = id.substring(3, 5);
    String day = id.substring(5, 7);

    int m = int.parse(month);
    int d = int.parse(day);

    if (m < 1 || m > 12) return false;
    if (d < 1 || d > 31) return false;

    return true;
  }

  static bool hasLowerCase(String password) {
    return RegExp(r'^(?=.*[a-z])').hasMatch(password);
  }

  static bool hasUpperCase(String password) {
    return RegExp(r'^(?=.*[A-Z])').hasMatch(password);
  }

  static bool hasNumber(String password) {
    return RegExp(r'^(?=.*?[0-9])').hasMatch(password);
  }

  static bool hasSpecialCharacter(String password) {
    return RegExp(r'^(?=.?[#?!@$%^&-])').hasMatch(password);
  }

  static bool hasMinLength(String password) {
    return RegExp(r'^(?=.{8,})').hasMatch(password);
  }

  static bool isPhoneNumberValid(String phoneNumber) {
    return RegExp(r'^(010|011|012|015)[0-9]{8}$').hasMatch(phoneNumber);
  }

  static bool isValidDateFormat(String input) {
    final RegExp datePattern = RegExp(r'^\d{4}/\d{2}/\d{2}$');

    if (!datePattern.hasMatch(input)) return false;

    try {
      DateTime parsedDate = DateTime.parse(input.replaceAll('/', '-'));

      String formattedDate =
          "${parsedDate.year}/${parsedDate.month.toString().padLeft(2, '0')}/${parsedDate.day.toString().padLeft(2, '0')}";
      return formattedDate == input;
    } catch (e) {
      return false;
    }
  }

  static bool validatePasswordIsMoreThan8(String password) {
    if (password.length < 8) {
      return false;
    }
    return true;
  }

  static bool validatePasswordHasUpperCase(String password) {
    if (!RegExp(r'[A-Z]').hasMatch(password)) {
      return false;
    }
    return true;
  }

  static bool validatePasswordHasLowerCase(String password) {
    if (!RegExp(r'[a-z]').hasMatch(password)) {
      return false;
    }
    return true;
  }

  static bool validatePasswordHasNumber(String password) {
    if (!RegExp(r'[0-9]').hasMatch(password)) {
      return false;
    }
    return true;
  }

  static bool validatePasswordHasSpecialCharacter(String password) {
    if (!RegExp(r'[^A-Za-z0-9]').hasMatch(password)) {
      return false;
    }
    return true;
  }
}