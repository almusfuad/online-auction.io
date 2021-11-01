import 'package:flutter/material.dart';
import 'package:online_auction/providers/bid/bid.dart';

class BidProvider with ChangeNotifier {
  List<Bid> _list = [];

  List<Bid> get list {
    return [
      Bid(
        productId: 'p1',
        userNameOnPosting: 'test1',
        userNameWinner: 'test3',
      ),
    ];
  }
}
