import 'package:flutter/material.dart';
import 'package:pikotea/models/item_model.dart';

/// Simple widget with image and text
///
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Image.asset(item.asset),
            ),
            const SizedBox(height: 10),
            Text(item.text),
          ],
        ),
      ),
    );
  }
}
