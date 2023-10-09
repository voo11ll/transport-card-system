import 'package:flutter/material.dart';
import 'package:transcard/constants/app_textstyle.dart';
import 'package:transcard/data/card_data.dart';

class MyCard extends StatelessWidget {
  final CardModel card;
  const MyCard({Key? key, required this.card}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: 200,
      width: 350,
      decoration: BoxDecoration(
          color: card.cardColor,
          borderRadius: BorderRadius.circular(20),
          image: const DecorationImage(
              fit: BoxFit.cover, image: AssetImage('assets/card1.png'))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    card.cardHolderName,
                    style: ApptextStyle.MY_CARD_SUBTITLE,
                  ),
                  Text(
                    "Студенческая карта",
                    style: ApptextStyle.MY_CARD_TITLE,
                  ),
                ],
              ),
              Text(
                card.cardNumber,
                style: ApptextStyle.MY_CARD_SUBTITLE,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "valid thru",
                        style: ApptextStyle.MY_CARD_TITLE,
                      ),
                      Text(
                        card.expDate,
                        style: ApptextStyle.MY_CARD_SUBTITLE,
                      ),
                    ],
                  ),
                  SizedBox(width: 20),
                ],
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 100,
                height: 100,
                // child: Image.asset("assets/mir.png"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
