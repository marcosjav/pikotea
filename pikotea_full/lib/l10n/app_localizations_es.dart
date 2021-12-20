import 'app_localizations.dart';

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get burger => 'Hamburguesas';

  @override
  String get cake => "Tartas";

  @override
  String get donuts => "Donas";

  @override
  String get exitConfirmationBody =>
      "Seguro que deseas volver a la pantalla anterior?";

  @override
  String get exitConfirmationNegative => "No";

  @override
  String get exitConfirmationPositive => "Sí";

  @override
  String get exitConfirmationTitle => "Hey!";

  @override
  String get fruits => "Frutas";

  @override
  String get noItemMessage => "Sin ítem seleccionado";

  @override
  String get pizza => "Pizzas";

  @override
  String get secondPageTitle => "Menú";

  @override
  String get start => "COMENZAR";

  @override
  String get tacos => "Tacos";

  @override
  String get thirdPageTitle => "Detalles del ítem";

  @override
  String get christmasMessage => "Feliz Navidad!";
}
