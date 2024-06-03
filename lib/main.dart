import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toyota_interview_app/models/car_provider.dart';
import 'package:toyota_interview_app/pages/car_list.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<CarProvider>(
        create: (context) => CarProvider()..getAll())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Toyota Interview Code Test',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CarListPage(title: 'Car List'),
    );
  }
}
