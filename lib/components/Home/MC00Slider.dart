import 'package:carousel_slider/carousel_slider.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:mc00_shop/viewmodels/home.dart';

class Mc00slider extends StatefulWidget {
  final List<BannerItem> bannerlist;

  const Mc00slider({super.key, required this.bannerlist});

  @override
  State<Mc00slider> createState() => _Mc00sliderState();
}

class _Mc00sliderState extends State<Mc00slider> {
  CarouselSliderController _controller = CarouselSliderController();
  Widget _getSlider() {
    //轮播图插件
    return CarouselSlider(
      carouselController: _controller, //绑定控制器
      items: List.generate(widget.bannerlist.length, (int index) {
        return Image.network(
          widget.bannerlist[index].imageUrl,
          fit: BoxFit.cover,
        );
      }),
      options: CarouselOptions(
        viewportFraction: 1,
        autoPlay: true,
        height: MediaQuery.sizeOf(context).height * 0.33,
      ),
    );
  }

  Widget _getDots() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 10,

      child: SizedBox(
        height: 40,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.bannerlist.length, (int index) {
            return GestureDetector(
              onTap: () {
                _controller.animateToPage(index);
              },
              child: Container(
                height: 6,
                width: 40,

                margin: EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [_getSlider(), _getDots()]);
    // return SizedBox(
    //   height: MediaQuery.sizeOf(context).height * 0.33,
    //   child: DynamicColorBuilder(
    //     builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
    //       return Container(
    //         alignment: Alignment.center,
    //         color: Theme.of(context).colorScheme.primary.withAlpha(180),
    //         child: Text("轮播图"),
    //       );
    //     },
    //   ),
    // );
  }
}
