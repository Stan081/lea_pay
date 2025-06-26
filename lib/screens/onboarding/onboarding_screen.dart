import 'package:flutter/material.dart';
import 'package:lea_pay/components/appbar.dart';
import 'package:lea_pay/components/buttons.dart';
import 'package:lea_pay/screens/onboarding/address_page.dart';
import 'package:lea_pay/screens/onboarding/agreement_page.dart';
import 'package:lea_pay/screens/onboarding/personal_info_page.dart';
import 'package:lea_pay/screens/onboarding/set_password_page.dart';
import 'package:lea_pay/screens/dashboard_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lea_pay/utils/constants.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  final _passwordFormKey = GlobalKey<FormState>();
  int _currentPage = 0;

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      const PersonalInfoPage(),
      const AddressPage(),
      SetPasswordPage(formKey: _passwordFormKey),
      const AgreementPage(),
    ];
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  void _nextPage() async {
    // Validate password form if on the correct page
    if (_pages[_currentPage] is SetPasswordPage) {
      if (!(_passwordFormKey.currentState?.validate() ?? false)) {
        return; // Don't proceed if validation fails
      }
    }

    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      // Complete onboarding
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('hasCompletedOnboarding', true);
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const DashboardScreen()),
        );
      }
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SuffixNavigatorAppBar(
        action: _currentPage == 0 ? null : _previousPage,
        header: 'Step ${_currentPage + 1} of ${_pages.length}',
        suffix: PrimaryIconButton(
          icon: const Icon(
            Icons.help_outline,
            size: kIconButtonSize / 2,
            color: kPrimaryColor,
          ),
          action: () {
            // TODO: Implement help functionality
          },
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        physics: const NeverScrollableScrollPhysics(), // Disable swipe
        children: _pages,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: kSpacingXXLarge, horizontal: kSpacingLarge),
        child: PrimaryButton(
          action: _nextPage,
          text: _currentPage == _pages.length - 1 ? 'I Agree' : 'Continue',
        ),
      ),
    );
  }
}
