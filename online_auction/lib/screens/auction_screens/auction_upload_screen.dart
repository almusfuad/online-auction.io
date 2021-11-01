// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:image_picker/image_picker.dart';

import 'package:online_auction/screens/user_posted_item.dart';

import 'auction_overview_screen.dart';

class AuctionUploadScreen extends StatefulWidget {
  static const routeName = '/product-upload';

  User? user;

  @override
  _AuctionUploadScreenState createState() => _AuctionUploadScreenState();
}

class _AuctionUploadScreenState extends State<AuctionUploadScreen> {
  File? image;

  Future pickImage() async {
    final picker = ImagePicker();
    final imageTemporary = await picker.pickImage(source: ImageSource.camera);

    if (image == null) return;

    setState(() {
      final imageTemporary = File(image!.path);
      this.image = imageTemporary;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload your product'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          onPressed: () {
            Navigator.of(context).pop(
              MaterialPageRoute(
                builder: (context) => AuctionsOverviewScreen(),
              ),
            );
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => UserPostedItem(),
                ),
              );
            },
            icon: Icon(Icons.forward),
          ),
        ],
      ),
      body: Container(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Form(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextFormField(
                    decoration:
                        const InputDecoration(labelText: 'Product Name'),
                    keyboardType: TextInputType.name,
                    maxLength: 20,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration:
                        const InputDecoration(labelText: 'Product Description'),
                    keyboardType: TextInputType.multiline,
                    maxLength: 300,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 250,
                        height: 150,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey),
                        ),
                        child: image != null
                            ? Image.file(
                                image!,
                                fit: BoxFit.cover,
                                width: double.infinity,
                              )
                            : const Text(
                                'No Image Taken',
                                textAlign: TextAlign.center,
                              ),
                        alignment: Alignment.center,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      ElevatedButton(
                        onPressed: pickImage,
                        child: Text('Upload Photo'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.amber,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration:
                        const InputDecoration(labelText: 'Minimum bid price'),
                    keyboardType: const TextInputType.numberWithOptions(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        hintText: 'dd/mm/yy',
                        labelText: 'Auction end Date-Time'),
                    keyboardType: TextInputType.datetime,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Save'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
