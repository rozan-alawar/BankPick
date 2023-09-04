extension EditString on String {
  // Replace all Phone num after 4 with Start
  String replaceStringPhone() {
    String replacedText =
        replaceRange(4, indexOf(RegExp(r'([0-9]){3}$')), "*****");
    return replacedText;
  }

// Replace all email Suffix - 2 with Start
  String replaceStringEmail() {
    String replacedText = replaceRange(0, indexOf("@") - 2, "*****");
    return replacedText;
  }

// Remove Square Brackets
  String replaceStringSquare() {
    String replacedText = replaceAll("[\\(\\)\\[\\]\\{\\}]", "");
    return replacedText;
  }

// Timer HH:SS
  String formatHHMMSS(int seconds) {
    final hours = (seconds / 3600).truncate();
    seconds = (seconds % 3600).truncate();
    final minutes = (seconds / 60).truncate();
    final hoursStr = (hours).toString().padLeft(2, '0');
    final minutesStr = (minutes).toString().padLeft(2, '0');
    final secondsStr = (seconds % 60).toString().padLeft(2, '0');
    if (hours == 0) {
      return '$minutesStr:$secondsStr';
    }
    return '$hoursStr:$minutesStr:$secondsStr';
  }
}
