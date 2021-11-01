import 'package:flutter/foundation.dart';

class AuctionProduct with ChangeNotifier {
  final String productId;
  final String productName;
  final String productDescription;
  final String productPhoto;
  final double minimumBidPrice;
  final DateTime auctionEndDate;
  // final bool myPostedItem;

  AuctionProduct({
    required this.productId,
    required this.productName,
    required this.productDescription,
    required this.productPhoto,
    required this.minimumBidPrice,
    required this.auctionEndDate,
    // required this.myPostedItem,
  });
}
