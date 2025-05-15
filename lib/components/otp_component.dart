import 'package:flutter/material.dart';
import 'package:lea_pay/utils/contants.dart';

class OtpInputField extends StatefulWidget {
  const OtpInputField({required Key key}) : super(key: key);

  @override
  _OtpInputFieldState createState() => _OtpInputFieldState();
}

class _OtpInputFieldState extends State<OtpInputField> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xfff7f6fb),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.arrow_back,
                    size: 32,
                    color: Colors.black54,
                  ),
                ),
              ),
              SizedBox(
                height: mediumSpacing,
              ),
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade50,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/images/illustration-3.png',
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                'Verification',
                style: TextStyle(
                  fontSize: headingFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: smallSpacing,
              ),
              Text(
                "Enter your OTP code number",
                style: TextStyle(
                  fontSize: bodyFontSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: mediumSpacing,
              ),
              Container(
                padding: const EdgeInsets.all(28),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _textFieldOTP(first: true, last: false),
                        _textFieldOTP(first: false, last: false),
                        _textFieldOTP(first: false, last: false),
                        _textFieldOTP(first: false, last: true),
                      ],
                    ),
                    SizedBox(
                      height: mediumSpacing,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          foregroundColor:
                              WidgetStateProperty.all<Color>(Colors.white),
                          backgroundColor:
                              WidgetStateProperty.all<Color>(Colors.purple),
                          shape:
                              WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Text(
                            'Verify',
                            style: TextStyle(fontSize: subheadingFontSize),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: mediumSpacing,
              ),
              Text(
                "Didn't you receive any code?",
                style: TextStyle(
                  fontSize: bodyFontSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: mediumSpacing,
              ),
              Text(
                "Resend New Code",
                style: TextStyle(
                  fontSize: subheadingFontSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textFieldOTP({required bool first, last}) {
    return SizedBox(
      height: (extraLargeSpacing + 20),
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
          style:
              TextStyle(fontSize: headingFontSize, fontWeight: FontWeight.bold),
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
