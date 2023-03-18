import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class StatusScreen extends StatelessWidget {
  final List<Status> statuses = [
    Status(
      name: 'John Doe',
      time: DateTime.now(),
      imageUrl: 'https://picsum.photos/200/300',
    ),
    Status(
      name: 'Jane Smith',
      time: DateTime.now().subtract(const Duration(minutes: 30)),
      imageUrl: 'https://picsum.photos/200/300',
    ),
    Status(
      name: 'Bob Johnson',
      time: DateTime.now().subtract(const Duration(hours: 1)),
      imageUrl: 'https://picsum.photos/200/300',
    ),
    // add more statuses here
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: statuses.length + 1,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return _buildMyStatusTile();
        } else {
          final status = statuses[index - 1];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(status.imageUrl),
            ),
            title: Text(status.name),
            subtitle: Text(_getStatusTime(status.time)),
          );
        }
      },
    );
  }

  Widget _buildMyStatusTile() {
    return ListTile(
      leading: Stack(
        children: [
          const CircleAvatar(
            backgroundImage: NetworkImage('https://picsum.photos/200/300'),
            radius: 25,
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 18,
              ),
            ),
          ),
        ],
      ),
      title: const Text('My status'),
      subtitle: const Text('Tap to add status update'),
    );
  }

  String _getStatusTime(DateTime time) {
    final now = DateTime.now();
    if (now.difference(time).inHours < 24) {
      return DateFormat.jm().format(time);
    } else {
      return DateFormat.yMd().format(time);
    }
  }
}

class Status {
  final String name;
  final DateTime time;
  final String imageUrl;

  Status({
    required this.name,
    required this.time,
    required this.imageUrl,
  });
}
