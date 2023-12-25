import 'package:flutter/material.dart';
import 'completeorder.dart';
import 'electronic.dart';

class BillingAddress extends StatefulWidget {
  @override
  _BillingAddressState createState() => _BillingAddressState();
}

class _BillingAddressState extends State<BillingAddress> {
  TextEditingController _cityController = TextEditingController();
  TextEditingController _streetController = TextEditingController();
  TextEditingController _buildingNameController = TextEditingController();
  TextEditingController _floorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Billing Address'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _cityController,
              decoration: InputDecoration(labelText: 'City'),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _streetController,
              decoration: InputDecoration(labelText: 'Street'),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _buildingNameController,
              decoration: InputDecoration(labelText: 'Building Name'),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _floorController,
              decoration: InputDecoration(labelText: 'Floor'),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {

                String city = _cityController.text;
                String street = _streetController.text;
                String buildingName = _buildingNameController.text;
                String floor = _floorController.text;


                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CompleteOrder(
                      city: city,
                      street: street,
                      buildingName: buildingName,
                      floor: floor,

                    ),
                  ),

                );
                SizedBox(height:10);
              },
              child: Text('Complete Order'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: BillingAddress(),
  ));
}
