import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Profile/components/loading_page.dart';
import 'package:flutter_auth/helpers/login.dart';
import 'package:flutter_auth/helpers/profile.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  @override
  Widget build(BuildContext context) {
    return buildFutureBuilder();
  }

  FutureBuilder<UserProfile> buildFutureBuilder() {
    return FutureBuilder<UserProfile>(
      future: ProfileHelper.getProfile(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          UserProfile? user = snapshot.data!;
          return Column(
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
                child: user.avatar != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(
                          user.avatar!,
                          width: 100,
                          height: 100,
                          fit: BoxFit.contain
                        ))
                    : Icon(
                        Icons.person,
                        size: 100,
                        color: Colors.grey.shade300,
                      ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                (user.last_name ?? "Your") + " " + (user.first_name ?? "Name"),
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Student',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    Card(
                      child: Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.all(15),
                        child: Column(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                ...ListTile.divideTiles(
                                  color: Colors.grey,
                                  tiles: [
                                    ListTile(
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 4),
                                      leading: Icon(Icons.my_location),
                                      title: Text("Location"),
                                      subtitle:
                                          Text(user.address ?? "Your address"),
                                    ),
                                    ListTile(
                                      leading: Icon(Icons.email),
                                      title: Text("Email"),
                                      subtitle: Text(user.email),
                                    ),
                                    ListTile(
                                      leading: Icon(Icons.phone),
                                      title: Text("Phone"),
                                      subtitle:
                                          Text(user.phone ?? "Your phone"),
                                    ),
                                    ListTile(
                                      leading: Icon(Icons.person),
                                      title: Text("Username"),
                                      subtitle: Text(user.username),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return LoadingPage();
      },
    );
  }
}
