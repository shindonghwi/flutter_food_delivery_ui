import 'package:flutter/material.dart';
import 'package:food_delivery_ui/data/data.dart';
import 'package:food_delivery_ui/screens/restaurant_screen.dart';
import 'package:food_delivery_ui/widgets/recent_orders.dart';

import '../models/restaurant.dart';
import '../widgets/rating_star.dart';
import 'cart_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _buildRestaurants() {
    List<Widget> restaurantList = [];

    restaurants.forEach(
      (Restaurant restaurant) {
        restaurantList.add(
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => RestaurantScreen(restaurant: restaurant),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(width: 1.0, color: Colors.grey)),
              child: Row(children: [
                ClipRRect(
                  child: Hero(
                    tag: restaurant.imageUrl,
                    child: Image(
                      image: AssetImage(restaurant.imageUrl),
                      height: 150.0,
                      width: 150.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          restaurant.name,
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis),
                        ),
                        RatingStar(rating: restaurant.rating),
                        SizedBox(height: 4.0),
                        Text(
                          restaurant.address + " asdasdadsds",
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              overflow: TextOverflow.ellipsis),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          '0.2 miles away',
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              overflow: TextOverflow.ellipsis),
                        ),
                      ],
                    ),
                  ),
                )
              ]),
            ),
          ),
        );
      },
    );

    return Column(
      children: restaurantList,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.account_circle),
          iconSize: 30.0,
          onPressed: () {},
        ),
        title: const Text("Food Delivery"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CartScreen(),
                ),
              );
            },
            child: Text(
              "Cart(${currentUser.cart.length})",
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: const BorderSide(width: 0.8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(
                    width: 0.8,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                hintText: "Search Food or Restaurants",
                prefixIcon: const Icon(
                  Icons.search,
                  size: 20.0,
                ),
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.clear,
                    size: 20.0,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ),
          RecenOrders(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Nearby Restaurants',
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2),
                ),
              ),
              _buildRestaurants()
            ],
          )
        ],
      ),
    );
  }
}
