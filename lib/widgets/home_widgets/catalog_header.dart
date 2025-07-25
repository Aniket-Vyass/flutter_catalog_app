import 'package:flutter/material.dart';
import 'package:flutter_catalouge/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog products".text.xl4.bold.color(context.theme.hintColor).make(),
        "Trending products".text.xl2.bold.color(MyTheme.darkBluishColor).make(),
      ],
    );
  }
}
