import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pikotea_full/constants/assets.dart' as assets;
import 'package:pikotea_full/l10n/app_localizations.dart';

class CustomDrawer extends StatelessWidget {
  /// Custom drawer showing a Christmas message
  ///
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Lottie.asset(assets.santaAnim),
          Text(
            AppLocalizations.of(context)?.christmasMessage ?? "Feliz Navidad!",
            style: Theme.of(context).textTheme.headline5,
          ),
        ]),
      ),
    );
  }
}
