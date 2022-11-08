import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:profile_update_app/screen/user_profile.dart';
import 'package:profile_update_app/service/database/database.dart';
import 'package:profile_update_app/service/model/user_details.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:image_picker/image_picker.dart';
import 'package:profile_update_app/utils/widgets/button_widget.dart';
import 'package:profile_update_app/utils/widgets/common_utils_widget.dart';
import '../preferences/preference_constants.dart';
import '../preferences/preference_manager.dart';
import '../utils/widgets/circular_indicator_widget.dart';

class UserUpdatedProfileScreen extends StatefulWidget {
  final bool bFilePicked;
  const UserUpdatedProfileScreen({super.key, required this.bFilePicked});

  @override
  State<UserUpdatedProfileScreen> createState() =>
      _UserUpdatedProfileScreenState();
}

class _UserUpdatedProfileScreenState extends State<UserUpdatedProfileScreen> {
  @override
  late ThemeData themeData;

  bool isLoading = false;
  String userId = '';
  String name = '';
  String address = '';
  String email = '';
  String mobileNumber = '';
  String imagePath = '';

  @override
  void initState() {
    super.initState();

    getData();
  }

  Future<void> getData() async {
    isLoading = true;

    userId = await PreferenceManager.instance.getUserId();
    address = await PreferenceManager.instance.getAddress();
    email = await PreferenceManager.instance.getEmail();
    mobileNumber = await PreferenceManager.instance.getMobileNumber();
    name = await PreferenceManager.instance.getName();
    imagePath = await PreferenceManager.instance.getImageUrl();
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return isLoading
        ? const CircularIndicator()
        : WillPopScope(
            onWillPop: () async {
              return await Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const UserProfileScreen()),
              );
            },
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.black,
                title: const Text('UPDATED USER PROFILE'),
              ),
              body: SafeArea(
                child: KeyboardDismissOnTap(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        userProfileUI(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
  }

  Widget userProfileUI() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          // SizedBox(
          //     width: 150,
          //     height: 150,
          //     child: user.imagePath.isEmpty
          //         ? const Text('IM')
          //         : Image.memory(base64Decode(user.imagePath))),
          const SizedBox(height: 5),
          imagePath.isEmpty ? const Text('No image') : profilePictureWidget(),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              Row(children: [textUI('User ID : '), textUI(userId)]),
              const SizedBox(height: 15),
              Row(children: [textUI('Name : '), textUI(name)]),
              const SizedBox(height: 15),
              Row(children: [textUI('Address : '), textUI(address)]),
              const SizedBox(height: 15),
              Row(children: [textUI('Email : '), textUI(email)]),
              const SizedBox(height: 15),
              Row(children: [textUI('MobileNumber : '), textUI(mobileNumber)]),
            ],
          ),
        ],
      ),
    );
  }

  Widget textUI(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.white),
    );
  }

  Widget textInputUI(
      TextEditingController? controller, String text, String labelText) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value!.isEmpty) {
          return "Enter the correct value";
        }
      },
      style: const TextStyle(color: Colors.white),
      onFieldSubmitted: (value) {
        controller!.text = value;
      },
      onSaved: (value) {
        controller!.text = value!;
      },
      autocorrect: true,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: labelText,
        hintText: text,
      ),
    );
  }

  // Future<String> storeImage() async {
  //   if (pickedFile == null) {
  //     return widget.movieData.posterUrl ?? StringConstants.defaultPostarUrl;
  //   }

  //   File imageFile = File(pickedFile!.path);
  //   Reference ref = FirebaseStorage.instance
  //       .ref()
  //       .child("/MoviePoster/image_" + DateTime.now().toString() + ".jpg");
  //   UploadTask uploadTask = ref.putFile(imageFile);

  //   String imageURL = StringConstants.defaultPostarUrl;
  //   await uploadTask.then((res) async {
  //     imageURL = await res.ref.getDownloadURL();

  //     setLoadingState(false);
  //   });

  //   return imageURL;
  // }

  Widget profilePictureWidget() {
    return Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.grey, width: 2),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 150,
              child: widget.bFilePicked
                  ? AspectRatio(
                      aspectRatio: 16.0 / 9.0,
                      child: Image.file(File(imagePath), fit: BoxFit.fill),
                    )
                  : AspectRatio(
                      aspectRatio: 16.0 / 9.0,
                      child: Image.memory(
                        base64Decode(imagePath),
                      ),
                    )),
        ],
      ),
    );
  }
}
