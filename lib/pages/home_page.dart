// ignore_for_file: public_member_api_docs, sort_constructors_first, unnecessary_import
// ignore_for_file: unused_import, sort_child_properties_last
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalouge/pages/cart_page.dart';
import 'package:flutter_catalouge/widgets/home_widgets/catalog_header.dart';
import 'package:flutter_catalouge/widgets/home_widgets/catalog_list.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_catalouge/models/catalog.dart';
import 'package:flutter_catalouge/utils/routes.dart';
import 'package:flutter_catalouge/widgets/drawer.dart';
import 'package:flutter_catalouge/widgets/item_widget.dart';
import 'package:flutter_catalouge/widgets/themes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "Codepur";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson = await rootBundle.loadString(
      "assets/files/catalog.json",
    );
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items =
        productsData.map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }
//"https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-12-pro-blue-hero?wid=940&hei=1112&fmt=png-alpha&qlt=80&.v=1604021661000"

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
        backgroundColor:
            context.theme.floatingActionButtonTheme.backgroundColor,
        child: Icon(CupertinoIcons.cart_fill, color: Colors.white),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32, //shortcut for edgeinsets.all(32)
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if ((CatalogModel.items.isNotEmpty))
                CatalogList().py16().expand()
              else
                CircularProgressIndicator().centered().py16().expand(),
            ],
          ),
        ),
      ),
    );
  }
}
