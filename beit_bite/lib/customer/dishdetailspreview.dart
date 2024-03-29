import 'package:beit_bite/customer/homeCustomer.dart';
import 'package:beit_bite/main.dart';
import 'package:beit_bite/models/dishmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class dishdetailsPreview extends ConsumerWidget {
  final Dish dish;

  const dishdetailsPreview({
    Key? key,
    required this.dish,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDish = this.dish;
    final screenSize = MediaQuery.of(context).size;

    print('inside dish details....................................');
    return Scaffold(
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
                        dimension: 150,
                        child: Image.asset(selectedDish.imagePath)),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      selectedDish.name,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Chef: ${selectedDish.chefName}",
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Description: \n${selectedDish.description}",
                      textAlign: TextAlign.left,
                    ),
                    // Add more details as needed
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
