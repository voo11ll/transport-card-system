import 'package:flutter/material.dart';
import 'package:transcard/constants/color_constants.dart';


class CardModel {
  String cardHolderName;
  String cardNumber;
  String expDate;
  String cvv;
  Color cardColor;

  CardModel({
    required this.cardHolderName,
    required this.cardNumber,
    required this.cvv,
    required this.expDate,
    required this.cardColor,
  });
}

List<CardModel> myCards = [
  CardModel(
    cardHolderName: "TransCard",
    cardNumber: "****  ****  ****  1234",
    cvv: "**4",
    expDate: "12/25",
    cardColor: kPrimaryColor,
  ),
];


