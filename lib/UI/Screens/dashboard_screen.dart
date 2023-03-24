import 'package:flutter/material.dart';
import 'package:flutter_whatsapp_clone/UI/Screens/call_screen.dart';
import 'package:flutter_whatsapp_clone/UI/Screens/home_screen.dart';
import 'package:flutter_whatsapp_clone/UI/Screens/status_screen.dart';

import '../Custom Widgets/app_bar.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String searchQuery = '';

  void updateSearchQuery(String query) {
    setState(() {
      searchQuery = query;
    });
  }

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
            HomeScreen(searchQuery: searchQuery),
            const StatusScreen(),
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
