import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:online_auction/screens/auction_screens/auction_details_screen.dart';
import 'package:online_auction/providers/auction/auction_product.dart';

class AuctionItem extends StatelessWidget {
  // final String productId;
  // final String productName;
  // final String productPhoto;

  // AuctionItem(
  //   this.productId,
  //   this.productName,
  //   this.productPhoto,
  // );

  @override
  Widget build(BuildContext context) {
    final auctionProduct = Provider.of<AuctionProduct>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(
        10.0,
      ),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              AuctionDetailScreen.routeName,
              arguments: auctionProduct.productId,
            );
          },
          child: Image.network(
            auctionProduct.productPhoto,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          title: Text(
            auctionProduct.productName,
            style: TextStyle(
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
