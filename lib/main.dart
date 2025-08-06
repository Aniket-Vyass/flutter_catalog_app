import 'package:flutter/material.dart';
import 'package:flutter_catalouge/core/store.dart';
import 'package:flutter_catalouge/pages/cart_page.dart';
import 'package:flutter_catalouge/pages/home_page.dart';
import 'package:flutter_catalouge/pages/login_page.dart';
import 'package:flutter_catalouge/utils/routes.dart';
import 'package:flutter_catalouge/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

//wrapping MyApp in VxState will give us the power to manage state
void main() {
  runApp(VxState(store: MyStore(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => HomePage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.cartRoute: (context) => CartPage(),
      },
    );
  }
}
