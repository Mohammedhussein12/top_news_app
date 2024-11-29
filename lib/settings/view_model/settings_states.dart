abstract class SettingsStates {}

class SettingsInitial extends SettingsStates {}

class LanguageChanged extends SettingsStates {
  final String language;

  LanguageChanged({required this.language});
}
