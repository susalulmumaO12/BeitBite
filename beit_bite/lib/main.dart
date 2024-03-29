import 'package:beit_bite/chef/mainChef.dart';
import 'package:beit_bite/customer/dishdetails.dart';
import 'package:beit_bite/customer/homeCustomer.dart';
import 'package:beit_bite/customer/mainCustomer.dart';
import 'package:beit_bite/introscreen.dart';
import 'package:beit_bite/login.dart';
import 'package:beit_bite/models/dishmodel.dart';
import 'package:beit_bite/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final navigationProvider =
    Provider<NavigationService>((ref) => NavigationService());

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName, {arguments}) {
    return navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }
}

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigationService = ref.read(navigationProvider);

    return MaterialApp(
      navigatorKey: navigationService.navigatorKey,
      title: 'BeitBite',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const BeitBite(title: 'BeitBite'),
      routes: {
        '/signuppage': (context) => signuppage(),
        '/loginpage': (context) => loginpage(),
        '/maincustomer': (context) => mainCustomer(),
        '/mainchef': (context) => mainChef(),
        '/dishdetails': (context) {
          final dish = ModalRoute.of(context)!.settings.arguments as Dish;
          return dishdetails(dish: dish);
        },
      },
    );
  }
}

class BeitBite extends ConsumerWidget {
  const BeitBite({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return introscreen();
  }
}
