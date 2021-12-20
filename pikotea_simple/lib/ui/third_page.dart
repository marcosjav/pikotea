import 'package:flutter/material.dart';
import 'package:pikotea/models/item_model.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);
  static const routeName = '/third';

  @override
  Widget build(BuildContext context) {
    // Extract the arguments from the current ModalRoute
    final item = ModalRoute.of(context)!.settings.arguments as ItemModel?;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tercer pantalla"),
      ),
      body: Center(
        child: _buildBody(context, item),
      ),
    );
  }

  /// Construct the scaffold body, showing a message when no item found
  Widget _buildBody(BuildContext context, ItemModel? item) {
    if (item == null) {
      return const Center(
        child: Text("Sin ítem seleccionado"),
      );
    }

    return FittedBox(
      fit: BoxFit.contain,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(item.asset),
          Text(
            item.text,
            style: Theme.of(context).textTheme.headline3,
          )
        ],
      ),
    );
  }
}
