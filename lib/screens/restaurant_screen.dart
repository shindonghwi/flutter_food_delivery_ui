import 'package:flutter/material.dart';
import 'package:food_delivery_ui/data/data.dart';
import 'package:food_delivery_ui/models/restaurant.dart';
import 'package:food_delivery_ui/widgets/rating_star.dart';

import '../models/food.dart';

class RestaurantScreen extends StatefulWidget {
  final Restaurant restaurant;

  const RestaurantScreen({super.key, required this.restaurant});

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  _buildMenuItem(Food food) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 175.0,
            width: 175.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(food.imageUrl),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          Container(
            height: 175.0,
            width: 175.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.black.withOpacity(0.3),
                  Colors.black87.withOpacity(0.3),
                  Colors.black54.withOpacity(0.3),
                  Colors.black38.withOpacity(0.3),
                ],
                stops: [0.1, 0.4, 0.6, 0.9],
              ),
            ),
          ),
          Positioned(
            bottom: 65.0,
            child: Column(
              children: [
                Text(
                  food.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                Text(
                  '\$${food.price}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              bottom: 10.0,
              right: 10.0,
              child: Container(
                width: 48.0,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: IconButton(
                  icon: Icon(Icons.add),
                  iconSize: 30.0,
                  color: Colors.white,
                  onPressed: () {},
                ),
              ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Hero(
                  tag: widget.restaurant.imageUrl,
                  child: Image(
                    height: 220.0,
                    width: MediaQuery.of(context).size.width,
                    image: AssetImage(widget.restaurant.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 50.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back),
                        color: Colors.white,
                        iconSize: 30.0,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.favorite),
                        color: Theme.of(context).primaryColor,
                        iconSize: 30.0,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.restaurant.name,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('0.2 miles away'),
                    ],
                  ),
                  RatingStar(rating: widget.restaurant.rating),
                  SizedBox(height: 6.0),
                  Text(
                    widget.restaurant.address,
                    style: TextStyle(fontSize: 18.0),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Reviews",
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.symmetric(horizontal: 30.0),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Contact",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        EdgeInsets.symmetric(horizontal: 30.0),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side:
                              BorderSide(color: Theme.of(context).primaryColor),
                        ),
                      ),
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Theme.of(context).primaryColor)),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Center(
              child: Text(
                'Menu',
                style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2),
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              child: GridView.count(
                primary: false,
                shrinkWrap: true,
                padding: EdgeInsets.all(10.0),
                crossAxisCount: 2,
                children: List.generate(widget.restaurant.menu.length, (index) {
                  Food food = widget.restaurant.menu[index];
                  return Center(
                    child: _buildMenuItem(food),
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
