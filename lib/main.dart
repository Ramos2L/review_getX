import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'modules/home/controller/controller_list.dart';
import 'modules/home/pages/list_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      getPages: [
        GetPage(
          name: '/',
          binding: BindingsBuilder.put(() => ControllerList()),
          page: () => const ListPage(),
        ),
      ],
    );
  }
}
