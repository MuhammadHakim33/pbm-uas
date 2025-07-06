import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<FormPage> {

  final _namaController = TextEditingController();
  final _emailController = TextEditingController();
  final _telpController = TextEditingController();
  final _alamatController = TextEditingController();

  var url = "https://tubes-pbm-d6a78-default-rtdb.asia-southeast1.firebasedatabase.app/" + "data.json";

  void _submitForm() async {
    try {
      await http.post(
        Uri.parse(url),
        body: json.encode({
          "nama": _namaController.text,
          "email": _emailController.text,
          "telp": _telpController.text,
          "alamat": _alamatController.text,
        }),
      );
    }
    catch (error) {
      throw error;
    }

    _namaController.clear();
    _emailController.clear();
    _telpController.clear();
    _alamatController.clear();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Form Berhasil Dikirim'),
        backgroundColor: Colors.green[900],
        elevation: 10,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(5),
      )
    );
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
          'Tambah Karyawan',
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: [
             _buildTextField("Nama", _namaController),
            SizedBox(height: 16),
            _buildTextField("Email", _emailController),
            SizedBox(height: 16),
            _buildTextField("Telp", _telpController),
            SizedBox(height: 16),
            _buildTextField("Alamat", _alamatController),
            SizedBox(height: 28),
            Container(
              alignment: Alignment.center,
              child: ElevatedButton.icon(
                onPressed: _submitForm,
                label: Text(
                  "SUBMIT",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[900],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)
                  )
                ),
              ),
            )
          ],
        ),
      )
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[200],
          labelText: label,
          labelStyle: TextStyle(color: Colors.grey[700]),
          contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        ),
      ),
    );
  }
}