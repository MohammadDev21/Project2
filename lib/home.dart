import 'package:flutter/material.dart';
import 'billingaddress.dart';
import 'electronic.dart';
import 'completeorder.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double _sum=0;
  bool _load = false;

  void update(bool success) {
    setState(() {
      _load = true;
      if (!success) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('failed to load data')));
      }
    });
  }


  @override
  void initState() {

    updateElectronics(update);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(actions: [

          Text('\$$_sum'),

          IconButton(onPressed: () {

            setState(() {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) =>  BillingAddress()
                  )
              );
            });
          }, icon: const Icon(Icons.shopping_cart_checkout))
        ],



          title: const Text('Eelectronics Addict Store'),
          centerTitle: true,
        ),
        // load products or progress bar
        body: _load ?  ShowElectronics() : const Center(
            child: SizedBox(width: 100, height: 100, child: CircularProgressIndicator(),

            )
        )
    );
  }
}

