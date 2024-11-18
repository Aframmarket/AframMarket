import 'package:afram_project/Screens/Colors/colors.dart';
import 'package:afram_project/Screens/Driver-Ui/authScreens/authSignUp.dart';
import 'package:afram_project/Screens/Driver-Ui/authScreens/authSignUp1.dart';
import 'package:afram_project/Screens/Driver-Ui/authScreens/locationScreen.dart';
import 'package:afram_project/Screens/Driver-Ui/layoutScreens/deliveryMaps.dart';
import 'package:afram_project/Screens/Driver-Ui/layoutScreens/homeScreen.dart';
import 'package:afram_project/Screens/Driver-Ui/layoutScreens/notificationScreen.dart';
import 'package:afram_project/Screens/Driver-Ui/layoutScreens/profileScreen.dart';
import 'package:afram_project/Screens/Driver-Ui/layoutScreens/qrCodeScanner.dart';
import 'package:afram_project/Screens/Driver-Ui/provider/login_provider.dart';
import 'package:afram_project/Screens/Driver-Ui/provider/openDelivery_provider.dart';
import 'package:afram_project/Screens/Onboarding-screen/onboarding.dart';
import 'package:afram_project/Screens/Driver-Ui/authScreens/authLogIn.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Screens/Driver-Ui/provider/driver_signup_provider.dart';
import 'Screens/Driver-Ui/provider/signup_provider.dart';
import 'Screens/Driver-Ui/provider/verification_provider.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //shared preference instance
  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;
  runApp(MyApp(
      showHome: showHome
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.showHome});

  final bool showHome;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SignUpProvider>(
          create: (_) => SignUpProvider(),
        ),
        ChangeNotifierProvider<DriverSignUpProvider>(
          create: (_) => DriverSignUpProvider(),
        ),
        ChangeNotifierProvider<VerificationProvider>(
          create: (_) => VerificationProvider(),
        ),
        ChangeNotifierProvider<LoginProvider>(
          create: (_) => LoginProvider(),
        ),
        ChangeNotifierProvider<OrderProvider>(
          create: (_) => OrderProvider(),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'AframMarket',
          theme: ThemeData(
            textTheme: GoogleFonts.senTextTheme(),
            // colorScheme: ColorScheme.fromSwatch().copyWith(
            //   primary: Colors.white,
            // ),
            useMaterial3: true,
          ),
          //to navigate after onboarding
          initialRoute: showHome ? '/logInScreen' : '/',
          routes: {
            '/': (context) => const OnboardingScreen(),  //no forget to put the onboarding screen here when  you're done
            '/home': (context) => const Home(),
            '/logInScreen': (context) => const AuthLoginScreen(),
            '/signUpScreen': (context) => AuthSignUp1(),
            '/gpsScreen': (context) => const AccessLocationScreen()
          }),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/splash.png"), fit: BoxFit.cover)
        ),
      ),
    );
  }
}


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    DeliveryMapsScreen(),
    QrCodeScanner(),
    NotificationScreen(),
    ProfileScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        body: IndexedStack(
          index: _selectedIndex,
          children: _widgetOptions,
        ),
        bottomNavigationBar: Container(
          height: 90,
          decoration: BoxDecoration(
            color: AppColors.primaryGreenColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0), // Adjust the radius as needed
              topRight: Radius.circular(20.0), // Adjust the radius as needed
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                spreadRadius: 0,
                blurRadius: 10,
                offset: const Offset(0, -2), // Move shadow upwards
              ),
            ]
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            child: Theme(
              data: Theme.of(context).copyWith(
                // sets the background color of the `BottomNavigationBar`
                  canvasColor: AppColors.primaryGreenColor,
                  textTheme: Theme
                      .of(context)
                      .textTheme
                      .copyWith(bodySmall: TextStyle(color: Colors.yellow)
                  )
              ),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: AppColors.primaryGreenColor,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                items: <BottomNavigationBarItem>[
                  const BottomNavigationBarItem(
                    activeIcon: ImageIcon(AssetImage("assets/active_home.png"), color: AppColors.primaryYellowColor, size: 24,),
                    icon: ImageIcon(AssetImage("assets/active_home.png"), color: AppColors.iconGrey, size: 24,),
                    label: 'Home',
                  ),
                  const BottomNavigationBarItem(
                    activeIcon: ImageIcon(AssetImage("assets/delivery.png"), color: AppColors.primaryYellowColor, size: 24,),
                    icon: ImageIcon(AssetImage("assets/delivery.png"), color: AppColors.iconGrey, size: 24,),
                    label: 'Delivery',
                  ),
                  BottomNavigationBarItem(
                    activeIcon: Image.asset("assets/qrIcon.png", width: 54, height: 54,),
                    icon: Image.asset("assets/qrIcon.png", width: 54, height: 54,),
                    label: 'Scan',
                  ),
                  const BottomNavigationBarItem(
                    activeIcon: ImageIcon(AssetImage("assets/notification.png"), color: AppColors.primaryYellowColor, size: 24,),
                    icon: ImageIcon(AssetImage("assets/notification.png"), color: AppColors.iconGrey, size: 24,),
                    label: 'Notification',
                  ),
                  const BottomNavigationBarItem(
                    activeIcon: ImageIcon(AssetImage("assets/profile.png"), color: AppColors.primaryYellowColor, size: 24,),
                    icon: ImageIcon(AssetImage("assets/profile.png"), color: AppColors.iconGrey, size: 24,),
                    label: 'Profile',
                  ),
                ],
                currentIndex: _selectedIndex,
                selectedItemColor: Colors.blue,
                onTap: _onItemTapped,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
