import 'package:flutter/material.dart';
import 'package:pikotea_full/l10n/app_localizations.dart';
import 'package:pikotea_full/models/item_model.dart';
import 'package:pikotea_full/widgets/custom_app_bar.dart';

class ThirdPage extends StatelessWidget {
  /// Third page: shows the selected item details
  ///
  const ThirdPage({Key? key}) : super(key: key);
  static const routeName = '/third';

  @override
  Widget build(BuildContext context) {
    // Extract the arguments from the current ModalRoute
    final item = ModalRoute.of(context)!.settings.arguments as ItemModel?;

    return Scaffold(
      appBar: CustomAppBar(
        title:
            AppLocalizations.of(context)?.thirdPageTitle ?? "Detalles del ítem",
      ),
      body: Center(
        child: _buildBody(context, item),
      ),
    );
  }

  /// Construct the scaffold body, showing item details or no item message when isn't found
  Widget _buildBody(BuildContext context, ItemModel? item) {
    if (item == null) {
      return Center(
        child: Text(AppLocalizations.of(context)?.noItemMessage ??
            "Sin ítem seleccionado"),
      );
    }

    return FittedBox(
      fit: BoxFit.contain,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(tag: item.asset, child: Image.asset(item.asset)),
          Text(
            item.getName(context),
            style: Theme.of(context).textTheme.headline3,
          )
        ],
      ),
    );
  }
}
