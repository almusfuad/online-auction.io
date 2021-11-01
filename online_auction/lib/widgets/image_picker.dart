import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class ProductImagePicker extends StatefulWidget {
  ProductImagePicker({Key? key}) : super(key: key);

  @override
  _ProductImagePickerState createState() => _ProductImagePickerState();
}

class _ProductImagePickerState extends State<ProductImagePicker> {
  late File _storedImage;

  Future<void> _takePicture() async {
    final picker = ImagePicker();
    final imageFile = await picker.pickImage(
      source: ImageSource.camera,
      maxHeight: 100,
      maxWidth: 150,
    );
    if (imageFile == null) {
      return;
    }
    setState(() {
      _storedImage = File(imageFile.path);
    });
    // final appDir = await syspaths.getApplicationDocumentsDirectory();
    // final fileName = path.basename(imageFile.path);
    // final File savedImage =
    //     await File(imageFile.path).copy('${appDir.path}/$fileName');
    // widget.onSelectImage(savedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 150,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: _storedImage != null
              ? Image.file(
                  _storedImage,
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
          onPressed: _takePicture,
          child: Text('Upload Photo'),
          style: ElevatedButton.styleFrom(
            primary: Colors.amber,
          ),
        ),
      ],
    );
  }
}
