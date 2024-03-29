import 'package:beit_bite/customer/homeCustomer.dart';
import 'package:beit_bite/main.dart';
import 'package:beit_bite/models/dishmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class dishdetails extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDish = ref.watch(
        selectedDishProvider); // Assuming you have a provider for the selected dish

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedDish.name),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(selectedDish.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text(selectedDish.description),
            // Add more details as needed
          ],
        ),
      ),
    );
  }
}
