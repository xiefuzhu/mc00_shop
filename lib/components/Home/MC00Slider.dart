import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

class Mc00slider extends StatefulWidget {
  const Mc00slider({super.key});

  @override
  State<Mc00slider> createState() => _Mc00sliderState();
}

class _Mc00sliderState extends State<Mc00slider> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.33,
      child: DynamicColorBuilder(
        builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
          return Container(
            alignment: Alignment.center,
            color: Theme.of(context).colorScheme.primary.withAlpha(180),
            child: Text("轮播图"),
          );
        },
      ),
    );
  }
}
