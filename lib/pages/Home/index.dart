import 'package:flutter/material.dart';
import 'package:mc00_shop/components/Home/MC00Category.dart';
import 'package:mc00_shop/components/Home/MC00Hot.dart';
import 'package:mc00_shop/components/Home/MC00MoreList.dart';
import 'package:mc00_shop/components/Home/MC00Recommend.dart';
import 'package:mc00_shop/components/Home/MC00Slider.dart';
import 'package:mc00_shop/viewmodels/home.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final List<BannerItem> _bannerlist;

  @override
  void initState() {
    super.initState();
    final int batchSeed = DateTime.now().millisecondsSinceEpoch;
    _bannerlist = List.generate(10, (index) {
      final int id = index + 1;
      return BannerItem(
        id: '$id',
        code: '200',
        imageUrl: 'https://www.dmoe.cc/random.php?seed=${batchSeed}_$id',
      );
    });
  }

  List<Widget> _getScrollChildren() {
    return [
      SliverToBoxAdapter(child: Mc00slider(bannerlist: _bannerlist)), //轮播图
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
