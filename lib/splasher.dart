import 'package:capricon_stock/app/view/app.dart';
import 'package:capricon_stock/bootstrap.dart';
import 'package:capricon_stock/features/splash/view/splash_view.dart';
import 'package:flutter/material.dart';

class Splasher extends StatelessWidget {
  const Splasher({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue),
      home: SplashView(
        removeSpalshLoader: false,
        onInitialized: (container) {
          bootstrap(
            () => const App(),
            parent: container,
          );
        },
      ),
    );
  }
}
