import 'package:flutter/material.dart';
import 'package:online_auction/providers/auction/auction_products_provider.dart';
import 'package:online_auction/providers/bid/bid.dart';
import 'package:online_auction/providers/bid/bid_providers.dart';
import 'package:online_auction/screens/auction_screens/auction_overview_screen.dart';
import 'package:online_auction/widgets/bid_winning.dart';
import 'package:online_auction/widgets/product_grid.dart';
import 'package:provider/provider.dart';

class BidWinner extends StatefulWidget {
  static const routeName = '/bid-winner';

  @override
  _BidWinnerState createState() => _BidWinnerState();
}

class _BidWinnerState extends State<BidWinner> {
  @override
  Widget build(BuildContext context) {
    final allProducts = Provider.of<AuctionProductsProvider>(context);
    final bidProducts = Provider.of<BidProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context)
                .pushReplacementNamed(AuctionsOverviewScreen.routeName);
          },
        ),
        title: Text('Bid Winner'),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView.builder(
          itemBuilder: (_, i) => BidWinning(
            allProducts.items[i].productName,
            allProducts.items[i].productPhoto,
            bidProducts.list[i].userNameOnPosting,
            bidProducts.list[i].userNameWinner,
          ),
          itemCount: allProducts.items.length,
        ),
      ),
    );
  }
}
