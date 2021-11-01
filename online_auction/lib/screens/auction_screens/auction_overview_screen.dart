import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:online_auction/screens/authentication_screens/profile_screen.dart';
import 'package:online_auction/screens/bid_winner.dart';

// import 'package:online_auction/widgets/auction_item.dart';
import 'package:online_auction/widgets/product_grid.dart';
import 'auction_upload_screen.dart';
// import 'package:online_auction/providers/auction/auction_product.dart';

class AuctionsOverviewScreen extends StatefulWidget {
  static const routeName = '/products-overview';
  // User? user;

  @override
  State<AuctionsOverviewScreen> createState() => _AuctionsOverviewScreenState();
}

class _AuctionsOverviewScreenState extends State<AuctionsOverviewScreen> {
  // late User currentUser;

  // @override
  // void initState() {
  //   currentUser = currentUser;
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    // final user = Provider.of<ProfileScreen>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product overview screen'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AuctionUploadScreen(),
                ),
              );
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.all(Radius.elliptical(5, 5)),
                shape: BoxShape.rectangle,
                color: Colors.blue,
              ),
              child: Text(
                'Drawer header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: TextButton.icon(
                label: const Text(
                  'Profile',
                  style: TextStyle(fontSize: 25),
                ),
                icon: const Icon(
                  Icons.account_box_outlined,
                  size: 35,
                ),
                onPressed: () {
                  // if (currentUser != null) {
                  //   Navigator.of(context).pushReplacement(
                  //     MaterialPageRoute(
                  //       builder: (context) => ProfileScreen(user: currentUser),
                  //     ),
                  //   );
                  // }
                  // return;
                },
              ),
            ),
            Divider(),
            ListTile(
              leading: TextButton.icon(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => BidWinner(),
                    ),
                  );
                },
                icon: Icon(Icons.face_retouching_natural_sharp),
                label: Text('See Winner list'),
              ),
            ),
            Divider(),
            ListTile(
              leading: TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.exit_to_app),
                label: Text('Exit'),
              ),
            ),
          ],
        ),
      ),
      body: ProductGrid(),
    );
  }
}
