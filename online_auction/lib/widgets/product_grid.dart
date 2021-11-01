import 'package:flutter/material.dart';
import 'package:online_auction/providers/auction/auction_products_provider.dart';
import 'package:provider/provider.dart';

import './auction_item.dart';
// import 'package:online_auction/providers/auction/auction_product.dart';

class ProductGrid extends StatelessWidget {
  // const ProductGrid({
  //   Key? key,
  //   required this.loadedProducts,
  // }) : super(key: key);

  // final List<AuctionProduct> loadedProducts;

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<AuctionProductsProvider>(context);

    final products = productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      itemCount: products.length,
      itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
        value: products[index],
        child: AuctionItem(
            // products[index].productId,
            // products[index].productName,
            // products[index].productPhoto,
            ),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
      ),
    );
  }
}
