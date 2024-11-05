import 'package:flutter/material.dart';

class ItemListTile extends StatelessWidget {
  final String namaItem;
  final int hargaItem;
  final TextEditingController controller;

  ItemListTile(this.namaItem, this.hargaItem, this.controller);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(namaItem, style: TextStyle(fontSize: 16)),
      subtitle: Text("Rp $hargaItem", style: TextStyle(fontSize: 14, color: Colors.black)),
      trailing: Container(
        width: 50,
        height: 40,
        child: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}
