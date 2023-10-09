import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Receipt extends StatelessWidget {
  const Receipt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:
        SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 5.0),
          child: Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                      // constraints: BoxConstraints(),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 30,
                      )),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height*0.9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 0, bottom: 5),
                      child: Text("У вас пока нет чека",
                          style: GoogleFonts.montserrat(
                              fontSize: 18,
                              fontWeight: FontWeight.bold ,
                              color: Colors.black)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 0),
                      child: Text("Для получения информации по чеку нужно совершить поездку",
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontWeight: FontWeight.normal ,
                          color: Colors.black,),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
