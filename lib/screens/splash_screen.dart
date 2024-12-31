import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:lea_pay/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        ),
      );
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Launcher();
  }
}

class Launcher extends StatelessWidget {
  const Launcher({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/illustrations/login-bkg.jpg'),
              fit: BoxFit.cover),
        ),
      ),
      const Center(
          // child: SvgPicture.asset(
          //   'assets/images/plugin_logo.svg',
          //   width: 78.36,
          //   height: 105,
          // ),
          ),
    ]);
  }
}
