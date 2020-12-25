import 'package:flutter/material.dart';
import 'package:unit_converter/page/genrelist_page.dart';
import 'package:unit_converter/page/converter_page.dart';

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unit Converter',
      debugShowCheckedModeBanner: false,
      initialRoute: '/list',
      routes: {
        '/list': (context) => GenreListPage(),
        '/converter': (context) => ConverterPageLifter(),
      },
      theme: ThemeData(primarySwatch: Colors.green),
    );
  }
}
