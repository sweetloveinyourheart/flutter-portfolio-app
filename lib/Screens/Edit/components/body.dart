import 'package:flutter/material.dart';
import 'package:flutter_auth/helpers/edit.dart';
import 'package:flutter_auth/helpers/profile.dart';
import '../../../constants.dart';
import 'profile_pic.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String email = "";
  String firstname = "";
  String lastname = "";
  String phone = "";
  String address = "";

  String error = "";

  @override
  void initState() {
    super.initState();
    setState(() {
      firstname = ProfileHelper.profile?.first_name ?? "";
      lastname = ProfileHelper.profile?.last_name ?? "";
      phone = ProfileHelper.profile?.phone ?? "";
      address = ProfileHelper.profile?.address ?? "";
    });
  }

  final emailCtrl =
      TextEditingController(text: ProfileHelper.profile?.email ?? "");
  final firstnameCtrl =
      TextEditingController(text: ProfileHelper.profile?.first_name ?? "");
  final lastnameCtrl =
      TextEditingController(text: ProfileHelper.profile?.last_name ?? "");
  final phoneCtrl =
      TextEditingController(text: ProfileHelper.profile?.phone ?? "");
  final addressCtrl =
      TextEditingController(text: ProfileHelper.profile?.address ?? "");

  Future onUpdateInformation() async {
    try {
      if (firstname.isEmpty) {
        setState(() {
          error = 'First name cannot be empty';
        });
        return;
      }

      if (lastname.isEmpty) {
        setState(() {
          error = 'Last name cannot be empty';
        });
        return;
      }

      if (phone.isEmpty) {
        setState(() {
          error = 'Phone number cannot be empty';
        });
        return;
      }

      if (address.isEmpty) {
        setState(() {
          error = 'Address cannot be empty';
        });
        return;
      }

      await EditHelper.updateProfile(
          context, firstname, lastname, phone, address);
    } catch (e) {
      setState(() {
        error = "An error has occurred, please try again !";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          const ProfilePic(),
          const SizedBox(height: 50),
          Form(
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  cursorColor: kPrimaryColor,
                  controller: emailCtrl,
                  onChanged: (value) => {
                    setState(() => {email = value})
                  },
                  decoration: InputDecoration(
                      hintText: "Your email",
                      prefixIcon: const Padding(
                        padding: EdgeInsets.all(defaultPadding),
                        child: Icon(Icons.email),
                      ),
                      fillColor: Colors.grey.shade200),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    cursorColor: kPrimaryColor,
                    controller: firstnameCtrl,
                    onChanged: (value) => {
                      setState(() => {firstname = value})
                    },
                    decoration: InputDecoration(
                        hintText: "First name",
                        prefixIcon: const Padding(
                          padding: EdgeInsets.all(defaultPadding),
                          child: Icon(Icons.perm_identity_outlined),
                        ),
                        fillColor: Colors.grey.shade200),
                  ),
                ),
                TextFormField(
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.text,
                  cursorColor: kPrimaryColor,
                  controller: lastnameCtrl,
                  onChanged: (value) => {
                    setState(() => {lastname = value})
                  },
                  decoration: InputDecoration(
                      hintText: "Last name",
                      prefixIcon: const Padding(
                        padding: EdgeInsets.all(defaultPadding),
                        child: Icon(Icons.perm_identity),
                      ),
                      fillColor: Colors.grey.shade200),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    cursorColor: kPrimaryColor,
                    controller: phoneCtrl,
                    onChanged: (value) => {
                      setState(() => {phone = value})
                    },
                    decoration: InputDecoration(
                        hintText: "Phone number",
                        prefixIcon: const Padding(
                          padding: EdgeInsets.all(defaultPadding),
                          child: Icon(Icons.phone),
                        ),
                        fillColor: Colors.grey.shade200),
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  cursorColor: kPrimaryColor,
                  controller: addressCtrl,
                  onChanged: (value) => {
                    setState(() => {address = value})
                  },
                  decoration:  InputDecoration(
                      hintText: "Address",
                      prefixIcon: const Padding(
                        padding: EdgeInsets.all(defaultPadding),
                        child: Icon(Icons.location_on),
                      ),
                      fillColor: Colors.grey.shade200),
                ),
                const SizedBox(height: defaultPadding * 2),
                ElevatedButton(
                  onPressed: (() => {onUpdateInformation()}),
                  child: Text("Save your change".toUpperCase()),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                    child: Text(
                      error,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    )),
                const SizedBox(height: defaultPadding),
              ],
            ),
          )
        ],
      ),
    );
  }
}
