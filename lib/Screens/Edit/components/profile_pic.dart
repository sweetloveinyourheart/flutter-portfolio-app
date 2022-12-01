import 'dart:io';
import 'package:flutter_auth/helpers/edit.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';
import 'package:flutter_auth/helpers/profile.dart';

class ProfilePic extends StatefulWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfilePic> createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  File? image;
  bool hasError = false;

  final _picker = ImagePicker();

  Future<void> selectImage() async {
    XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
    }
  }

  Future uploadAvatar() async {
    try {
      await EditHelper.uploadImage(context, image!.path);
    } catch (e) {
      setState(() {
        
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(width: 5, color: Colors.white),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 20,
                  offset: const Offset(5, 5),
                ),
              ],
            ),
            child: ProfileHelper.profile?.avatar != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: image != null
                        ? Image.file(
                            File(image!.path),
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          )
                        : Image.network(ProfileHelper.profile!.avatar!,
                            width: 100, height: 100, fit: BoxFit.cover))
                : Icon(
                    Icons.person,
                    size: 80,
                    color: Colors.grey.shade300,
                  ),
          ),
          image != null
              ? Positioned(
                  right: -10,
                  bottom: 0,
                  child: SizedBox(
                    height: 40,
                    width: 40,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                          side: BorderSide(color: Colors.white),
                        ),
                        primary: Colors.white,
                        backgroundColor: hasError ? Colors.red :Colors.blue,
                      ),
                      onPressed: () {
                        uploadAvatar();
                      },
                      child: hasError ? const Icon(Icons.close)  : const Icon(Icons.check),
                    ),
                  ),
                )
              : Positioned(
                  right: -10,
                  bottom: 0,
                  child: SizedBox(
                    height: 40,
                    width: 40,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                          side: BorderSide(color: Colors.white),
                        ),
                        primary: Colors.white,
                        backgroundColor: Colors.purple,
                      ),
                      onPressed: () {
                        selectImage();
                      },
                      child: const Icon(Icons.photo_camera),
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
