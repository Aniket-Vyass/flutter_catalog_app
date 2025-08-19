// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_import
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_catalouge/widgets/home_widgets/add_to_cart.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_catalouge/models/cart.dart';
import 'package:flutter_catalouge/models/catalog.dart';
import 'package:flutter_catalouge/pages/home_detail_page.dart';
import 'package:flutter_catalouge/widgets/home_widgets/catalog_image.dart';
import 'package:flutter_catalouge/widgets/themes.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return !context.isMobile
        ? GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20.0,
          ),
          shrinkWrap: true,
          itemCount: CatalogModel.items.length,
          itemBuilder: (context, index) {
            final catalog = CatalogModel.items[index];
            return InkWell(
              onTap:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeDetailPage(catalog: catalog),
                    ),
                  ),
              child: CatalogItem(catalog: catalog),
            );
          },
          //itemCount: CatalogModel.items.length,
        )
        : ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final catalog = CatalogModel.items[index];
            return InkWell(
              onTap:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeDetailPage(catalog: catalog),
                    ),
                  ),
              child: CatalogItem(catalog: catalog),
            );
          },
          itemCount: CatalogModel.items.length,
        );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    var children = [
      Hero(
        tag: Key(catalog.id.toString()),
        child: CatalogImage(image: catalog.image),
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text.xl.color(Theme.of(context).hintColor).bold.make(),
            catalog.desc.text.textStyle(context.captionStyle).make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                "\$${catalog.price}".text.bold.xl.make(),
                AddToCart(catalog: catalog), //.wh(120, 35),
              ],
            ).pOnly(right: 8.0),
          ],
        ).p(context.isMobile ? 0 : 16),
      ),
    ];
    return VxBox(
      child:
          context.isMobile
              ? Row(children: children)
              : Column(children: [children[0], children[1]]),
    ).color(context.cardColor).roundedLg.square(150).make().py16();
  }
}
