import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get burger => 'Burguers';

  @override
  String get cake => "Cakes";

  @override
  String get donuts => "Donuts";

  @override
  String get exitConfirmationBody =>
      "Are you sure you want to go back to the previous screen?";

  @override
  String get exitConfirmationNegative => "No";

  @override
  String get exitConfirmationPositive => "Yes";

  @override
  String get exitConfirmationTitle => "Hey!";

  @override
  String get fruits => "Fruits";

  @override
  String get noItemMessage => "No item selected";

  @override
  String get pizza => "Pizzas";

  @override
  String get secondPageTitle => "Menu";

  @override
  String get start => "START";

  @override
  String get tacos => "Tacos";

  @override
  String get thirdPageTitle => "Item details";

  @override
  String get christmasMessage => "Merry Christmas!";
}
