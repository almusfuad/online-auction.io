import 'package:flutter/material.dart';
import 'package:online_auction/providers/authentication/auth.dart';
import 'package:online_auction/providers/bid/bid_providers.dart';
import 'package:provider/provider.dart';

import 'package:online_auction/screens/auction_screens/auction_overview_screen.dart';
import 'package:online_auction/screens/auction_screens/auction_upload_screen.dart';
import 'package:online_auction/screens/authentication_screens/profile_screen.dart';
import 'package:online_auction/screens/authentication_screens/reg_screen.dart';
import 'package:online_auction/screens/bid_winner.dart';
import 'package:online_auction/screens/placing_bid_screen.dart';
import 'package:online_auction/screens/user_posted_item.dart';
import 'package:online_auction/screens/auction_screens/auction_details_screen.dart';
import 'screens/authentication_screens/login_screen.dart';
import './providers/auction/auction_products_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => AuctionProductsProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => BidProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Auth(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Online Auction',
        theme: ThemeData(primaryColor: Colors.cyan),
        home: LoginScreen(),
        routes: {
          AuctionDetailScreen.routeName: (ctx) => AuctionDetailScreen(),
          AuctionUploadScreen.routeName: (ctx) => AuctionDetailScreen(),
          AuctionsOverviewScreen.routeName: (ctx) => AuctionsOverviewScreen(),
          LoginScreen.routeName: (ctx) => LoginScreen(),
          // ProfileScreen.routeName: (ctx) => ProfileScreen()
          RegisterScreen.routeName: (ctx) => RegisterScreen(),
          BidWinner.routeName: (ctx) => BidWinner(),
          PlacingBidScreen.routeName: (ctx) => PlacingBidScreen(),
          UserPostedItem.routeName: (ctx) => UserPostedItem(),
        },
      ),
    );
  }
}
