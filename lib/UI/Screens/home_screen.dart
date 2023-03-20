import 'package:flutter/material.dart';
import 'package:flutter_whatsapp_clone/UI/Custom%20Widgets/app_bar.dart';
import 'package:flutter_whatsapp_clone/UI/Screens/call_screen.dart';
import 'package:flutter_whatsapp_clone/UI/Screens/status_screen.dart';
import 'package:get/get.dart';

import '../../Core/Models/users_model.dart';
import '../../Core/Services/local_json_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String searchQuery = '';

  void updateSearchQuery(String query) {
    setState(() {
      searchQuery = query;
    });
  }

  LocalJsonServices usersService = LocalJsonServices();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: MyAppBar(
          height: 80,
          onSearch: updateSearchQuery,
        ),
        body: TabBarView(
          children: [
            FutureBuilder<List<UserModel>>(
              future: usersService.getAllData(context, searchQuery),
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
            StatusScreen(),
            CallsScreen(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Handle new message action
          },
          child: const Icon(Icons.chat),
        ),
      ),
    );
  }
}
