import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CustomComponentDemoView extends GetView {
  const CustomComponentDemoView({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GradientButton(
          backgroundColor: Colors.blueGrey,
          tap: () {
            print('parent button tapped!');
          },
          colors: [
            Colors.red,
            Colors.orange,
            Colors.yellow,
            Colors.green,
            Colors.cyan,
            Colors.blue,
            Colors.purple,
          ],
          child: Text(
            'Cunstom Button',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}

class GradientButton extends StatefulWidget {
  const GradientButton({
    super.key,
    required this.child,
    this.tap,
    this.colors,
    this.backgroundColor,
  });
  final List<Color>? colors;
  final Function? tap;
  final Color? backgroundColor;
  final Widget child;
  @override
  State<GradientButton> createState() => _GradientButtonState();
}

class _GradientButtonState extends State<GradientButton> {
  _getChildWidge() {
    if (widget.colors == null) {
      return widget.child;
    } else {
      return ShaderMask(
        shaderCallback: (Rect bounds) {
          return LinearGradient(
            colors: widget.colors!.toList(),
          ).createShader(bounds);
        },
        blendMode: BlendMode.srcIn,
        child: widget.child,
      );
    }
  }

  _getFinalButton() {
    if (widget.backgroundColor != null) {
      return Container(color: widget.backgroundColor, child: _getChildWidge());
    }
    return _getChildWidge();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.tap != null) {
          widget.tap!();
        }
      },
      child: _getFinalButton(),
    );
  }
}
