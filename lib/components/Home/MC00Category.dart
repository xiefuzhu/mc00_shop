import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

class Mc00category extends StatefulWidget {
  const Mc00category({super.key});

  @override
  State<Mc00category> createState() => _Mc00categoryState();
}

class _Mc00categoryState extends State<Mc00category> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.08,
      child: DynamicColorBuilder(
        builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                width: MediaQuery.sizeOf(context).width * 0.23,
                alignment: Alignment.center,
                color: Theme.of(context).colorScheme.primary.withAlpha(100),
                child: Text("分类$index"),
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
              );
            },
          );
        },
      ),
    );
  }
}
