import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:poc_frontend_tcc/pages/DetailsFarm.dart';
import 'package:poc_frontend_tcc/pages/MinhaTela.dart';
import 'dart:convert';

import 'package:poc_frontend_tcc/pages/menu.dart';
import 'package:poc_frontend_tcc/utils/app_routes.dart';
import 'package:provider/provider.dart';

import 'components/ChartDataProvider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ChartDataProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MinhaTela(),
      debugShowCheckedModeBanner: false,
      routes: {
        AppRoutes.DATAIL_FARMS: (ctx) => DetailsFarm(),
      },
    );
  }
}
