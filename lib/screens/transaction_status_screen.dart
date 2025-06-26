import 'package:flutter/material.dart';
import 'package:lea_pay/components/buttons.dart';
import 'package:lea_pay/screens/dashboard_screen.dart';
import 'package:lea_pay/utils/constants.dart';

class TransactionStatusScreen extends StatefulWidget {
  final bool success;

  const TransactionStatusScreen({super.key, required this.success});

  @override
  State<TransactionStatusScreen> createState() =>
      _TransactionStatusScreenState();
}

class _TransactionStatusScreenState extends State<TransactionStatusScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..forward();

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final icon =
        widget.success ? Icons.check_circle_outline : Icons.error_outline;
    final color = widget.success ? kSuccessColor : kErrorColor;
    final message =
        widget.success ? 'Transaction Successful!' : 'Transaction Failed';

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(kSpacingXLarge),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ScaleTransition(
                scale: _scaleAnimation,
                child: Icon(icon, color: color, size: kIconSizeHuge),
              ),
              const SizedBox(height: kSpacingXXXLarge),
              Text(
                message,
                style: const TextStyle(
                    fontSize: kFontSizeXXLarge, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: kSpacingLarge),
              const Text(
                'Your transaction has been processed.',
                style: TextStyle(fontSize: kFontSizeMedium, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              PrimaryButton(
                text: 'Back to Home',
                action: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DashboardScreen(),
                    ),
                    (route) => false, // Remove all previous routes
                  );
                },
              ),
              const SizedBox(height: kSpacingXLarge),
            ],
          ),
        ),
      ),
    );
  }
}
