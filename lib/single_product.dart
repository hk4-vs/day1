import 'package:day_1/food_card_view.dart';
import 'package:day_1/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

class SingleProductView extends StatefulWidget {
  final String image;
  final String name;
  final int price;
  final double rating;
  final String description;

  const SingleProductView(
      {super.key,
      required this.image,
      required this.name,
      required this.price,
      required this.rating,
      required this.description});

  @override
  State<SingleProductView> createState() => _SingleProductViewState();
}

class _SingleProductViewState extends State<SingleProductView>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _textAnimation;
  late Animation<Offset> _imageAnimation;
  late Animation<double> _descriptionAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _textAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ),);

    _imageAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ),);

    _descriptionAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const IconWidget(
                                icon: CupertinoIcons.arrow_left)),
                        Expanded(child: Container()),
                        const IconWidget(
                            icon: CupertinoIcons.ellipsis_vertical),
                      ],
                    ),
                    Stack(alignment: AlignmentDirectional.topCenter, children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 160,
                        child: FittedBox(
                          child: SlideTransition(
                            position: _textAnimation,
                            child: Text(
                              widget.name,
                              style: const TextStyle(letterSpacing: 1.5),
                            ),
                          ),
                        ),
                      ),
                      SlideTransition(
                        position: _imageAnimation,
                        child: Container(
                            margin: const EdgeInsets.only(top: 100),
                            child:
                                ImageWidget(radius: 120, image: widget.image)),
                      )
                    ]),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.local_fire_department),
                            Text("25 m")
                          ],
                        ),
                        Row(
                          children: [
                            Icon(CupertinoIcons.flame_fill),
                            Text("200 cal")
                          ],
                        ),
                        Row(
                          children: [Icon(CupertinoIcons.flame), Text("240g")],
                        ),
                      ],
                    ),
                    Container(
                      height: 4,
                      color: Theme.of(context).colorScheme.primary,
                      margin: const EdgeInsets.only(bottom: 20),
                    ),
                    FadeTransition(
                        opacity: _descriptionAnimation,
                        child: Text(widget.description)),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        RatingStars(
                          valueLabelVisibility: false,
                          value: widget.rating,
                          starSize: 16,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(widget.rating.toString()),
                        Expanded(child: Container()),
                        Row(
                          children: [
                            const Icon(Icons.currency_rupee_sharp),
                            Text(
                              widget.price.toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w900, fontSize: 24),
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const QuantityWidget(),
                        Expanded(child: Container()),
                        Container(
                          height: 60,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    offset: const Offset(3, 4),
                                    color: Colors.black.withOpacity(0.1),
                                    spreadRadius: 4,
                                    blurRadius: 4)
                              ]),
                          child: Icon(
                            CupertinoIcons.cart,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class QuantityWidget extends StatefulWidget {
  const QuantityWidget({super.key});

  @override
  State<QuantityWidget> createState() => _QuantityWidgetState();
}

class _QuantityWidgetState extends State<QuantityWidget> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              if (quantity > 1) {
                quantity--;
              }
            });
          },
          child: Container(
              color: const Color(0xfff2f8fc),
              padding: const EdgeInsets.all(8),
              child: Icon(
                CupertinoIcons.minus,
                color: Theme.of(context).colorScheme.primary,
              )),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "$quantity",
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              quantity++;
            });
          },
          child: Container(
              color: const Color(0xfff2f8fc),
              padding: const EdgeInsets.all(8),
              child: Icon(
                CupertinoIcons.add,
                color: Theme.of(context).colorScheme.primary,
              )),
        ),
      ],
    );
  }
}
