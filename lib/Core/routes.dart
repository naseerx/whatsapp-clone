import 'package:flutter/cupertino.dart';
import 'package:flutter_whatsapp_clone/UI/Screens/chat_screen.dart';
import 'package:flutter_whatsapp_clone/UI/Screens/dashboard_screen.dart';
import 'package:get/get.dart';

appRoutes() => [
      GetPage(
        name: '/home',
        page: () => const DashboardScreen(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/chat',
        page: () => const ChatScreen(),
        middlewares: [MyMiddelware()],
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 500),
      ),
    ];

class MyMiddelware extends GetMiddleware {
  @override
  GetPage? onPageCalled(GetPage? page) {
    debugPrint(page?.name);
    return super.onPageCalled(page);
  }
}
