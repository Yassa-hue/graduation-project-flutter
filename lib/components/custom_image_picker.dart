import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomImagePicker extends StatefulWidget {
  const CustomImagePicker({Key? key}) : super(key: key);

  @override
  _CustomImagePickerState createState() => _CustomImagePickerState();
}

class _CustomImagePickerState extends State<CustomImagePicker> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = pickedFile;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircleAvatar(
            radius: 60,
            backgroundColor: Colors.black,
            backgroundImage: _image != null ? FileImage(File(_image!.path)) : null,
          ),
          IconButton(
            icon: const Icon(Icons.add_a_photo, color: Colors.white),
            onPressed: _pickImage,
            tooltip: 'Pick Image',
          ),
        ],
      ),
    );
  }
}
