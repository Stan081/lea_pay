import 'package:flutter/material.dart';
import 'package:lea_pay/components/buttons.dart';
import 'package:lea_pay/components/general_components.dart';
import 'package:lea_pay/utils/contants.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/illustrations/login-bkg.jpg'),
                  fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PrimaryIconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                    ),
                    action: () {},
                  ),
                  SizedBox(
                    height: largeSpacing,
                  ),
                  const Headings(text: '6-digit Code'),
                  SizedBox(
                    height: smallSpacing,
                  ),
                  const BodyText(text: 'Code sent to +2348182489860'),
                  SizedBox(
                    height: smallSpacing,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _textFieldOTP(first: true, last: false),
                      _textFieldOTP(first: false, last: false),
                      _textFieldOTP(first: false, last: false),
                      _textFieldOTP(first: false, last: false),
                      _textFieldOTP(first: false, last: false),
                      _textFieldOTP(first: false, last: true),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _textFieldOTP({required bool first, last}) {
    return SizedBox(
      height: 85,
      width: 55,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: TextField(
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.isEmpty && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: (headingFontSize + 4), fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: const Offstage(),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 2, color: Colors.black12),
                borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 2, color: Colors.purple),
                borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    );
  }
}
