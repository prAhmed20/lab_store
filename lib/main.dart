import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lab_store/core/route_manager/app_routes.dart';
import 'package:lab_store/presentation_layer/provider/cart_provider.dart';
import 'package:lab_store/presentation_layer/provider/product_provider.dart';
import 'package:lab_store/presentation_layer/provider/theme_provider.dart';
import 'package:provider/provider.dart';

import 'core/style/theme.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeProvider themeProvider = ThemeProvider();

  void getCurrentAppTheme() async {
    themeProvider.setDarkTheme = await ThemeProvider.themePreference.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider())
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, value, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Lab Store',
            theme: Styles.themeData(value.getDarkTheme, context),
            initialRoute: AppRoutes.btmNavScreenRoute,
            onGenerateRoute: AppRouter.onGenerateRoute,
          );
        },
      ),
    );
  }
}
