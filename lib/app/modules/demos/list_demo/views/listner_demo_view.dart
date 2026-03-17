import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ListnerDemoView extends StatefulWidget {
  const ListnerDemoView({super.key});

  @override
  State<ListnerDemoView> createState() => _ListnerDemoViewState();
}

class _ListnerDemoViewState extends State<ListnerDemoView> {
  double top = 0;
  double left = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // NotificationListener(
        //   child: Container(color: Colors.blue, child: Text('notification')),
        //   onNotification: (notification) {
        //     print(notification.toString());
        //     return true;
        //   },
        // ),
        Positioned(
          top: top,
          left: left,
          child: RawGestureDetector(
            behavior: HitTestBehavior.opaque,
            gestures: {
              ImmediateMultiDragGestureRecognizer:
                  GestureRecognizerFactoryWithHandlers<
                    ImmediateMultiDragGestureRecognizer
                  >(() => ImmediateMultiDragGestureRecognizer(), (
                    ImmediateMultiDragGestureRecognizer instance,
                  ) {
                    instance.onStart = (Offset position) {
                      return _CircleDrag(
                        onUpdate: (details) => setState(() {
                          top += details.delta.dy;
                          left += details.delta.dx;
                        }),
                        onEnd: (_) => setState(() {
                          // top = 0;
                          // left = 0;
                        }),
                      );
                    };
                  }),
            },
            child: CircleAvatar(child: Text('A')),
          ),
        ),
      ],
    );
  }
}

class _CircleDrag extends Drag {
  _CircleDrag({required this.onUpdate, required this.onEnd});

  final void Function(DragUpdateDetails) onUpdate;
  final void Function(DragEndDetails) onEnd;

  @override
  void update(DragUpdateDetails details) => onUpdate(details);

  @override
  void end(DragEndDetails details) => onEnd(details);
}
