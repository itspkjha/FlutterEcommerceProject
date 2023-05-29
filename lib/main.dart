import 'package:flutter/material.dart';
import 'package:flutter_catalogue/core/store.dart';
import 'package:flutter_catalogue/pages/cart_page.dart';
import 'package:flutter_catalogue/utils/routes.dart';
import 'package:flutter_catalogue/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';


import './pages/home_page.dart';
import './pages/login_page.dart';

void main() {
  runApp(VxState(store: MyStore(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage(),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => const LoginPage(),
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.loginRoute: (context) => const LoginPage(),
        MyRoutes.cartRoute: (context) => const CartPage(),
      },
    );
  }
}
