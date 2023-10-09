import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transcard/constants/app_textstyle.dart';
import 'package:transcard/constants/color_constants.dart';
import 'package:transcard/data/card_data.dart';
import 'package:transcard/widgets/my_card.dart';

class Services extends StatelessWidget {
  const Services({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Транспортная карта",
                        style: GoogleFonts.montserrat(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.notifications,
                          size: 30,
                        ))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.2,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/no_card.png"),
                            // fit: BoxFit.cover
                        )
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 5),
                  child: Text("У вас пока нет карт",
                      style: GoogleFonts.montserrat(
                          fontSize: 18,
                          fontWeight: FontWeight.bold ,
                          color: Colors.black)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 30),
                  child: Text("Для получения информации по карте добавьте ее, нажав на кнопку ниже",
                      style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontWeight: FontWeight.normal ,
                          color: Colors.black,),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Container(
                    // margin: EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color(0xff133bc9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.add_circle_rounded, color: Colors.white, size: 45,),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text("Выпустить виртуальную транспортную карту",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 10),
                //   child: Container(
                //     // padding: EdgeInsets.all(20),
                //     child: ListView.separated(
                //         shrinkWrap: true,
                //         itemCount: myCards.length,
                //         separatorBuilder: (context, index) {
                //           return SizedBox(
                //             height: 20,
                //           );
                //         },
                //         itemBuilder: (context, index) {
                //           return MyCard(
                //             card: myCards[index],
                //           );
                //         }),
                //   ),
                // ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Недавние поездки",
                        style: GoogleFonts.montserrat(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 5),
                  child: Text("У вас пока нет поездок",
                      style: GoogleFonts.montserrat(
                          fontSize: 18,
                          fontWeight: FontWeight.bold ,
                          color: Colors.black)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 30),
                  child: Text("Спикок карт пуст. Для получения списка поездок по карте добавьте ее",
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.normal ,
                      color: Colors.black,),
                    textAlign: TextAlign.center,
                  ),
                ),


                // Column(children: [
                //   Padding(
                //     padding: const EdgeInsets.symmetric(vertical: 10),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Container(
                //           width: 72,
                //           height: 72,
                //           decoration: BoxDecoration(
                //               borderRadius: BorderRadius.circular(20),
                //               color: const Color(0xffeff1f3)),
                //           child: const Icon(Icons.directions_bus),
                //         ),
                //         Column(
                //           children: [
                //             Text(
                //               "Автобус 71А",
                //               style: GoogleFonts.montserrat(
                //                   fontSize: 16, fontWeight: FontWeight.w500),
                //             ),
                //             Text("28 Дек 2023 7:01",
                //                 style: GoogleFonts.montserrat(
                //                     fontSize: 12,
                //                     fontWeight: FontWeight.w500,
                //                     color: const Color(0xff989898)))
                //           ],
                //         ),
                //         Text("₽21",
                //             style: GoogleFonts.montserrat(
                //                 fontSize: 16,
                //                 fontWeight: FontWeight.w500,
                //                 color: Colors.green))
                //       ],
                //     ),
                //   ),
                //   Padding(
                //     padding: const EdgeInsets.symmetric(vertical: 10),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Container(
                //           width: 72,
                //           height: 72,
                //           decoration: BoxDecoration(
                //               borderRadius: BorderRadius.circular(20),
                //               color: const Color(0xffeff1f3)),
                //           child: const Icon(Icons.directions_bus),
                //         ),
                //         Column(
                //           children: [
                //             Text(
                //               "Автобус 71А",
                //               style: GoogleFonts.montserrat(
                //                   fontSize: 16, fontWeight: FontWeight.w500),
                //             ),
                //             Text("28 Дек 2023 15:23",
                //                 style: GoogleFonts.montserrat(
                //                     fontSize: 12,
                //                     fontWeight: FontWeight.w500,
                //                     color: const Color(0xff989898)))
                //           ],
                //         ),
                //         Text("₽21",
                //             style: GoogleFonts.montserrat(
                //                 fontSize: 16,
                //                 fontWeight: FontWeight.w500,
                //                 color: Colors.green))
                //       ],
                //     ),
                //   ),
                //   Padding(
                //     padding: const EdgeInsets.symmetric(vertical: 10),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Container(
                //           width: 72,
                //           height: 72,
                //           decoration: BoxDecoration(
                //               borderRadius: BorderRadius.circular(20),
                //               color: const Color(0xffeff1f3)),
                //           child: const Icon(Icons.directions_bus),
                //         ),
                //         Column(
                //           children: [
                //             Text(
                //               "Автобус 71А",
                //               style: GoogleFonts.montserrat(
                //                   fontSize: 16, fontWeight: FontWeight.w500),
                //             ),
                //             Text("28 Дек 2023 7:01",
                //                 style: GoogleFonts.montserrat(
                //                     fontSize: 12,
                //                     fontWeight: FontWeight.w500,
                //                     color: const Color(0xff989898)))
                //           ],
                //         ),
                //         Text("₽21",
                //             style: GoogleFonts.montserrat(
                //                 fontSize: 16,
                //                 fontWeight: FontWeight.w500,
                //                 color: Colors.green))
                //       ],
                //     ),
                //   ),
                // ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
