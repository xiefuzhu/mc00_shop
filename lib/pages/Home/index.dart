import 'package:flutter/material.dart';
import 'package:mc00_shop/components/Home/MC00Category.dart';
import 'package:mc00_shop/components/Home/MC00Hot.dart';
import 'package:mc00_shop/components/Home/MC00MoreList.dart';
import 'package:mc00_shop/components/Home/MC00Recommend.dart';
import 'package:mc00_shop/components/Home/MC00Slider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Widget> _getScrollChildren() {
    return [
      SliverToBoxAdapter(child: Mc00slider()), //轮播图
      SliverToBoxAdapter(child: SizedBox(height: 20)), //间距
      SliverToBoxAdapter(child: Mc00category()), //分类
      SliverToBoxAdapter(child: SizedBox(height: 20)), //间距
      SliverToBoxAdapter(child: Mc00recommend()), //推荐
      SliverToBoxAdapter(child: SizedBox(height: 20)), //间距

      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(child: Mc00hot()),
              SizedBox(width: 10),
              Expanded(child: Mc00hot()),
            ],
          ),
        ), //爆款推荐
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10)), //间距
      SliverPadding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        sliver: Mc00morelist(),
      ), //无限滚动
    ];
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: _getScrollChildren(), //减少build里面内容
    );
    // return Center(
    //   child: Text(
    //     "首页",
    //     style: TextStyle(
    //       fontSize: 30,
    //       fontWeight: FontWeight.bold,
    //       color: Theme.of(context).brightness == Brightness.dark
    //           ? Colors.white
    //           : Colors.black,
    //     ),
    //   ),
    // );
  }
}
