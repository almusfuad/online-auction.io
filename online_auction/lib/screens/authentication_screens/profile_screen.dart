import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:online_auction/screens/auction_screens/auction_overview_screen.dart';

import '/providers/authentication/auth.dart';
import './login_screen.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = '/profile';

  final User user;
  // final String userId;

  const ProfileScreen({required this.user});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  final bool _isSendingVerification = false;
  final bool _isSigningOut = false;

  late User _currentUser;

  @override
  void initState() {
    _currentUser = widget.user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference userInfo =
        FirebaseFirestore.instance.collection('users');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => AuctionsOverviewScreen(),
              ),
            );
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<DocumentSnapshot>(
              future: userInfo.doc(auth.currentUser!.uid).get(),
              builder: (contex, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text('Loading');
                }
                return Text(snapshot.data!['name']);
              },
            ),
            // Text(
            //   'Name: ${_currentUser.displayName}',
            //   style: Theme.of(context).textTheme.bodyText1,
            // ),
            const SizedBox(height: 16.0),
            Text(
              'EMAIL: ${_currentUser.email}',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(height: 36.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _currentUser.emailVerified
                        ? Text(
                            'Email verified',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: Colors.green),
                          )
                        : Text(
                            'Email not verified',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: Colors.red),
                          ),
                    ElevatedButton(
                      onPressed: () async {
                        await _currentUser.sendEmailVerification();
                      },
                      child: const Text('Verify email'),
                    ),
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.refresh),
                  onPressed: () async {
                    User? user = await Auth.refreshUSer(_currentUser);

                    if (user != null) {
                      setState(() {
                        _currentUser = user;
                      });
                    }
                  },
                ),
                ElevatedButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();

                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  },
                  child: const Text('Sign Out'),
                ),
              ],
            ),

            //Add widgets for verifying email
            //and, signing out the user
          ],
        ),
      ),
    );
  }
}
