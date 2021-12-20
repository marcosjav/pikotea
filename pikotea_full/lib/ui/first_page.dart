import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pikotea_full/l10n/app_localizations.dart';
import 'package:pikotea_full/main.dart';
import 'package:pikotea_full/ui/second_page.dart';
import 'package:pikotea_full/constants/assets.dart' as assets;
import 'package:pikotea_full/widgets/animations/column_fade_in_up.dart';

class FirstPage extends StatelessWidget {
  /// First page with company logo and init button
  ///
  const FirstPage({Key? key}) : super(key: key);
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    final double maxLogoWidth = MediaQuery.of(context).size.width * .2;
    final double maxLogoHeight = MediaQuery.of(context).size.height * .1;

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: OrientationBuilder(
            builder: (_, orientation) => ColumnFadeInUp(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          MyApp.of(context)?.setEnLocale();
                        },
                        child: const Text("En")),
                    TextButton(
                        onPressed: () {
                          MyApp.of(context)?.setEsLocale();
                        },
                        child: const Text("Es")),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: SvgPicture.asset(
                    assets.logoPikoteaSvg,
                    width: orientation == Orientation.landscape
                        ? maxLogoWidth
                        : null,
                    height: orientation == Orientation.portrait
                        ? maxLogoHeight
                        : null,
                  ),
                ),
                SizedBox(height: maxLogoHeight),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
                  onPressed: () => Navigator.pushNamed(context,
                      SecondPage.routeName), // Navigate to second page (grid)
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(AppLocalizations.of(context)?.start ?? "Start"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
