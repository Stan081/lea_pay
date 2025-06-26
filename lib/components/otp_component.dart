import 'package:flutter/material.dart';
import 'package:lea_pay/utils/constants.dart';

class OtpInputField extends StatefulWidget {
  const OtpInputField({super.key});

  @override
  OtpInputFieldState createState() => OtpInputFieldState();
}

class OtpInputFieldState extends State<OtpInputField> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: kSpacingXXLarge, horizontal: kSpacingXXXLarge),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.arrow_back,
                    size: kIconSizeMedium,
                    color: Colors.black54,
                  ),
                ),
              ),
              const SizedBox(
                height: kSpacingLarge,
              ),
              Container(
                width: kImageWidth,
                height: kImageHeight,
                decoration: BoxDecoration(
                  color: kPrimaryColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/images/illustration-3.png',
                ),
              ),
              const SizedBox(
                height: kSpacingXXLarge,
              ),
              const Text(
                'Verification',
                style: TextStyle(
                  fontSize: kFontSizeXLarge,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: kSpacingSmall,
              ),
              const Text(
                "Enter your OTP code number",
                style: TextStyle(
                  fontSize: kFontSizeSmall,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: kSpacingLarge,
              ),
              Container(
                padding: const EdgeInsets.all(kSpacingXXLarge),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(kRadiusXLarge),
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
                    const SizedBox(
                      height: kSpacingLarge,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          foregroundColor:
                              WidgetStateProperty.all<Color>(Colors.white),
                          backgroundColor:
                              WidgetStateProperty.all<Color>(kPrimaryColor),
                          shape:
                              WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(kRadiusXLarge),
                            ),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(kFontSizeSmall),
                          child: Text(
                            'Verify',
                            style: TextStyle(fontSize: kFontSizeMedium),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: kSpacingLarge,
              ),
              const Text(
                "Didn't you receive any code?",
                style: TextStyle(
                  fontSize: kFontSizeSmall,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: kSpacingLarge,
              ),
              const Text(
                "Resend New Code",
                style: TextStyle(
                  fontSize: kFontSizeMedium,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textFieldOTP({required bool first, required bool last}) {
    return SizedBox(
      height: kButtonHeight,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: TextField(
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && !last) {
              FocusScope.of(context).nextFocus();
            }
            if (value.isEmpty && !first) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: kFontSizeXLarge, fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: const Offstage(),
            enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: kBorderWidth, color: kBorderColor),
                borderRadius: BorderRadius.circular(kRadiusMedium)),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: kBorderWidth, color: kPrimaryColor),
                borderRadius: BorderRadius.circular(kRadiusMedium)),
          ),
        ),
      ),
    );
  }
}
