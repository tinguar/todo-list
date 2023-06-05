String capitalize(String text) {
  if (text == null || text.isEmpty) {
    return '';
  }
  return text.substring(0, 1).toUpperCase() + text.substring(1).toLowerCase();
}

String getFormattedName(String displayName) {
  List<String> names = displayName.split(" ");
  if (names.length >= 4) {
    return "${capitalize(names[0])} ${capitalize(names[2])}";
  } else if (names.length == 3) {
    return "${capitalize(names[0])} ${capitalize(names[2])}";
  } else if (names.length == 2) {
    return "${capitalize(names[0])} ${capitalize(names[1])}";
  } else {
    return capitalize(names[0]);
  }
}

String getInitials(String displayName) {
  List<String> names = displayName.split(" ");
  String initials = "";

  for (String name in names) {
    if (name.isNotEmpty) {
      initials += name.substring(0, 1).toUpperCase();
    }
  }

  return initials;
}



String limitText(String text) {
  if (text.length > 17) {
    return text.substring(0, 17) + '...';
  }
  return text;
}



