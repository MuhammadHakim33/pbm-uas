import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        title: Text('HR Connect'),
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      drawer: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(0),
            bottomRight: Radius.circular(0)
          ),
        ),
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Nurul Nurwati"),
              accountEmail: Text("nurulnurwati@gmail.com"),
              currentAccountPictureSize: Size.square(70),
              currentAccountPicture: CircleAvatar(
                backgroundColor: const Color.fromRGBO(178, 255, 89, .3),
                  child: Text(
                    "NN",
                    style: TextStyle(fontSize: 30.0, color: Colors.white),
                  ), // Text
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage('https://plus.unsplash.com/premium_photo-1743526513995-9503fdb0b6f7?q=80&w=1332&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                    fit: BoxFit.fill,
                    colorFilter: ColorFilter.mode(
                    const Color.fromRGBO(0, 0, 0, .5),
                      BlendMode.darken
                    ),
                  )
              ),
            ),
            ListTile(
              leading: Icon(Icons.person_add, size: 24),
              title: const Text('Tambah Karyawan'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/form');
              },
            ),
            ListTile(
              leading: Icon(Icons.people, size: 24),
              title: const Text('Lihat Karyawan'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/table');
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Container(
          alignment: Alignment.topCenter,
          child: Text(
            "Selamat Datang",
            style: TextStyle(
              fontSize: 26.0,
              fontWeight: FontWeight.bold,
              color: Colors.black 
            ),
          ),
        )
      )
    );
  }
}