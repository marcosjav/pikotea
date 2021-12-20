import 'package:flutter/material.dart';
import 'package:pikotea_full/models/item_model.dart';

/// Shows item image and name
///
/// [item] data is required
/// [onTap] action is required
class ItemWidget extends StatelessWidget {
  const ItemWidget({Key? key, required this.item, required this.onTap})
      : super(key: key);
  final ItemModel item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 2,
          margin: const EdgeInsets.all(8),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Hero(tag: item.asset, child: Image.asset(item.asset)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      item.getName(context),
                      style: Theme.of(context).textTheme.headline5,
                    ),
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
