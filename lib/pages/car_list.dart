import 'package:flutter/material.dart';
import 'package:toyota_interview_app/models/car.dart';
import 'package:toyota_interview_app/pages/car_detail.dart';

class CarListPage extends StatefulWidget {
  const CarListPage({super.key, required this.title});

  final String title;

  @override
  State<CarListPage> createState() => _CarListPageState();
}

class _CarListPageState extends State<CarListPage> {
  List<Car> carList = [
    Car(
      id: '1',
      title: 'Toyota bZ4X',
      subtitle: 'Z 4WD　衝突回避システム　パノラマルーフ　ナビ',
      description:
          'スリークで伸びやかなサイドライン。洗練と迫力が融合したフロント&リヤデザイン。心に余裕が生まれる広い室内空間とテクノロジー。',
      type: 'SUV',
      color: 'Red',
      isFavorite: false,
      images: [
        'assets/images/car/bZ4X_Exterior/TYTABZ4X-77.jpg',
        'assets/images/car/bZ4X_Exterior/TYTABZ4X-84.jpg',
        'assets/images/car/bZ4X_Exterior/TYTABZ4X-96.jpg',
      ],
    ),
    Car(
      id: '2',
      title: 'GR Supra',
      subtitle: '3.0 RZ　1オナ　禁煙　6速MT　タンレザー　JBL　HUD',
      description:
          'それは、走るアンチテーゼ。一台の美意識。ピュアスポーツ最後の官能。トレンドよりアイデンティティを。両立より一点突破を。効率よりエモーションを。すべてに満点は求めない。目指したのは究極の“走る愉しさ”。ただそこに純粋に向かって。受け継がれてきたフィロソフィー、最先端のテクノロジーを両輪に。これまでも、ここからも。Supraは、自分の道を走ってゆく。',
      type: 'スポーツ',
      color: 'Blue',
      isFavorite: true,
      images: [
        'assets/images/car/GR_Supra/lead-image-2.jpg',
        'assets/images/car/GR_Supra/SUPRA_GR_05.9.22_leebrimble_042.jpg',
        'assets/images/car/GR_Supra/SUPRA_GR_05.9.22_leebrimble_116.jpg',
      ],
    ),
    Car(
      id: '3',
      title: 'Yaris GRSport',
      subtitle: '1.6 RC 4WD　6速MT LEDヘッドライト',
      description:
          'まだ知らない自分に出会うために、思いのままに駆け出せる自由を手に入れよう。ヤリスを翼に、好奇心を燃料に、もっと広い世界へ自分を解き放つんだ。',
      type: 'コンパクトスポーツ',
      color: 'White',
      isFavorite: true,
      images: [
        'assets/images/car/Yaris_GR_GRSport/2024_Yaris_GRSport_036.jpg',
        'assets/images/car/Yaris_GR_GRSport/2024_Yaris_GRSport_038.jpg',
        'assets/images/car/Yaris_GR_GRSport/2024_Yaris_GRSport_039.jpg',
      ],
    ),
  ];
  bool showFavorite = false;

  @override
  Widget build(BuildContext context) {
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
                  .map(
                    (car) => showFavorite == false || car.isFavorite
                        ? ListTile(
                            leading: Image.asset(car.images[0]),
                            title: Text(car.title),
                            subtitle: Text(car.type),
                            onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CarDetailPage(
                                      car: car,
                                    ),
                                  ),
                                ),
                            trailing: const Icon(Icons.navigate_next))
                        : Container(),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
