import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' as vector;

const bottomBackgroundColor = Color(0xFFF1F2F7);
const brands = ['Nike', 'Adidas', 'Jordan', 'Puma', 'Reebok'];
const marginSide = 14.0;
const leftItemSeparator = const SizedBox(
  width: 30,
);

class Shoe {
  final String? name;
  final String? image;
  final double? price;
  final Color? color;

  const Shoe({
    this.name,
    this.image,
    this.price,
    this.color,
  });
}

const shoes = [
  const Shoe(
      name: 'NIKE EPICT-REACT',
      price: 130.00,
      image:
          'https://www.freeiconspng.com/uploads/running-shoes-png-blue-photo-21.png',
      color: Color(0xFF5574b9)),
  const Shoe(
      name: 'NIKE AIR-MAX',
      price: 130.00,
      image:
          'https://www.freeiconspng.com/thumbs/shoes-png/running-shoes-images-download-29.png',
      color: Color(0xFF52b8c3)),
  const Shoe(
      name: 'NIKE AIR-270',
      price: 150.00,
      image:
          'https://www.freepnglogos.com/uploads/shoes-png/dance-shoes-png-transparent-dance-shoes-images-5.png',
      color: Color(0xFFE3AD9B)),
  const Shoe(
      name: 'NIKE EPICT-REACTII',
      price: 160.00,
      image:
          'https://www.pngall.com/wp-content/uploads/5/Men-Shoes-PNG-Clipart.png',
      color: Color(0xFF444547)),
];

const shoesBottom = [
  const Shoe(
      name: 'NIKE AIR-MAX',
      price: 170.00,
      image:
          'https://www.pngfind.com/pngs/m/1-17760_colorful-sneakers-png-clipart-shoes-vector-transparent-png.png'),
  const Shoe(
      name: 'NIKE AIR FORCE',
      price: 130.00,
      image:
          'https://www.pngfind.com/pngs/m/1-17760_colorful-sneakers-png-clipart-shoes-vector-transparent-png.png'),
];

class ShoesStorePage extends StatefulWidget {
  @override
  _ShoesStorePageState createState() => _ShoesStorePageState();
}

class _ShoesStorePageState extends State<ShoesStorePage> {
  final _pageController = PageController(viewportFraction: 0.79);
  final _pageNotifier = ValueNotifier(0.0);

  void _listener() {
    _pageNotifier.value = _pageController.page!;
    setState(() {});
  }

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _pageController.addListener(_listener);
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.removeListener(_listener);
    _pageController.dispose();
    _pageNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const marginCenter = EdgeInsets.symmetric(horizontal: 50, vertical: 15);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: 100,
                  height: size.height * 0.4,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: shoes.length,
                    itemBuilder: (context, index) {
                      final t = (index - _pageNotifier.value);
                      final rotationY = lerpDouble(0, 100, t)!;
                      final translationX = lerpDouble(0, 50, t);
                      final scale = lerpDouble(0, -0.2, t)!;
                      final translationXShoes = lerpDouble(0, 0, t);
                      final rotationShoe = lerpDouble(0, -45, t)!;
                      final transform = Matrix4.identity();
                      transform.translate(translationX);
                      transform.setEntry(3, 2, 0.001);
                      transform.scale(1 - scale);
                      transform.rotateY(vector.radians(rotationY));

                      final transformShoe = Matrix4.identity();
                      transformShoe.translate(translationXShoes);
                      transformShoe.rotateZ(vector.radians(rotationShoe));
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 28.0,
                        ),
                        child: InkWell(
                          onTap: () {},
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Transform(
                                alignment: Alignment.center,
                                transform: transform,
                                child: Stack(
                                  children: [
                                    Hero(
                                      tag:
                                          'hero_background_${shoes[index].name}',
                                      child: Card(
                                        elevation: 6,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        margin: marginCenter,
                                        color: shoes[index].color,
                                        child: const SizedBox.expand(),
                                      ),
                                    ),
                                    Container(
                                      margin: marginCenter,
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                shoes[index]
                                                    .name!
                                                    .split(' ')
                                                    .join('\n'),
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 18,
                                                ),
                                              ),
                                              Icon(
                                                Icons.favorite_border,
                                                color: Colors.white,
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "\$${shoes[index].price}",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                            ),
                                          ),
                                          Spacer(),
                                          Align(
                                            alignment: Alignment.bottomRight,
                                            child: Icon(
                                              Icons.arrow_forward,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Center(
                                child: Transform(
                                  alignment: Alignment.center,
                                  transform: transformShoe,
                                  child: Hero(
                                    tag: 'hero_image_${shoes[index].name}',
                                    child: Image.network(
                                      shoes[index].image!,
                                      height: size.width / 2.5,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
