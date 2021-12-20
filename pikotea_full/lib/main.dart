import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pikotea_full/l10n/app_localizations.dart';
import 'package:pikotea_full/ui/first_page.dart';
import 'package:pikotea_full/ui/second_page.dart';
import 'package:pikotea_full/ui/third_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  late SharedPreferences _prefs;
  static const String _sharedPrefsLocaleKey = "pikotea_lang";

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) => _loadLocale());
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pikotea',
      locale: _locale,
      supportedLocales: const [
        Locale('es', ''),
        Locale('en', ''),
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      initialRoute: FirstPage.routeName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.exoTextTheme()),
      routes: {
        FirstPage.routeName: (_) => FirstPage(
              key: ValueKey(
                  _locale), // Forces the rebuild on setState call, to update text with locale
            ),
        SecondPage.routeName: (_) => SecondPage(),
        ThirdPage.routeName: (_) => const ThirdPage(),
      },
    );
  }

  /// Sets the app locale
  void _setLocale(Locale value) {
    setState(() {
      _locale = value;
    });
  }

  /// set Spanish locale
  void setEsLocale() {
    _prefs.setString(_sharedPrefsLocaleKey, 'es');
    _setLocale(const Locale.fromSubtags(languageCode: 'es'));
  }

  /// set English locale
  void setEnLocale() {
    _prefs.setString(_sharedPrefsLocaleKey, 'en');
    _setLocale(const Locale.fromSubtags(languageCode: 'en'));
  }

  /// load stored locale configuration
  Future<void> _loadLocale() async {
    _prefs = await SharedPreferences.getInstance();
    final String? lang = _prefs.getString(_sharedPrefsLocaleKey);

    if (lang != null) {
      _setLocale(Locale.fromSubtags(languageCode: lang));
    }
  }
}
