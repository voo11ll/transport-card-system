import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transcard/page/nav.dart';
import 'package:transcard/provider/auth_provider.dart';
import 'package:transcard/screens/home_screen.dart';
import 'package:transcard/screens/user_information_screen.dart';
import 'package:transcard/utils/utils.dart';
import 'package:transcard/widgets/custom_button.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatefulWidget {
  final String verificationId;
  const OtpScreen({super.key, required this.verificationId});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String? otpCode;

  @override
  Widget build(BuildContext context) {
    final isLoading =
        Provider.of<AuthProvider>(context, listen: true).isLoading;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: isLoading == true
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              )
            : Center(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: const Icon(Icons.arrow_back),
                        ),
                      ),
                      Container(
                        width: 200,
                        height: 200,
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue.shade50,
                        ),
                        child: Image.asset(
                          "assets/trans.png",
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Проверка",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Введите код-сообщение, отправленное на ваш номер телефона",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black38,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Pinput(
                        length: 6,
                        showCursor: true,
                        defaultPinTheme: PinTheme(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Color(0xff133bc9),
                            ),
                          ),
                          textStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        onCompleted: (value) {
                          setState(() {
                            otpCode = value;
                          });
                        },
                      ),
                      const SizedBox(height: 25),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Container(
                          // margin: EdgeInsets.symmetric(horizontal: 20),
                          width: double.infinity,
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () {
                              if (otpCode != null) {
                                verifyOtp(context, otpCode!);
                              } else {
                                showSnackBar(context, "Введите 6-значный код");
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: const Color(0xff133bc9),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Text("Проверить",
                                style: GoogleFonts.montserrat(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   width: MediaQuery.of(context).size.width,
                      //   height: 50,
                      //   child: CustomButton(
                      //     text: "Проверить",
                      //     onPressed: () {
                      //       if (otpCode != null) {
                      //         verifyOtp(context, otpCode!);
                      //       } else {
                      //         showSnackBar(context, "Введите 6-значный код");
                      //       }
                      //     },
                      //   ),
                      // ),
                      const SizedBox(height: 20),
                      const Text(
                        "Не получил никакого кода?",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black38,
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        "Повторно отправьте новый код",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff133bc9),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  // verify otp
  void verifyOtp(BuildContext context, String userOtp) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    ap.verifyOtp(
      context: context,
      verificationId: widget.verificationId,
      userOtp: userOtp,
      onSuccess: () {
        // checking whether user exists in the db
        ap.checkExistingUser().then(
          (value) async {
            if (value == true) {
              // user exists in our app
              ap.getDataFromFirestore().then(
                    (value) => ap.saveUserDataToSP().then(
                          (value) => ap.setSignIn().then(
                                (value) => Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Nav(),
                                    ),
                                    (route) => false),
                              ),
                        ),
                  );
            } else {
              // new user
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const UserInfromationScreen()),
                  (route) => false);
            }
          },
        );
      },
    );
  }
}
