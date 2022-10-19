import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyPixel extends StatelessWidget {
  final color;
  final child;
  final onTap;

  MyPixel({this.color, this.child, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: GestureDetector(
            onTap: onTap, child: Container(color: color, child: child)),
      ),
    );
  }
}
