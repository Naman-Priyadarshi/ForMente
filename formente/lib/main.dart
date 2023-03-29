import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:formente/Screens/Home/dashboard.dart';
import 'package:formente/Screens/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'Providers/app.dart';
import 'Providers/user.dart';
import 'Screens/Authenticate/authenticate.dart';
import 'package:formente/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: AppProvider()),
        ChangeNotifierProvider.value(value: UserProvider.initialize()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          textTheme: GoogleFonts.barlowTextTheme(
            Theme.of(context).textTheme,

          ),
        ),
        home: const SplashScreen(),
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
        return const Authenticate();
      case Status.Authenticating:
        return const Authenticate();
      case Status.Authenticated:
        return const Dashboard();
      default:
        return const Authenticate();
    }
  }
}