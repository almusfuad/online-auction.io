import 'package:flutter/material.dart';
import 'package:online_auction/providers/auction/auction_products_provider.dart';
import 'package:online_auction/screens/auction_screens/auction_upload_screen.dart';
import 'package:online_auction/widgets/user_item_list.dart';
import 'package:provider/provider.dart';

class UserPostedItem extends StatefulWidget {
  static const routeName = '/user-item';

  @override
  _UserPostedItemState createState() => _UserPostedItemState();
}

class _UserPostedItemState extends State<UserPostedItem> {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<AuctionProductsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(AuctionUploadScreen.routeName);
          },
        ),
        title: Text('User product list'),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          itemCount: productsData.items.length,
          itemBuilder: (_, i) => UserItemList(
            productsData.items[i].productName,
            productsData.items[i].productPhoto,
          ),
        ),
      ),
    );
  }
}
