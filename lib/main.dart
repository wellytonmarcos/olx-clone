import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:olx_mobx/stores/PageStore.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

import 'screens/base/BaseScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await inicializeParse();
  setupLocators();
  runApp(MyApp());
}

void setupLocators() {
  GetIt.I.registerSingleton(PageStore());
}

Future<void> inicializeParse() async {
  await Parse().initialize('RKbab84vFNMfc4CghsT2pOSldQnNJzNehgkZXYWS',
      'https://parseapi.back4app.com/',
      clientKey: 'vjeDtc5EErvqHqVMZ5OXQfHlmZQ7FkNLW6yroxHm',
      autoSendSessionId: true,
      debug: true);
  // final categories = ParseObject('Categories')
  //   ..set('Title', 'Camisetas')
  //   ..set('Position', 2);

  // final response = await categories.save();
  // print(response.success);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OLX',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.purple,
          scaffoldBackgroundColor: Colors.purple,
          cursorColor: Colors.orange,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: AppBarTheme(elevation: 0)),
      home: BaseScreen(),
    );
  }
}
