import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pikotea_full/constants/assets.dart' as assets;
import 'package:pikotea_full/l10n/app_localizations.dart';
import 'package:pikotea_full/models/item_model.dart';
import 'package:pikotea_full/ui/first_page.dart';
import 'package:pikotea_full/ui/third_page.dart';
import 'package:pikotea_full/widgets/custom_app_bar.dart';
import 'package:pikotea_full/widgets/custom_drawer.dart';
import 'package:pikotea_full/widgets/item_widget.dart';

class SecondPage extends StatelessWidget {
  /// Second page: static grid
  ///
  SecondPage({Key? key}) : super(key: key);
  static const routeName = '/second';

  // Scaffold key needed to get endDrawer state
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  /// Static list of items
  static final List<ItemModel> _items = [
    ItemModel(asset: assets.burgerImg, category: ItemCategory.burgers),
    ItemModel(asset: assets.cakeImg, category: ItemCategory.cakes),
    ItemModel(asset: assets.donutsImg, category: ItemCategory.donuts),
    ItemModel(asset: assets.fruitImg, category: ItemCategory.fruits),
    ItemModel(asset: assets.pizzaImg, category: ItemCategory.pizzas),
    ItemModel(asset: assets.tacoImg, category: ItemCategory.tacos),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onBackPressed(context),
      child: Scaffold(
        key: _key,
        appBar: CustomAppBar(
            title:
                AppLocalizations.of(context)?.secondPageTitle ?? "Second Page"),
        endDrawer: const CustomDrawer(),
        body: OrientationBuilder(
          builder: (context, orientation) {
            final int columns = orientation == Orientation.landscape ? 3 : 2;
            return Center(
              child: SizedBox(
                width: orientation == Orientation.landscape
                    ? MediaQuery.of(context).size.width * .5
                    : MediaQuery.of(context).size.width * .9,
                child: AnimationLimiter(
                  child: GridView.builder(
                    itemCount: _items.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: columns,
                    ),
                    padding: const EdgeInsets.all(8),
                    itemBuilder: (context, index) {
                      return AnimationConfiguration.staggeredGrid(
                          position: index,
                          columnCount: index ~/ columns,
                          duration: const Duration(milliseconds: 750),
                          child: SlideAnimation(
                            child: FadeInAnimation(
                              child: ItemWidget(
                                item: _items[index],
                                onTap: () => Navigator.pushNamed(
                                    context, ThirdPage.routeName,
                                    arguments: _items[index]),
                              ),
                            ),
                          ));
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  /// Controls the back action
  /// Closes endDrawer when open, otherwise it shows a ConfirmDialog to go back to main
  Future<bool> _onBackPressed(BuildContext context) async {
    // close endDrawer if is open
    if (_key.currentState?.isEndDrawerOpen == true) {
      Navigator.pop(context);
      return false;
    }

    // show confirm dialog
    final isConfirmed = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
              AppLocalizations.of(context)?.exitConfirmationTitle ?? "Hey!"),
          content: Text(AppLocalizations.of(context)?.exitConfirmationBody ??
              "Seguro que deseas volver a la pantalla anterior?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .popUntil(ModalRoute.withName(FirstPage.routeName));
              },
              child: Text(
                  AppLocalizations.of(context)?.exitConfirmationPositive ??
                      "Sí"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                AppLocalizations.of(context)?.exitConfirmationNegative ?? "No",
                style: const TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );

    return isConfirmed == true;
  }
}
