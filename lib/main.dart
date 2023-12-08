import 'package:flutter/material.dart';

import 'food_card_view.dart';
import 'single_product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
            primary: Color(0xffEF4040), background: Color(0xfff2f8fc)),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 1;
  List<String> categoryList = [
    "new",
    "seasonal",
    "healthy",
    "popular",
    "trending"
  ];
  List<Map> products = [
    {
      "image": "assets/images/4.png",
      "name": "Chicken and Waffles",
      "price": 199,
      "rating": 4.5,
      "description":
          "Southern classic featuring crispy fried chicken atop fluffy waffles, drizzled with maple syrup for a sweet and savory harmony."
    },
    {
      "image": "assets/images/2.png",
      "name": "Clam Chowder",
      "price": 259,
      "rating": 4,
      "description":
          "Creamy seafood soup hailing from New England, loaded with tender clams, potatoes, and aromatic herbs. A coastal delight."
    },
    {
      "image": "assets/images/3.png",
      "name": "Shrimp and Grits",
      "price": 449,
      "rating": 5,
      "description":
          "Southern comfort dish with plump shrimp over creamy, cheesy grits, infused with a blend of spices. A taste of the South."
    },
    {
      "image": "assets/images/1.png",
      "name": "Cobb Salad",
      "price": 599,
      "rating": 5.0,
      "description":
          "Fresh and vibrant salad with grilled chicken, avocado, bacon, blue cheese, and tomatoes. A wholesome and satisfying option."
    },
    {
      "image": "assets/images/4.png",
      "name": "Chicken and Waffles",
      "price": 199,
      "rating": 4.5,
      "description":
          "Southern classic featuring crispy fried chicken atop fluffy waffles, drizzled with maple syrup for a sweet and savory harmony."
    },
    {
      "image": "assets/images/2.png",
      "name": "Clam Chowder",
      "price": 259,
      "rating": 4,
      "description":
          "Creamy seafood soup hailing from New England, loaded with tender clams, potatoes, and aromatic herbs. A coastal delight."
    },
    {
      "image": "assets/images/3.png",
      "name": "Shrimp and Grits",
      "price": 449,
      "rating": 5,
      "description":
          "Southern comfort dish with plump shrimp over creamy, cheesy grits, infused with a blend of spices. A taste of the South."
    },
    {
      "image": "assets/images/1.png",
      "name": "Cobb Salad",
      "price": 599,
      "rating": 5.0,
      "description":
          "Fresh and vibrant salad with grilled chicken, avocado, bacon, blue cheese, and tomatoes. A wholesome and satisfying option."
    }
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(10),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                ListTile(
                  leading: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset("assets/images/AadityaLogo.jpg")),
                  title: const Text("Hi Aaditya"),
                  subtitle: const Text("All the most delicious for you"),
                  trailing: const IconWidget(
                    icon: Icons.menu,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ]),
            ),
            Container(
              height: 6,
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryList.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                      child: Container(
                        height: _selectedIndex == index ? 100 : 60,
                        width: _selectedIndex == index ? 150 : 130,
                        margin: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: _selectedIndex == index ? 12 : 20),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              _selectedIndex == index
                                  ? BoxShadow(
                                      color: Colors.black.withOpacity(0.09),
                                      blurRadius: 7,
                                      spreadRadius: 3,
                                      offset: const Offset(0, 4),
                                    )
                                  : BoxShadow(
                                      color: Colors.black.withOpacity(0.09),
                                      blurRadius: 4)
                            ]),
                        child: Center(
                          child: Text(
                              categoryList[index].toString().toUpperCase(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: _selectedIndex == index ? 20 : 16,
                                  color: _selectedIndex == index
                                      ? Theme.of(context).colorScheme.primary
                                      : Colors.black)),
                        ),
                      ),
                    );
                  }),
            ),
            Expanded(
                child: GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: 240,
                            mainAxisSpacing: 6,
                            crossAxisSpacing: 6),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) {
                                  return SingleProductView(
                                    image: products[index]["image"],
                                    name: products[index]["name"],
                                    price: products[index]["price"],
                                    rating:
                                        products[index]["rating"].toDouble(),
                                    description: products[index]["description"],
                                  );
                                },
                                transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) {
                                  const begin = 0.0;
                                  const end = 1.0;
                                  const curve = Curves.easeInOut;

                                  var tween = Tween(begin: begin, end: end)
                                      .chain(CurveTween(curve: curve));

                                  var offsetAnimation = animation.drive(tween);

                                  return ScaleTransition(
                                    scale: offsetAnimation,
                                    child: child,
                                  );
                                },
                              ),
                            );
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => SingleProductView(
                            //               image: products[index]["image"],
                            //               name: products[index]["name"],
                            //               price: products[index]["price"],
                            //               rating: products[index]["rating"]
                            //                   .toDouble(),
                            //               description: products[index]
                            //                   ["description"],
                            //             )));
                          },
                          child: FoodCardWidget(
                            image: products[index]["image"],
                            name: products[index]["name"],
                          ));
                    })),
          ],
        ),
      ),
    );
  }
}

class IconWidget extends StatelessWidget {
  const IconWidget({super.key, required this.icon});
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black
                  .withOpacity(0.1), // Adjust the color and opacity as needed
              blurRadius: 7,
              offset: const Offset(
                  0, 4), // Adjust the offset to control the shadow direction
            ),
          ]),
      child: Icon(
        icon,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
