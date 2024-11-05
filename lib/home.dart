import 'package:flutter/material.dart';
import 'item_list.dart';

class TransaksiTokoKomputer extends StatefulWidget {
  @override
  _TransaksiTokoKomputerState createState() => _TransaksiTokoKomputerState();
}

class _TransaksiTokoKomputerState extends State<TransaksiTokoKomputer> {
  final TextEditingController laptopController = TextEditingController();
  final TextEditingController mouseController = TextEditingController();
  final TextEditingController keyboardController = TextEditingController();
  final TextEditingController monitorController = TextEditingController();
  final TextEditingController printerController = TextEditingController();

  final int hargaLaptop = 2500000;
  final int hargaMouse = 125000;
  final int hargaKeyboard = 1500000;
  final int hargaMonitor = 5000000;
  final int hargaPrinter = 2000000;

  int totalBayar = 0;
  List<Widget> strukItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Toko Komputer",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Bagian item input dan tombol
            ItemListTile("Laptop", hargaLaptop, laptopController),
            ItemListTile("Mouse", hargaMouse, mouseController),
            ItemListTile("Keyboard", hargaKeyboard, keyboardController),
            ItemListTile("Monitor", hargaMonitor, monitorController),
            ItemListTile("Printer", hargaPrinter, printerController),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: reset,
                  child: Text(
                    "Reset",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                ),
                ElevatedButton(
                  onPressed: cetakStruk,
                  child: Text(
                    "Cetak Struk",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Bagian tampilan struk dan total bayar
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Tampilkan struk items
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: strukItems,
                    ),
                    
                    SizedBox(height: 20), // Jarak antara struk items dan total

                    // Total Bayar
                    Center(
                      child: Text(
                        "Total: Rp $totalBayar",
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void reset() {
    setState(() {
      laptopController.clear();
      mouseController.clear();
      keyboardController.clear();
      monitorController.clear();
      printerController.clear();
      totalBayar = 0;
      strukItems.clear();
    });
  }

  void cetakStruk() {
    setState(() {
      int jumlahLaptop = int.tryParse(laptopController.text) ?? 0;
      int jumlahMouse = int.tryParse(mouseController.text) ?? 0;
      int jumlahKeyboard = int.tryParse(keyboardController.text) ?? 0;
      int jumlahMonitor = int.tryParse(monitorController.text) ?? 0;
      int jumlahPrinter = int.tryParse(printerController.text) ?? 0;

      int totalLaptop = jumlahLaptop * hargaLaptop;
      int totalMouse = jumlahMouse * hargaMouse;
      int totalKeyboard = jumlahKeyboard * hargaKeyboard;
      int totalMonitor = jumlahMonitor * hargaMonitor;
      int totalPrinter = jumlahPrinter * hargaPrinter;

      totalBayar = totalLaptop + totalMouse + totalKeyboard + totalMonitor + totalPrinter;

      // Reset struk items
      strukItems = [];

      // Tambahkan item ke struk jika jumlahnya > 0
      if (jumlahLaptop > 0) {
        strukItems.add(buildStrukItem("Laptop", jumlahLaptop, totalLaptop));
      }
      if (jumlahMouse > 0) {
        strukItems.add(buildStrukItem("Mouse", jumlahMouse, totalMouse));
      }
      if (jumlahKeyboard > 0) {
        strukItems.add(buildStrukItem("Keyboard", jumlahKeyboard, totalKeyboard));
      }
      if (jumlahMonitor > 0) {
        strukItems.add(buildStrukItem("Monitor", jumlahMonitor, totalMonitor));
      }
      if (jumlahPrinter > 0) {
        strukItems.add(buildStrukItem("Printer", jumlahPrinter, totalPrinter));
      }
    });
  }

  Widget buildStrukItem(String namaItem, int jumlah, int totalHarga) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$namaItem x $jumlah",
            style: TextStyle(fontSize: 16),
          ),
          Text(
            "Rp $totalHarga",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
