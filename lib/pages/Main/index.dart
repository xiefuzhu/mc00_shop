import 'package:flutter/material.dart';
import 'package:mc00_shop/pages/Cart/index.dart';
import 'package:mc00_shop/pages/Category/index.dart';
import 'package:mc00_shop/pages/Home/index.dart';
import 'package:mc00_shop/pages/Mine/index.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  //定义数据,根据数据进行渲染的4个导航
  //一般应用的导航是固定的
  final List<Map<String, String>> _tapList = [
    {
      "icon": "lib/assets/ic_public_home_normal.png", //正常显示的图标
      "active_icon": "lib/assets/ic_public_home_active.png", //激活状态
      "text": "首页",
    },
    {
      "icon": "lib/assets/ic_public_pro_normal.png", //正常显示的图标
      "active_icon": "lib/assets/ic_public_pro_active.png", //激活状态
      "text": "分类",
    },
    {
      "icon": "lib/assets/ic_public_cart_normal.png", //正常显示的图标
      "active_icon": "lib/assets/ic_public_cart_active.png", //激活状态
      "text": "购物车",
    },
    {
      "icon": "lib/assets/ic_public_my_normal.png", //正常显示的图标
      "active_icon": "lib/assets/ic_public_my_active.png", //激活状态
      "text": "我的",
    },
  ];
  int _currentIndex = 0; //当前激活的索引

  //返回底部渲染的四个导航组件
  List<BottomNavigationBarItem> _getTabBarWidget() {
    return List.generate(4, (int index) {
      return BottomNavigationBarItem(
        icon: Image.asset(
          _tapList[index]["icon"]!,
          width: 30,
          height: 30,
        ), //正常图标
        activeIcon: Image.asset(
          _tapList[index]["active_icon"]!,
          width: 30,
          height: 30,
        ), //激活图标
        label: _tapList[index]["text"], //文本
      );
    });
  }

  List<Widget> _getChildren() {
    return [HomeView(), CategoryView(), CartView(), MinePage()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("MC00_Shop")),
      body: SafeArea(
        child: IndexedStack(
          index: _currentIndex, //根据当前激活的索引显示对应的组件
          children: _getChildren(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true, //显示未选中时的文本
        selectedItemColor: Colors.blueAccent, //选中时的颜色
        unselectedItemColor: Colors.black, //未选中时的图标颜色
        onTap: (int index) {
          _currentIndex = index; //更新当前激活的索引
          setState(() {}); //刷新页面
        },
        currentIndex: _currentIndex, //当前激活的索引
        items: _getTabBarWidget(),
      ),
    );
  }
}
