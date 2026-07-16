# xmshop

Flutter 三端（iOS / Android / HarmonyOS）混合开发示例工程。

## 已完成能力

1. 新增 `WebView + JavaScript` 双向通信组件：
   - JS 通过 `NativeBridge.postMessage(...)` 调用 Flutter
   - Flutter 通过 `runJavaScript(...)` 回调 JS
2. 新增演示页面：
   - Flutter 端：`lib/app/modules/demos/web_hybrid/views/web_hybrid_demo_view.dart`
   - Web 端：`assets/web/hybrid_demo.html`
3. 已接入到「我的」Tab 页面，打开应用即可体验混合开发示例。

## 运行与鸿蒙适配说明

1. 获取依赖：
   ```bash
   flutter pub get
   ```
2. iOS / Android 运行：
   ```bash
   flutter run -d ios
   flutter run -d android
   ```
3. HarmonyOS 运行（需使用支持 OpenHarmony 的 Flutter SDK 环境）：
   ```bash
   flutter run -d ohos
   ```
4. DevEco Studio 验证：
   - 用 DevEco Studio 打开项目下的 `ohos/` 目录
   - 进入 `File -> Project Structure -> Signing Configs`
   - 勾选 `Automatically generate signature`
   - 选择设备后运行 `entry` 模块

## Flutter 开发后，如何在 DevEco 运行调试

1. 在 Flutter 工程中完成代码修改（`lib/`、`assets/`、`pubspec.yaml`）。
2. 在项目根目录执行（使用 OHOS Flutter SDK）：
   ```bash
   flutter pub get
   ```
3. 如有依赖、插件、平台配置改动，先执行：
   ```bash
   flutter build hap --debug
   ```
4. 用 DevEco Studio 打开：
   ```text
   /Users/yangshucheng/fvm/versions/copilot-worktrees/flutter_xm_shop/q669435538-didactic-goggles/ohos
   ```
5. 确认签名配置：
   - `File -> Project Structure -> Signing Configs`
   - 勾选 `Automatically generate signature`
6. 连接设备，运行/调试 `entry` 模块。

建议：
- Flutter 页面和业务逻辑联调优先使用 `flutter run -d ohos`（热重载更高效）。
- 签名、打包、HAP 安装问题优先在 DevEco Studio 排查。

> 本工程使用 OpenHarmony SIG 维护的 `webview_flutter`（gitee 源）实现 iOS、Android、HarmonyOS 统一 WebView 交互层。
