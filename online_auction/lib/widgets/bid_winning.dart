import 'package:flutter/material.dart';

class BidWinning extends StatelessWidget {
  final String productName;
  final String productPhoto;
  final String userNameOnPosting;
  final String userNameWinner;

  BidWinning(this.productName, this.productPhoto, this.userNameOnPosting,
      this.userNameWinner);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(productName),
      // leading: CircleAvatar(
      //   backgroundImage: NetworkImage(productPhoto),
      // ),
      trailing: Container(
        width: 200,
        child: Row(
          children: [
            Text(userNameOnPosting),
            SizedBox(
              width: 1,
            ),
            Text(userNameWinner),
          ],
        ),
      ),
    );
  }
}
