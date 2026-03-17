import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../controllers/list_demo_controller.dart';
import '../../../../services/keepalive_wrapper.dart';
import 'package:flutter_platform_alert/flutter_platform_alert.dart';

class ListDemoView extends GetView<ListDemoController> {
  const ListDemoView({super.key});

  @override
  Widget build(BuildContext context) {
    // return ListDemo();
    // return GridDemo();
    // return KeepAliveWrapper(child: PageViewDemo());
    // return SliverListDemo();
    return SnapAppBarDemo();
  }
}

class ListDemo extends StatefulWidget {
  const ListDemo({super.key});

  @override
  State<ListDemo> createState() => _ListDemoState();
}

class _ListDemoState extends State<ListDemo> {
  var controller = Get.find<ListDemoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Obx(
        () => controller.showBackTop.value
            ? FloatingActionButton(
                shape: const CircleBorder(),
                onPressed: controller.scrollToTop,
                child: const Icon(Icons.arrow_upward),
              )
            : const SizedBox.shrink(),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 100,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              // padding: const EdgeInsets.symmetric(horizontal: 8),
              itemBuilder: (context, index) => SizedBox(
                width: 100,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.primaries[index % Colors.primaries.length],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      index.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              separatorBuilder: (context, index) => const SizedBox(width: 16),
              itemCount: 10,
            ),
          ),
          Expanded(
            child: ListView.separated(
              controller: controller.scrollController,
              itemBuilder: (context, index) {
                if (controller.words[index] == controller.loadingText) {
                  if (controller.words.length - 1 < 100 &&
                      controller.loading.value == true) {
                    controller.loadMoreWords();
                    return Container(
                      padding: EdgeInsets.all(16),
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    );
                  } else {
                    return Container(
                      padding: EdgeInsets.all(16),
                      alignment: Alignment.center,
                      child: Text('没有更多了'),
                    );
                  }
                }
                return ListTile(title: Text(controller.words[index]));
              },
              separatorBuilder: (context, index) => Divider(height: 2),
              itemCount: controller.words.length,
            ),
          ),
        ],
      ),
    );
  }
}

class GridDemo extends StatefulWidget {
  const GridDemo({super.key});

  @override
  State<GridDemo> createState() => _GridDemoState();
}

class _GridDemoState extends State<GridDemo> {
  var controller = Get.find<ListDemoController>();

  // @override
  // void initState() {
  //   super.initState();
  //   // controller.words.clear();
  //   // controller.words.addAll(nouns.take(20).toList());
  // }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          childAspectRatio: 1,
        ),
        itemCount: controller.words.length,
        itemBuilder: (BuildContext context, int index) {
          final bgColor = Colors.primaries[index % Colors.primaries.length]
              .withValues(alpha: 0.5);
          final textColor = bgColor.computeLuminance() > 0.5
              ? Colors.black
              : Colors.white;
          return Container(
            margin: const EdgeInsets.all(0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: bgColor,
            ),
            child: Center(
              child: Text(
                controller.words[index],
                style: TextStyle(fontSize: 18, color: textColor),
              ),
            ),
          );
        },
      ),
    );
  }
}

class PageViewDemo extends StatelessWidget {
  const PageViewDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.primaries[index % Colors.primaries.length],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(child: Text(index.toString())),
        );
      },
    );
  }
}

class SliverListDemo extends StatelessWidget {
  SliverListDemo({super.key});

  customSeparaterBuidler(int index) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsetsGeometry.only(left: 8, right: 8),
            child: Divider(height: 2),
          ),
        ),
        Text(words[index], style: TextStyle(color: Colors.grey, fontSize: 12)),
        Expanded(
          child: Padding(
            padding: EdgeInsetsGeometry.only(left: 8, right: 8),
            child: Divider(height: 2),
          ),
        ),
      ],
    );
  }

  final List<String> words = List.generate(20, (index) => 'Item $index');
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          pinned: true,
          delegate: _SliverAppBarDelegate(
            minHeight: 100,
            maxHeight: 200,
            child: PageViewDemo(),
          ),
        ),
        SliverList.separated(
          itemBuilder: (context, index) {
            if (index == words.length - 1) {
              return Column(
                children: [
                  ListTile(title: Text(words[index])),
                  customSeparaterBuidler(index),
                  SizedBox(height: 20),
                ],
              );
            }
            return ListTile(title: Text(words[index]));
          },
          separatorBuilder: (context, index) {
            return customSeparaterBuidler(index);
          },
          itemCount: words.length,
        ),
      ],
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class SnapAppBarDemo extends StatefulWidget {
  const SnapAppBarDemo({super.key});

  @override
  State<StatefulWidget> createState() => _SnapAppBarDemoState();
}

class _SnapAppBarDemoState extends State<SnapAppBarDemo> {
  final isChecked = false.obs;

  static final colors = <int, Color>{
    0: Color(0xFFF3E5F5),
    100: Color(0xFFE1BEE7),
    200: Color(0xFFCE93D8),
    300: Color(0xFFBA68C8),
    400: Color(0xFFAB47BC),
    500: Colors.purple,
    600: Color(0xFF8E24AA),
    700: Color(0xFF7B1FA2),
    800: Color(0xFF6A1B9A),
    900: Color(0xFF4A148C),
  };
  buildSliverList(int count) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => ListTile(
          contentPadding: EdgeInsets.zero,
          title: Align(
            alignment: Alignment.centerLeft,
            child: Expanded(
              child: Container(
                alignment: Alignment.centerLeft,
                width: double.infinity,
                height: 40,
                padding: EdgeInsets.zero,
                color: colors[index % colors.length * 100],
                child: Text('Item $index'),
              ),
            ),
          ),
        ),
        childCount: count,
      ),
    );
  }

  Future<String> awaitText() async {
    await Future.delayed(Duration(seconds: 4));

    // return '这是异步加载的文本';
    // throw Exception('加载文本失败');
    return Future.error('加载文本失败');
  }

  getFutureBuilder() {
    return FutureBuilder<String>(
      future: awaitText(),
      initialData: '这是初始值',
      builder: (context, future) {
        if (future.connectionState == ConnectionState.done) {
          if (future.hasError) {
            return Padding(
              padding: EdgeInsets.all(16),
              child: Text('Error: ${future.error}'),
            );
          } else {
            return Padding(
              padding: EdgeInsets.all(16),
              child: Text(future.data ?? 'No data'),
            );
          }
        } else if (future.connectionState == ConnectionState.none) {
          return Padding(padding: EdgeInsets.all(16), child: Text('Future未开始'));
        } else {
          return Padding(
            padding: EdgeInsets.all(16),
            child: Center(
              child: SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
          );
        }
      },
    );
  }

  showAdaptAlert() async {
    final result = await FlutterPlatformAlert.showCustomAlert(
      windowTitle: '这是一个标题',
      text: '''这是弹框的内容<int, Color>{
    50: Color(0xFFF3E5F5),
    100: Color(0xFFE1BEE7),
    200: Color(0xFFCE93D8),
    300: Color(0xFFBA68C8),
    400: Color(0xFFAB47BC),
    500: Color(_purplePrimaryValue),
    600: Color(0xFF8E24AA),
    700: Color(0xFF7B1FA2),
    800: Color(0xFF6A1B9A),
    900: Color(0xFF4A148C),
  }''',
      iconStyle: IconStyle.warning,
      positiveButtonTitle: '确定',
      negativeButtonTitle: '取消',
      neutralButtonTitle: '忽略',
      options: PlatformAlertOptions(
        ios: IosAlertOptions(
          alertStyle: IosAlertStyle.actionSheet,
          negativeButtonStyle: IosButtonStyle.destructive,
        ),
      ),
    );
    print(result);
  }

  showCheckBoxDialog() async {
    isChecked.value = false;
    final result = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('这是一个标题'),
          content: CheckBoxDialogView(
            text: '这是一个带有checkbox的弹框',
            // value: isChecked.value,
            onChanged: (newValue) {
              isChecked.value = newValue!;
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(isChecked.value);
              },
              child: Text('确定'),
            ),
          ],
        );
      },
    );
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                // toolbarHeight: 200,
                floating: true,
                snap: true,
                expandedHeight: 200,
                forceElevated: innerBoxIsScrolled,
                flexibleSpace: FlexibleSpaceBar(
                  background: Expanded(
                    child: Image.network(
                      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/15/ca/e2/f6/this-is-yonaha-maehama.jpg?w=900&h=500&s=1',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ];
        },
        body: Builder(
          builder: (context) {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: getFutureBuilder()),
                SliverToBoxAdapter(
                  child: TextButton.icon(
                    onPressed: () async {
                      showAdaptAlert();
                    },
                    icon: Icon(Icons.access_time),
                    label: Text('Alert'),
                  ),
                ),
                SliverToBoxAdapter(
                  child: ElevatedButton(
                    onPressed: () async {
                      await showCheckBoxDialog();
                      print('弹框关闭了: isChecked = ${isChecked.value}');
                    },
                    child: Text('Show CheckBox Dialog'),
                  ),
                ),
                SliverOverlapInjector(
                  handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                    context,
                  ),
                ),
                buildSliverList(100),
              ],
            );
          },
        ),
      ),
    );
  }
}

class CheckBoxDialogView extends StatefulWidget {
  const CheckBoxDialogView({
    super.key,
    required this.onChanged,
    this.value,
    this.text,
  });

  final ValueChanged<bool?> onChanged;

  final String? text;

  final bool? value;
  @override
  State<CheckBoxDialogView> createState() => _CheckBoxDialogViewState();
}

class _CheckBoxDialogViewState extends State<CheckBoxDialogView> {
  bool? _value;

  @override
  void initState() {
    super.initState();
    if (widget.value != null) {
      _value = widget.value;
    } else {
      _value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _value = !_value!;
        });
        widget.onChanged(_value);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Checkbox(value: _value, onChanged: (newValue) {}),
          if (widget.text != null) Text(widget.text!),
        ],
      ),
    );
  }
}
