import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class ColumnFadeInUp extends StatefulWidget {
  const ColumnFadeInUp(
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
  _ColumnFadeInUpState createState() => _ColumnFadeInUpState();
}

class _ColumnFadeInUpState extends State<ColumnFadeInUp> {
  List<Widget> children = [];
  late Duration initDelay, delay, duration;

  @override
  void initState() {
    initDelay = widget.initDelay ?? const Duration(milliseconds: 0);
    delay = widget.delay ?? const Duration(milliseconds: 50);
    duration = widget.duration ?? const Duration(milliseconds: 300);

    for (int i = 0; i < widget.children.length; i++) {
      children.add(FadeInUp(
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
        child: Column(
          mainAxisSize: widget.mainAxisSize ?? MainAxisSize.min,
          mainAxisAlignment:
              widget.mainAxisAlignment ?? MainAxisAlignment.start,
          crossAxisAlignment:
              widget.crossAxisAlignment ?? CrossAxisAlignment.center,
          children: children,
        ),
      );
}
