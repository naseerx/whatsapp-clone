import 'package:flutter/material.dart';
import 'package:flutter_whatsapp_clone/Core/Constants/colors.dart';
import 'package:flutter_whatsapp_clone/Core/Constants/strings.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  final double height;
  final Function(String) onSearch;

  const MyAppBar({
    Key? key,
    required this.height,
    required this.onSearch,
  }) : super(key: key);

  @override
  State<MyAppBar> createState() => _MyAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class _MyAppBarState extends State<MyAppBar> {
  bool _isSearching = false;
  late TextEditingController _searchController;
  final List<Tab> _tabs = [
    const Tab(text: chat),
    const Tab(text: status),
    const Tab(text: call),
  ];

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 70,
      backgroundColor: kPrimaryColor,
      title: _isSearching
          ? TextField(
              controller: _searchController,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(0),
                prefixIcon: const Icon(Icons.search_outlined),
                hintText: 'Search',
                fillColor: Colors.white,
                filled: true,
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.white),
                ),
              ),
              onChanged: widget.onSearch,
            )
          : const Text('WhatsApp Clone'),
      actions: [
        IconButton(
          icon:
              _isSearching ? const Icon(Icons.close) : const Icon(Icons.search),
          onPressed: () {
            setState(() {
              _isSearching = !_isSearching;
              if (!_isSearching) {
                _searchController.clear();
                widget.onSearch('');
              }
            });
          },
        ),
        IconButton(
          icon: const Icon(Icons.more_vert),
          onPressed: () {},
        ),
      ],
      bottom: TabBar(
        tabs: _tabs,
      ),
    );
  }
}
