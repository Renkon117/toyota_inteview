import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toyota_interview_app/models/car.dart';
import 'package:toyota_interview_app/models/car_provider.dart';
import 'package:toyota_interview_app/pages/car_detail.dart';

class CarListPage extends StatefulWidget {
  const CarListPage({super.key, required this.title});

  final String title;

  @override
  State<CarListPage> createState() => _CarListPageState();
}

class _CarListPageState extends State<CarListPage> {
  bool showFavorite = false;

  @override
  Widget build(BuildContext context) {
    CarProvider carProvider = Provider.of<CarProvider>(context);
    List<Car> carList = carProvider.carList;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SwitchListTile(
              title: const Text('お気に入りの表示'),
              value: showFavorite,
              onChanged: (value) {
                setState(() {
                  showFavorite = value;
                });
              },
              secondary: const Icon(Icons.favorite),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: carList
                  .map((car) => AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        transitionBuilder:
                            (Widget child, Animation<double> animation) {
                          return FadeTransition(
                              opacity: animation, child: child);
                        },
                        child: showFavorite == false || car.isFavorite
                            ? ListTile(
                                key: ValueKey(car.id),
                                leading: Image.asset(car.images[0]),
                                title: Text(car.title),
                                subtitle: Text(car.type),
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          CarDetailPage(id: car.id),
                                    ),
                                  );
                                  setState(() {});
                                },
                                trailing: const Icon(Icons.navigate_next),
                              )
                            : Container(),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
