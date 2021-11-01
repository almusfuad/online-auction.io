import 'package:flutter/material.dart';
import 'package:online_auction/screens/auction_screens/auction_details_screen.dart';

class PlacingBidScreen extends StatelessWidget {
  static const routeName = '/placing-bid';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Placing bid'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(
              MaterialPageRoute(
                builder: (constext) => AuctionDetailScreen(),
              ),
            );
          },
        ),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          height: deviceSize.height,
          width: deviceSize.width,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Place your desire amount',
                ),
                keyboardType: const TextInputType.numberWithOptions(),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'enter your logged in email address',
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 35,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Done',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
