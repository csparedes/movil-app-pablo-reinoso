import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home_screen.dart';
import 'package:flutter_application_1/screens/login.dart';
import 'package:flutter_application_1/src/providers/directionproviders.dart';
import 'package:flutter_application_1/src/push_notification_service.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PushNotificationService.initializeApp();
  runApp(const Principal());
}

class Principal extends StatelessWidget {
  const Principal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DirectionProviders(),
      child: MaterialApp(
          routes: {
            '/screen0': (BuildContext context) => new home_screen(),
          },
          debugShowCheckedModeBanner: false,
          title: 'Tesis CISIC',
          theme: ThemeData(
            primarySwatch: Colors.amber,
          ),
          home: login()),
    );
  }
}