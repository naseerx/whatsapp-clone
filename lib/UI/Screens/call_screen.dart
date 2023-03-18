import 'package:flutter/material.dart';

class CallsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> callLog = [
    {
      'name': 'John Doe',
      'avatarUrl': 'https://i.pravatar.cc/150?img=1',
      'time': '3:12 PM',
      'type': 'outgoing',
      'isMissed': true,
    },
    {
      'name': 'Jane Doe',
      'avatarUrl': 'https://i.pravatar.cc/150?img=2',
      'time': '2:15 PM',
      'type': 'incoming',
      'isMissed': false,
    },
    {
      'name': 'Bob Smith',
      'avatarUrl': 'https://i.pravatar.cc/150?img=3',
      'time': '1:23 PM',
      'type': 'outgoing',
      'isMissed': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
        itemCount: callLog.length,
        itemBuilder: (context, index) {
          final call = callLog[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(call['avatarUrl']),
            ),
            title: Text(call['name']),
            subtitle: Row(
              children: [
                Icon(
                  call['type'] == 'incoming'
                      ? Icons.call_received
                      : Icons.call_made,
                  size: 16,
                ),
                const SizedBox(width: 4),
                Text(call['time']),
                const SizedBox(width: 4),
                call['isMissed']
                    ? const Icon(Icons.call_missed, color: Colors.red, size: 16)
                    : const SizedBox(),
              ],
            ),
            trailing: IconButton(
              icon: const Icon(Icons.call),
              onPressed: () {
                // Call the user
              },
            ),
          );
        },
      );

  }
}
