import 'package:flutter/material.dart';

import 'package:online_auction/providers/auction/auction_product.dart';

class AuctionProductsProvider with ChangeNotifier {
  List<AuctionProduct> _items = [];

  List<AuctionProduct> get items {
    return [
      AuctionProduct(
        productId: 'p1',
        productName: 'Red Shirt',
        productDescription: 'A red shirt - it is pretty red!',
        minimumBidPrice: 29.99,
        productPhoto:
            'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
        auctionEndDate: DateTime.now(),
      ),
    ];
  }

  AuctionProduct findById(String productId) {
    return items.firstWhere((prod) => prod.productId == productId);
  }

  void addProduct() {
    //_items.add(value);
    notifyListeners();
  }
}
