import 'package:flutter/material.dart';

class CompleteOrder extends StatelessWidget {
  final String city;
  final String street;
  final String buildingName;
  final String floor;

  CompleteOrder({
    required this.city,
    required this.street,
    required this.buildingName,
    required this.floor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Complete Order'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Billing Address:'),
            Text('City: $city'),
            Text('Street: $street'),
            Text('Building Name: $buildingName'),
            Text('Floor: $floor'),

          ],
        ),
      ),
    );
  }
}