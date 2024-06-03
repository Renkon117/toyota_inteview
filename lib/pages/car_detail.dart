import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toyota_interview_app/models/car.dart';
import 'package:toyota_interview_app/models/car_provider.dart';
import 'package:toyota_interview_app/widgets/carousel.dart';

class CarDetailPage extends StatefulWidget {
  const CarDetailPage({super.key, required this.id});

  final String id;

  @override
  State<CarDetailPage> createState() => _CarDetailPageState();
}

class _CarDetailPageState extends State<CarDetailPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Car car = Provider.of<CarProvider>(context).carList.firstWhere((element) => element.id == widget.id);
    return Scaffold(
      appBar: AppBar(
        title: Text(car.title),
      ),
      body: Column(
        children: <Widget>[
          Carousel(images: car.images),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(car.title,
                              style: theme.textTheme.titleLarge),
                          Text(car.subtitle,
                              style: theme.textTheme.labelSmall),
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {

                            car.isFavorite = !car.isFavorite;
                          });
                        },
                        icon: car.isFavorite
                            ? const Icon(
                                Icons.favorite,
                                color: Colors.pink,
                              )
                            : const Icon(Icons.favorite_border)),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('色: ${car.color}',
                        style: const TextStyle(color: Colors.grey)),
                    Text('タイプ: ${car.type}',
                        style: const TextStyle(color: Colors.grey)),
                  ],
                ),
                Text(car.description),
              ],
            ),
          )
        ],
      ),
    );
  }
}
