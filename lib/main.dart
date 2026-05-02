import 'package:flutter/material.dart';
import 'package:mc00_shop/routes/index.dart';
import 'package:window_manager/window_manager.dart';

Future<void> main(List<String> args) async {
  // 确保 Flutter 绑定已初始化
  WidgetsFlutterBinding.ensureInitialized();

  //初始化 window_manager
  await windowManager.ensureInitialized();

  //配置窗口选项
  WindowOptions windowOptions = const WindowOptions(
    //启动时窗口大小
    size: Size(1280, 720),

    //窗口最小大小
    minimumSize: Size(640, 360),

    //窗口是否居中
    center: true,

    //隐藏系统标题栏
    titleBarStyle: TitleBarStyle.hidden,
  );

  //等待窗口准备就绪并显示
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });
  runApp(getRootWidge());
}
