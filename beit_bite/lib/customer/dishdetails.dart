import 'package:beit_bite/customer/homeCustomer.dart';
import 'package:beit_bite/main.dart';
import 'package:beit_bite/models/dishmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class dishdetails extends ConsumerWidget {
  final Dish dish;

  const dishdetails({
    Key? key,
    required this.dish,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDish = this.dish;
    final screenSize = MediaQuery.of(context).size;

    print('inside dish details....................................');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dish details',
          style: TextStyle(
            color: Color(0xFF153F54),
            fontFamily: 'Bubblegum',
            fontSize: screenSize.width / 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    SizedBox.square(
                        dimension: screenSize.width * 0.4,
                        child: Image.asset(selectedDish.imagePath)),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(selectedDish.name,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                    Text(
                      selectedDish.description,
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                ),
              ],
            ),
            Text(
              selectedDish.category,
              style: TextStyle(fontSize: 24),
            ),
            Text(
              selectedDish.ingredients,
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
