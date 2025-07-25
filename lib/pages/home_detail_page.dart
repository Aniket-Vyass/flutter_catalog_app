import 'package:flutter/material.dart';
import 'package:flutter_catalouge/models/catalog.dart';
import 'package:flutter_catalouge/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child:
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                "\$${catalog.price}".text.bold.xl4.red800.make(),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    //  foregroundColor: MaterialStateProperty.all(

                    //     ),
                    backgroundColor: MaterialStateProperty.all(
                      context.theme.floatingActionButtonTheme.backgroundColor,
                    ),

                    shape: MaterialStateProperty.all(StadiumBorder()),
                  ),
                  child: "Add to cart".text.xl.white.make(),
                ).wh(160, 50),
              ],
            ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image),
            ).h32(context),
            Expanded(
              //expanded is same as '.expanded()' which is used at the end
              child: VxArc(
                height: 30.0,
                arcType: VxArcType.convey,
                edge: VxEdge.top,
                child: Container(
                  color: context.cardColor,
                  width: context.screenWidth,
                  child:
                      Column(
                        children: [
                          catalog.name.text.xl4.bold
                              .color(context.accentColor)
                              .make(),
                          catalog.desc.text
                              .textStyle(context.captionStyle)
                              .xl
                              .make(),
                          10.heightBox,
                          "product's name and this is the price of the product and apple products are the  best products available in the market.Magna mollit consectetur ad ad irure Lorem cillum exercitation."
                              .text
                              .textStyle(context.captionStyle)
                              .make()
                              .px16(),
                        ],
                      ).py64(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
