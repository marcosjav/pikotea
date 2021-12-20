import 'package:flutter/material.dart';
import 'package:pikotea/constants/assets.dart' as assets;
import 'package:pikotea/models/item_model.dart';
import 'package:pikotea/ui/first_page.dart';
import 'package:pikotea/ui/third_page.dart';
import 'package:pikotea/widgets/item_widget.dart';

class SecondPage extends StatelessWidget {
  SecondPage({Key? key}) : super(key: key);
  static const routeName = '/second';
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  /// Static list of items
  static final List<ItemModel> _items = [
    ItemModel(asset: assets.burgerImg, text: "Hamburguesas"),
    ItemModel(asset: assets.cakeImg, text: "Tartas"),
    ItemModel(asset: assets.donutsImg, text: "Donas"),
    ItemModel(asset: assets.fruitImg, text: "Frutas"),
    ItemModel(asset: assets.pizzaImg, text: "Pizzas"),
    ItemModel(asset: assets.tacoImg, text: "Tacos"),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onBackPressed(context),
      child: Scaffold(
        key: _key,
        appBar: AppBar(
          title: const Text("Segunda pantalla"),
          leading: const BackButton(),
        ),
        endDrawer: const Drawer(
          child: Center(child: Text("Texto centrado")),
        ),
        body: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 15,
          padding: const EdgeInsets.all(8),
          children: _items
              .map(
                (item) => ItemWidget(
                  item: item,
                  onTap: () => Navigator.pushNamed(context, ThirdPage.routeName,
                      arguments: item),
                ),
              )
              .toList(),
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
          title: const Text("Hey!"),
          content:
              const Text("Seguro que deseas volver a la pantalla anterior?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .popUntil(ModalRoute.withName(FirstPage.routeName));
              },
              child: const Text("Sí"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "No",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );

    return isConfirmed == true;
  }
}
