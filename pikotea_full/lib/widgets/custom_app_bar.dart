import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({Key? key, double? toolbarHeight, required this.title})
      : preferredSize = Size.fromHeight(toolbarHeight ?? kToolbarHeight),
        super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Center(
        child: Text(title),
      ),
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      shadowColor: Colors.transparent,
      leading: const BackButton(),
      elevation: 0,
    );
  }

  @override
  final Size preferredSize;
}
