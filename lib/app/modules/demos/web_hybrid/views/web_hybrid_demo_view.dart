import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebHybridDemoView extends StatefulWidget {
  const WebHybridDemoView({super.key});

  @override
  State<WebHybridDemoView> createState() => _WebHybridDemoViewState();
}

class _WebHybridDemoViewState extends State<WebHybridDemoView> {
  late final WebViewController _webViewController;
  final List<String> _eventLogs = <String>[];
  String _platformResult = '等待 JS 回调';

  @override
  void initState() {
    super.initState();
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (_) => _appendLog('Web 页面加载完成'),
          onWebResourceError: (error) {
            _appendLog('Web 加载错误: ${error.description}');
          },
        ),
      )
      ..addJavaScriptChannel(
        'NativeBridge',
        onMessageReceived: (message) {
          _appendLog('JS -> Flutter: ${message.message}');
        },
      );
    _loadDemoPage();
  }

  Future<void> _loadDemoPage() async {
    final html = await rootBundle.loadString('assets/web/hybrid_demo.html');
    await _webViewController.loadHtmlString(
      html,
      baseUrl: 'https://xmshop.demo/',
    );
  }

  Future<void> _sendMessageToJs() async {
    final payload = <String, dynamic>{
      'from': 'flutter',
      'platform': Theme.of(context).platform.name,
      'timestamp': DateTime.now().toIso8601String(),
      'message': '你好，JS！这里是 Flutter 端。',
    };
    await _webViewController.runJavaScript(
      'window.onNativeMessage(${jsonEncode(payload)});',
    );
    _appendLog('Flutter -> JS: ${payload['message']}');
  }

  Future<void> _requestJsSummary() async {
    final result = await _webViewController.runJavaScriptReturningResult(
      'window.getDemoSummary ? window.getDemoSummary() : "JS 未就绪";',
    );
    setState(() {
      _platformResult = result.toString();
    });
    _appendLog('Flutter 收到 JS 汇总: $_platformResult');
  }

  void _appendLog(String message) {
    setState(() {
      _eventLogs.insert(0, '[${DateTime.now().toIso8601String()}] $message');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              FilledButton(
                onPressed: _sendMessageToJs,
                child: const Text('Flutter 调用 JS'),
              ),
              OutlinedButton(
                onPressed: _requestJsSummary,
                child: const Text('读取 JS 状态'),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'JS 汇总: $_platformResult',
              style: const TextStyle(fontSize: 13),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: WebViewWidget(controller: _webViewController),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          flex: 2,
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(12, 0, 12, 12),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.circular(8),
            ),
            child: _eventLogs.isEmpty
                ? const Text(
                    '等待交互日志...',
                    style: TextStyle(color: Colors.white70),
                  )
                : ListView.builder(
                    itemCount: _eventLogs.length,
                    itemBuilder: (context, index) {
                      return Text(
                        _eventLogs[index],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      );
                    },
                  ),
          ),
        ),
      ],
    );
  }
}
