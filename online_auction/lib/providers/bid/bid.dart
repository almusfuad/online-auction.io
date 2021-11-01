import 'package:flutter/material.dart';

class Bid with ChangeNotifier {
  final String productId;
  final String userNameOnPosting;
  final String userNameWinner;

  Bid({
    required this.productId,
    required this.userNameOnPosting,
    required this.userNameWinner,
  });
}
