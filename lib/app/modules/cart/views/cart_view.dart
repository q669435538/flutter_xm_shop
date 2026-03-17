import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CartView'), centerTitle: true),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(
                'https://preview.qiantucdn.com/58pic/54/50/07/61358PICIJ5SeXrp32N42_PIC2018_png_aiys_PIC2018.jpg!qt_h320_webp',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
              Container(
                width: 110,
                height: 110,
                // color: const Color.fromARGB(255, 183, 125, 1),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 183, 125, 1),
                  borderRadius: BorderRadius.circular(55),
                ),
                child: CircleAvatar(
                  radius: 100,
                  foregroundImage: NetworkImage(
                    'https://preview.qiantucdn.com/58pic/54/50/07/61358PICIJ5SeXrp32N42_PIC2018_png_aiys_PIC2018.jpg!qt_h320_webp',
                  ),
                  // child: Image.network(
                  //   'https://pic.616pic.com/ys_img/00/98/66/Wl0quzCsyB.jpg',
                  //   width: 100,
                  //   height: 100,
                  //   fit: BoxFit.cover,
                  // ),
                ),
              ),
              ColoredBox(
                color: Colors.purple,
                child: Container(
                  width: 100,
                  height: 50,
                  // constraints: BoxConstraints(
                  //   maxWidth: 200,
                  //   minWidth: 50,
                  //   maxHeight: 100,
                  //   minHeight: 20,
                  // ),
                  decoration: BoxDecoration(color: Colors.orange),
                  //  RoundTangleButton(
                  //   title: '点击我',
                  //   onPressed: () {
                  //     print('====点击了按钮');
                  //   },
                  // ),
                ),
              ),
              SizedBox(height: 200),
              Transform.rotate(
                angle: 90 / 360 * 3.14 * 2,
                child: Container(
                  color: Colors.amber,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Container(
                      color: Colors.blue,
                      padding: EdgeInsets.all(20),
                      child: const Text(
                        'CartView is working',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RoundTangleButton extends StatelessWidget {
  const RoundTangleButton({super.key, this.title = 'Button', this.onPressed});
  final String title;
  final Function? onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed != null ? onPressed!() : null,
      child: Container(
        alignment: Alignment.center,
        // width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20),
        padding: EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(title),
      ),
    );
  }
}
