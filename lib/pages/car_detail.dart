import 'package:flutter/material.dart';
import 'package:toyota_interview_app/models/car.dart';
import 'package:toyota_interview_app/widgets/carousel.dart';

class CarDetailPage extends StatefulWidget {
  const CarDetailPage({super.key, required this.car});

  final Car car;

  @override
  State<CarDetailPage> createState() => _CarDetailPageState();
}

class _CarDetailPageState extends State<CarDetailPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.car.title),
      ),
      body: Column(
        children: <Widget>[
          Carousel(images: widget.car.images),
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
                          Text(widget.car.title,
                              style: theme.textTheme.titleLarge),
                          Text(widget.car.subtitle,
                              style: theme.textTheme.labelSmall),
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {

                            widget.car.isFavorite = !widget.car.isFavorite;
                          });
                        },
                        icon: widget.car.isFavorite
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
                    Text('色: ${widget.car.color}',
                        style: const TextStyle(color: Colors.grey)),
                    Text('タイプ: ${widget.car.type}',
                        style: const TextStyle(color: Colors.grey)),
                  ],
                ),
                Text(widget.car.description),
              ],
            ),
          )
        ],
      ),
    );
  }
}
