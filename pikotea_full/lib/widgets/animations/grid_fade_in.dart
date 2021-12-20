import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class GridFadeInUp extends StatefulWidget {
  const GridFadeInUp(
      {Key? key,
      required this.children,
      this.delay,
      this.duration,
      this.initDelay,
      this.crossAxisAlignment,
      this.mainAxisSize,
      this.mainAxisAlignment})
      : super(key: key);
  final List<Widget> children;
  final Duration? delay;
  final Duration? initDelay;
  final Duration? duration;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisAlignment? mainAxisAlignment;
  final MainAxisSize? mainAxisSize;

  @override
  _GridFadeInUpState createState() => _GridFadeInUpState();
}

class _GridFadeInUpState extends State<GridFadeInUp> {
  List<Widget> children = [];
  late Duration initDelay, delay, duration;

  @override
  void initState() {
    initDelay = widget.initDelay ?? const Duration(milliseconds: 0);
    delay = widget.delay ?? const Duration(milliseconds: 150);
    duration = widget.duration ?? const Duration(milliseconds: 500);

    for (int i = 0; i < widget.children.length; i++) {
      children.add(FadeIn(
        delay: initDelay + delay * i,
        duration: duration,
        child: widget.children[i],
      ));
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) => FadeIn(
        delay: initDelay,
        duration: const Duration(microseconds: 0),
        child: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 15,
          padding: const EdgeInsets.all(8),
          shrinkWrap: true,
          children: children,
        ),
      );
}
