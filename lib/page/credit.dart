import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class AddPaymentCardScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AddPaymentCardScreenState();
  }
}


class AddPaymentCardScreenState extends State<AddPaymentCardScreen> {
  String generateRandomCardNumber() {
    String cardNumber = '';
    Random random = Random();
    for (int i = 0; i < 16; i++) {
      cardNumber += random.nextInt(10).toString();
    }
    return cardNumber;
  }

  String generateRandomExpiryDate() {
    Random random = Random();
    int month = random.nextInt(12) + 1;
    int year = DateTime.now().year + random.nextInt(10);
    return '$month/$year';
  }

  String cardHolderName = '';

  String generateRandomCvvCode() {
    Random random = Random();
    int cvv = random.nextInt(1000);
    return cvv.toString().padLeft(3, '0');
  }
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();




  @override
  void initState() {
    border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.7),
        width: 2.0,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [


            Column(

              children: <Widget>[

                SizedBox(height: 150,),

                CreditCardWidget(
                  cardNumber: generateRandomCardNumber(),
                  expiryDate: generateRandomExpiryDate(),
                  cardHolderName: cardHolderName,
                  cvvCode: generateRandomCvvCode(),
                  bankName: 'TransCard',
                  showBackView: isCvvFocused,
                  obscureCardNumber: true,
                  obscureCardCvv: true,
                  isHolderNameVisible: true,
                  cardBgColor: Colors.black,
                  isSwipeGestureEnabled: true,
                  onCreditCardWidgetChange:
                      (CreditCardBrand creditCardBrand) {},
                  customCardTypeIcons: <CustomCardTypeIcon>[

                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        CreditCardForm(
                          formKey: formKey,
                          obscureCvv: true,
                          obscureNumber: true,
                          cardNumber: generateRandomCardNumber(),
                          cvvCode: generateRandomCvvCode(),
                          isHolderNameVisible: true,
                          isCardNumberVisible: false,
                          isExpiryDateVisible: false,
                          cardHolderName: cardHolderName,
                          expiryDate: generateRandomExpiryDate(),
                          themeColor: Colors.blue,
                          textColor: Colors.black,
                          cvvCodeDecoration: InputDecoration(
                            hintStyle: const TextStyle(color: Colors.black),
                            labelStyle: const TextStyle(color: Colors.black),
                            focusedBorder: border,
                            enabledBorder: border,
                            labelText: 'CVV',
                            hintText: 'XXX',
                          ),
                          cardHolderDecoration: InputDecoration(
                            hintStyle: const TextStyle(color: Colors.black),
                            labelStyle: const TextStyle(color: Colors.black),
                            focusedBorder: border,
                            enabledBorder: border,
                            labelText: 'Card Holder',
                          ),
                          onCreditCardModelChange: onCreditCardModelChange,
                        ),
                        const SizedBox(
                          height: 20,
                        ),



                        ElevatedButton(
                          style: ElevatedButton.styleFrom(

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            // backgroundColor: const Color(0xff1b447b),
                          ),
                          child: Container(
                            margin: const EdgeInsets.all(12),
                            child: const Text(
                              'Добавить',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'halter',
                                fontSize: 14,
                                package: 'flutter_credit_card',
                              ),
                            ),
                          ),
                          onPressed: ()async {
                            if (formKey.currentState!.validate()) {
                              print('Добавлена!');




                            } else {
                              print('Не добавлена!');
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        )
    );
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      var cardNumber = generateRandomCardNumber();
      var expiryDate = generateRandomExpiryDate();
      var cardHolderName = creditCardModel?.cardHolderName;
      var cvvCode = generateRandomCvvCode();
      isCvvFocused = creditCardModel!.isCvvFocused;
    });
  }
}