import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TablePage extends StatefulWidget {
  @override
  _TableState createState() => _TableState();
}

class _TableState extends State<TablePage> {
  @override
  void initState() {
    super.initState();
    _get();
  }

  bool isLoading = true;
  List<Map<String, dynamic>> list = [];

  Future<void> _get() async {
    var url = "https://tubes-pbm-d6a78-default-rtdb.asia-southeast1.firebasedatabase.app/" + "data.json"; // Keep "data.json" as it is

    try {
      final response = await http.get(Uri.parse(url));
      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      if (extractedData == null) return;

      extractedData.forEach((id, value) {
        list.add({
          "id": id,
          "nama": value["nama"],
          "email": value["email"],
          "telp": value["telp"],
          "alamat": value["alamat"],
        });
      });

      setState(() {isLoading = false;});
    } 
    catch (error) {
      throw error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          'Lihat Karyawan',
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.white,
      body: isLoading
        ? Center(child: CircularProgressIndicator())
        : Container(
            margin: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black45)
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: MediaQuery.of(context).size.width),
                child: DataTable(
                  columnSpacing: 20,
                  columns: const [
                    DataColumn(label: Text('Nama', style: TextStyle(fontWeight: FontWeight.w900))),
                    DataColumn(label: Text('Email', style: TextStyle(fontWeight: FontWeight.w900))),
                    DataColumn(label: Text('Telp', style: TextStyle(fontWeight: FontWeight.w900))),
                    DataColumn(label: Text('Alamat', style: TextStyle(fontWeight: FontWeight.w900))),
                  ],
                  rows: list.map((data) {
                    return DataRow(cells: [
                      DataCell(Text(data['nama'] ?? '')),
                      DataCell(Text(data['email'] ?? '')),
                      DataCell(Text(data['telp'] ?? '')),
                      DataCell(Text(data['alamat'] ?? '')),
                    ]);
                  }).toList()
                )
                
              ),
            ),
          )
    );
  }
}