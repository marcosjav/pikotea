import 'package:flutter/material.dart';
import 'package:pikotea/models/item_model.dart';

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
        child: AspectRatio(
          aspectRatio: 1,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Hero(tag: item.text, child: Image.asset(item.asset)),
              ),
              const SizedBox(height: 10),
              Text(item.text),
            ],
          ),
        ),
      ),
    );
  }
}
