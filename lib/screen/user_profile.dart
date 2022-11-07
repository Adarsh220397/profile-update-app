import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:profile_update_app/service/database/database.dart';
import 'package:profile_update_app/service/model/user_details.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import '../utils/widgets/circular_indicator_widget.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  late ThemeData themeData;

  List<UserDetails> filterList = [];
  bool isLoading = false;

  // Controllers
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameCodeController = TextEditingController();

  @override
  void initState() {
    super.initState();

    getData();
  }

  Future<void> getData() async {
    isLoading = true;
    filterList = await DataBase.instance.getRepositoryList();

    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return isLoading
        ? const CircularIndicator()
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: const Text('Task 2'),
            ),
            body: SafeArea(
              child: KeyboardDismissOnTap(
                child: Container(
                  child: Column(
                    children: [
                      for (UserDetails user in filterList) userProfileUI(user),
                    ],
                  ),
                ),
              ),
            ),
          );
  }

  Widget userProfileUI(UserDetails user) {
    return Column(
      children: [
        SizedBox(
            width: 150,
            height: 150,
            child: user.imagePath.isEmpty
                ? const Text('IM')
                : Image.memory(base64Decode(user.imagePath))),
        Text(user.userId),
        Text(user.userName),
        Text(user.email),
        Text(user.mobile),
        Text(user.address),
      ],
    );
  }

  Widget textInputUI(TextEditingController? controller, String text) {
    return TextFormField(
        controller: controller,
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.next,
        // validator: (value) {
        //   return InputValidator.validateFirstName(value!);
        // },
        onFieldSubmitted: (value) {
          controller!.text = value;
        },
        onSaved: (value) {
          controller!.text = value!;
        },
        decoration: InputDecoration(hintText: text));
  }
}
