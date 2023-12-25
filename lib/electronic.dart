import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

const _baseURL = 'id21630194_project2.000webhostapp.com';

class Electronic {
  final int _eid;
  final String _name;
  final double _price;
  bool _selected = false;
  final int _availability;
  set selected(bool e) => _selected = e;

  Electronic(this._eid, this._name, this._price, this._availability);
  int get eid => _eid;
  String get name => _name;
  double get price => _price;
  int get available => _availability;
  bool get selected => _selected;

  @override
  String toString() {
    return 'Electronics{_eid: $_eid, _name: $_name, _price: $_price, availability: $_availability}';
  }
}

List<Electronic> _electronics = [];

void updateElectronics(Function(bool success) update) async {
  try {
    final url = Uri.https(_baseURL, 'getElectronics.php');
    final response = await http.get(url).timeout(const Duration(seconds: 5));
    _electronics.clear();
    if (response.statusCode == 200) {
      final jsonResponse = convert.jsonDecode(response.body);
      for (var row in jsonResponse) {
        Electronic e = Electronic(
          int.parse(row['pid']),
          row['name'],
          double.parse(row['price']),
          int.parse(row['quantity']),
        );
        _electronics.add(e);
      }
      update(true);
    }
  } catch (e) {
    update(false);
  }
}

void searchElectronic(Function(String text) update, int eid) async {
  try {
    final url = Uri.https(_baseURL, 'searchElectronic.php', {'eid': '$eid'});
    final response = await http.get(url).timeout(const Duration(seconds: 5));
    _electronics.clear();
    if (response.statusCode == 200) {
      final jsonResponse = convert.jsonDecode(response.body);
      var row = jsonResponse[0];
      Electronic e = Electronic(
        int.parse(row['id']),
        row['name'],
        double.parse(row['price']),
        int.parse(row['availability']),
      );
      _electronics.add(e);
      update(e.toString());
    }
  } catch (e) {
    update("can't load data");
  }
}

class ShowElectronics extends StatelessWidget {
  ShowElectronics({Key? key}) : super(key: key);
  double _sum = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ListView.builder(
      itemCount: _electronics.length,
      itemBuilder: (context, index) => Column(
        children: [
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(5),
            width: width * 0.9,
            child: Row(
              children: [
                Checkbox(
                  value: _electronics[index].selected,
                  onChanged: (bool? value) {
                    _electronics[index].selected = value ?? false;
                  },
                ),
                SizedBox(width: width * 0.05),
                Flexible(
                  child: Text(
                    _electronics[index].toString(),
                    style: TextStyle(fontSize: width * 0.045),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
