import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../providers/auction/auction_product.dart';

class UserItemList extends StatelessWidget {
  final String productName;
  final String productPhoto;

  UserItemList(
    this.productName,
    this.productPhoto,
  );

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(productName),
      // leading: CircleAvatar(
      //   backgroundImage: NetworkImage(productPhoto),
      // ),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.edit),
              color: Colors.purple,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.delete),
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
