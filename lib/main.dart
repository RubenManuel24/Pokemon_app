import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

import 'src/page/home/home_page.dart';
import 'src/page/splash/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return FlutterGetIt(
      pages: [
        FlutterGetItPageBuilder(page: (_) => SplashPage(), path: '/'),
        FlutterGetItPageBuilder(page: (_) => HomePage(), path: '/home'),
      ],
      builder: (BuildContext context,
          Map<String, Widget Function(BuildContext)> routes,
          NavigatorObserver flutterGetItNavObserver) {
        return MaterialApp(
          title: 'Pokémon',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
            useMaterial3: true,
            fontFamily: 'Montserrat',
            scaffoldBackgroundColor: Colors.white,
          ),
          routes: {
            '/': (_) => routes['/']!(context),
             '/home': (_) => routes['/home']!(context),
          },
          navigatorObservers: [flutterGetItNavObserver],
        );
      },
    );
  }
}
