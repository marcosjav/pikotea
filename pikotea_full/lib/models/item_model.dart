import 'package:flutter/cupertino.dart';
import 'package:pikotea_full/l10n/app_localizations.dart';

enum ItemCategory { burgers, cakes, donuts, fruits, pizzas, tacos }

class ItemModel {
  final String asset;
  final ItemCategory category;

  /// Simple model to store image asset path and category
  ///
  /// [asset] is the image relative asset path
  /// [category] the item category, needed to get the name in current locale
  ItemModel({required this.asset, required this.category});

  String getName(BuildContext context) {
    switch (category) {
      case ItemCategory.burgers:
        return AppLocalizations.of(context)?.burger ?? "Burger";
      case ItemCategory.cakes:
        return AppLocalizations.of(context)?.cake ?? "Cakes";
      case ItemCategory.donuts:
        return AppLocalizations.of(context)?.donuts ?? "Donuts";
      case ItemCategory.fruits:
        return AppLocalizations.of(context)?.fruits ?? "Fruits";
      case ItemCategory.pizzas:
        return AppLocalizations.of(context)?.pizza ?? "Pizzas";
      case ItemCategory.tacos:
        return AppLocalizations.of(context)?.tacos ?? "Tacos";
      default:
        return "...";
    }
  }
}
