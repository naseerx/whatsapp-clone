import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Core/Models/users_model.dart';
import '../../Core/Services/local_json_services.dart';

class HomeScreen extends StatefulWidget {
  final String searchQuery;

  const HomeScreen({Key? key, required this.searchQuery}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  LocalJsonServices usersService = LocalJsonServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<UserModel>>(
        future: usersService.getAllData(context, widget.searchQuery),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<UserModel> data = snapshot.data;
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  var user = data[index];
                  return SizedBox(
                    height: 90,
                    child: ListTile(
                      onTap: () {
                        Get.toNamed('/chat');
                      },
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(user.image),
                      ),
                      title: Text(user.name),
                      subtitle: Text(user.lastMessage),
                      trailing: Text(user.time),
                    ),
                  );
                });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
