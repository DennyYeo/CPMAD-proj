import 'package:firebase_firestoreapp/screens/contractors_page.dart';
import 'package:firebase_firestoreapp/screens/services_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_firestoreapp/services/firebaseauth_service.dart';
import 'package:firebase_firestoreapp/screens/addrecord_page.dart';
import 'package:firebase_firestoreapp/screens/showrecords_page.dart';
import 'package:firebase_firestoreapp/screens/profile.dart';
import 'package:firebase_firestoreapp/screens/about.dart';

//import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // var cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text("HomePage")),
      // body: GridView.count(
      //   crossAxisCount: 2,
      //   children: List.generate(6, (index) {
      //     return InkWell(
      //       splashColor: Colors.blueAccent,
      //       highlightColor: Colors.blueAccent.withOpacity(1.0),
      //       onTap: () {
      //         cartProvider.addToCart(index);
      //       },
      //       child: _buildGridCards(index, 'images/shoe_${index + 1}.jpg',
      //           _shoeName[index], _shoePrice[index]),
      //     );
      //   }),
      // ),
      body: SafeArea(
        child: Column(),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: const Text('About'),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => AboutPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: const Text('Account'),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Profile()));
              },
            ),
            ListTile(
              leading: Icon(Icons.home_repair_service_sharp),
              title: const Text('Services'),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ServicesPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () async {
                await FirebaseAuthService().signOut();
                Navigator.of(context).pushNamed('/login');
              },
            ),
          ],
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         Text("WELCOME HOME", style: TextStyle(fontSize: 30)),
  //         SizedBox(height: 80),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //           children: [
  //             IconButton(
  //               icon: Icon(Icons.add_box),
  //               iconSize: 60,
  //               tooltip: 'add record',
  //               onPressed: () {
  //                 Navigator.of(context).push(
  //                     MaterialPageRoute(builder: (context) => AddRecordPage()));
  //               },
  //             ),
  //             IconButton(
  //               icon: Icon(Icons.list),
  //               iconSize: 60,
  //               tooltip: 'view records',
  //               onPressed: () {
  //                 Navigator.of(context).push(
  //                     MaterialPageRoute(builder: (context) => RecordsPage()));
  //               },
  //             ),
  //           ],
  //         ),
  //       ],
  //     ),
  //     floatingActionButton: FloatingActionButton(
  //       child: Icon(Icons.logout),
  //       backgroundColor: Colors.blueAccent,
  //       tooltip: 'Sign Out',
  //       onPressed: () async {
  //         await FirebaseAuthService().signOut();
  //         Navigator.of(context).pushNamed('/login');
  //       },
  //     ),
  //   );
  // }
  Widget _buildGridCards(
      int index, String imgPath, String shoeName, String shoePrice) {
    return Card(
      color: Colors.lightBlueAccent[50],
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 140,
              width: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imgPath),
                  fit: BoxFit.fitWidth,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          Text(
            shoeName,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          Text(
            shoePrice,
            style: TextStyle(fontSize: 14.0),
          ),
        ],
      ), //Column
    ); //Card
  }
}
