import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:formente/Screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'Providers/app.dart';
import 'Providers/user.dart';
import 'Screens/Authenticate/authenticate.dart';
import 'Screens/Home/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: AppProvider()),
        ChangeNotifierProvider.value(value: UserProvider.initialize()),
      ],
      child: MaterialApp(
        home: SplashScreen(),
        debugShowCheckedModeBanner:false,
      ),
    );
  }
}

class ScreensController extends StatelessWidget {
  const ScreensController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    switch (user.status) {
      case Status.Uninitialized:
        return Container();
      case Status.Unauthenticated:
        return Authenticate();
      case Status.Authenticating:
        return Authenticate();
      case Status.Authenticated:
        return Home();
      default:
        return Authenticate();
    }
  }
}