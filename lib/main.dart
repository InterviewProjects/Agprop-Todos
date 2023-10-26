import 'package:domain_package/domain_export.dart';
import 'package:domain_package/enums/environment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/screens/authentication/sign_in_page.dart';
import 'package:flutter_base/screens/home_page.dart';
import 'package:get/get.dart';

void commonMain(Environment env) async {
  WidgetsFlutterBinding.ensureInitialized();

  /// domain layer
  await DomainLayer.initializeDependencies(env);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    DomainLayer;
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: SignInPage(widgetKey: const ValueKey('SignInPage'), params: {},),
    );
  }
}
