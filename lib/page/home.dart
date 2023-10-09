import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:camera/camera.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:transcard/page/notifications.dart';

import '../data/card_data.dart';
import '../provider/auth_provider.dart';
import '../widgets/my_card.dart';
import 'credit.dart';
export 'home.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // late CameraController _cameraController;
  // late Future<void> _cameraInitializer;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   _initializeCamera();
  // }

  // Future<void> _initializeCamera() async {
  //   final cameras = await availableCameras();
  //   final firstCamera = cameras.first;
  //
  //   _cameraController = CameraController(
  //     firstCamera,
  //     ResolutionPreset.medium,
  //   );
  //
  //   _cameraInitializer = _cameraController.initialize();
  // }

  // @override
  // void dispose() {
  //   _cameraController.dispose();
  //   super.dispose();
  // }

  // void _openCamera() async {
  //   await _cameraInitializer;
  //   final XFile? image = await _cameraController.takePicture();
  //   // Здесь вы можете обработать полученное изображение (image)
  //
  //   setState(() {
  //     // Обновление состояния, если необходимо
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Привет",
                            style: GoogleFonts.montserrat(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.green)),
                        Text(ap.userModel.name,
                            style: GoogleFonts.montserrat(
                              fontSize: 21,
                              fontWeight: FontWeight.w700,
                            ))
                      ],
                    ),
                    IconButton(
                        onPressed: () {
                          showDialog(context: context,
                              builder: (BuildContext context){
                            return Notifications();
                              });
                        },
                        icon: const Icon(
                          Icons.notifications,
                          size: 30,
                        ))
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Container(
                    // margin: EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddPaymentCardScreen(),
                        ),
                      );},
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
                //   padding: const EdgeInsets.only(top: 30),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Container(
                //         height: 200,
                //         child: ListView.separated(
                //             physics: ClampingScrollPhysics(),
                //             separatorBuilder: (context, index) {
                //               return SizedBox(
                //                 width: 10,
                //               );
                //             },
                //             itemCount: myCards.length,
                //             shrinkWrap: true,
                //             scrollDirection: Axis.horizontal,
                //             itemBuilder: (context, index) {
                //               return MyCard(
                //                 card: myCards[index],
                //               );
                //             }),
                //       ),
                //     ],
                //   ),
                // ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {},
                      // _openCamera,
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color(0xff133bc9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text("Сканировать QR-код",
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: CarouselSlider(
                    options: CarouselOptions(
                        height: 150,
                        viewportFraction: 1,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 5),
                        autoPlayAnimationDuration: Duration(seconds: 2)),
                    items: [
                      {
                        "image": "assets/standart_card.png",
                        "title": "Стандартная карта",
                        "text":
                            "Стандартная транспортная карта которая позволяет пользоваться нашим сервисом и подходит всем",
                        "description":
                            "Стоимость выпуска и активации карты составляет 100 рублей. Карта действительна в течение 1 года. По истечении срока действия карту можно продлить."
                      },
                      {
                        "image": "assets/student_cart.png",
                        "title": "Студенческая карта",
                        "text":
                            "Карта со скидкой для студентов. Подтвердите что вы студент и платите за проезд меньше",
                        "description":
                            "Для выпуска карты требуется подтвердить, что вы являетесь студентом. Карта дает скидку на приобретение тарифов. Карта действительна в течение 1 года. По истечении срока действия карту можно продлить."
                      },
                      {
                        "image": "assets/lgotnaya_card.png",
                        "title": "Льготная карта",
                        "text":
                            "С этой картой вы сможете пользоваться вашими льготами на проезд",
                        "description":
                            "Для выпуска карты требуется подтвердить, что вы являетесь льготником. Карта дает возможность пользоваться вашими льготами через приложение. Карта действительна в течение 1 года. По истечении срока действия карту можно продлить."
                      },
                    ].map((item)
                        // ["Стандартная карта", "Студенческая карта", "Льготная карта"].map((i)
                        {
                      return Builder(
                        builder: (BuildContext context) {
                          return GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(20))),
                                  builder: (BuildContext context) {
                                    return Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.75,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 20),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  Image.asset(
                                                    item["image"]!,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Flexible(
                                              child: Text(
                                                item["description"]!,
                                                style: GoogleFonts.montserrat(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle: FontStyle.normal,
                                                    color: Colors.black),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 20),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    // margin: EdgeInsets.symmetric(horizontal: 20),
                                                    width: double.infinity,
                                                    height: 60,
                                                    child: ElevatedButton(
                                                      onPressed: () {
                                                        // Действие при нажатии на кнопку
                                                      },
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        foregroundColor:
                                                            Colors.white,
                                                        backgroundColor:
                                                            const Color(
                                                                0xff133bc9),
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                        ),
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 5),
                                                            child: Flexible(
                                                              child: Text(
                                                                "Выпустить карту",
                                                                style: GoogleFonts
                                                                    .montserrat(
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                                maxLines: 2,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                color: const Color(
                                  0xffeff1f3,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Text(
                                        item["title"]!,
                                        style: GoogleFonts.montserrat(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            fontStyle: FontStyle.normal,
                                            color: Colors.black),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, right: 15, top: 15),
                                      child: Center(
                                        child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                    item["image"]!,
                                                    width: 100,
                                                  ),
                                                ],
                                              ),
                                              Flexible(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 10),
                                                      child: Text(
                                                        item["text"]!,
                                                        style: GoogleFonts
                                                            .montserrat(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                color: Colors
                                                                    .black,
                                                                height: 1.5),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ]),
                                      ),
                                    ),
                                  ]),

                              // Text(
                              //   'text $i',
                              //   style: TextStyle(fontSize: 16.0),
                              // )
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Center(
                    child: Text("Тарифы",
                        style: GoogleFonts.montserrat(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    height: 100,
                    child: ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20))),
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                height: MediaQuery.of(context).size.height / 2,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Image.asset(
                                              "assets/ic-bus.png",
                                              width: 60,
                                              height: 60,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5),
                                              child: Container(
                                                color: Colors.blue,
                                                width: 1,
                                                height: 60,
                                              ),
                                            ),
                                            Image.asset(
                                              "assets/ic-trolleybus.png",
                                              width: 60,
                                              height: 60,
                                            )
                                          ],
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5),
                                                child: Text(
                                                    "Единоразовый проездной",
                                                    style:
                                                        GoogleFonts.montserrat(
                                                            fontSize: 22,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black)),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5),
                                                child: Text(
                                                    "Транспорт: Автобус, Троллейбус",
                                                    style:
                                                        GoogleFonts.montserrat(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black)),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5),
                                                child: Text("Число поездок: 16",
                                                    style:
                                                        GoogleFonts.montserrat(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black)),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5),
                                                child: Text(
                                                    "Срок действия: Месяц",
                                                    style:
                                                        GoogleFonts.montserrat(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black)),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5),
                                                child: Text(
                                                    "Стоимость: 400 руб.",
                                                    style:
                                                        GoogleFonts.montserrat(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black)),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 20),
                                                child: Container(
                                                  // margin: EdgeInsets.symmetric(horizontal: 20),
                                                  width: double.infinity,
                                                  height: 60,
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      // Действие при нажатии на кнопку
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      foregroundColor:
                                                          Colors.white,
                                                      backgroundColor:
                                                          const Color(
                                                              0xff133bc9),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 5),
                                                          child: Flexible(
                                                            child: Text(
                                                              "Приобрести тариф",
                                                              style: GoogleFonts
                                                                  .montserrat(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                              maxLines: 2,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            });
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: const Color(0xffeff1f3),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/ic-bus.png",
                                  width: 40,
                                  height: 40,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Container(
                                    color: Colors.blue,
                                    width: 1,
                                    height: 40,
                                  ),
                                ),
                                Image.asset(
                                  "assets/ic-trolleybus.png",
                                  width: 40,
                                  height: 40,
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Единый проездной\nна 16 поездок на месяц",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                  textAlign: TextAlign.center,
                                ),
                                Text("400 руб.",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey)),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    height: 100,
                    child: ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20))),
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                height: MediaQuery.of(context).size.height / 2,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Image.asset(
                                              "assets/ic-bus.png",
                                              width: 60,
                                              height: 60,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5),
                                              child: Container(
                                                color: Colors.blue,
                                                width: 1,
                                                height: 60,
                                              ),
                                            ),
                                            Image.asset(
                                              "assets/ic-trolleybus.png",
                                              width: 60,
                                              height: 60,
                                            )
                                          ],
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5),
                                                child: Text(
                                                    "Единоразовый проездной",
                                                    style:
                                                        GoogleFonts.montserrat(
                                                            fontSize: 22,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black)),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5),
                                                child: Text(
                                                    "Транспорт: Автобус, Троллейбус",
                                                    style:
                                                        GoogleFonts.montserrat(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black)),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5),
                                                child: Text("Число поездок: 30",
                                                    style:
                                                        GoogleFonts.montserrat(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black)),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5),
                                                child: Text(
                                                    "Срок действия: Месяц",
                                                    style:
                                                        GoogleFonts.montserrat(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black)),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5),
                                                child: Text(
                                                    "Стоимость: 750 руб.",
                                                    style:
                                                        GoogleFonts.montserrat(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black)),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 20),
                                                child: Container(
                                                  // margin: EdgeInsets.symmetric(horizontal: 20),
                                                  width: double.infinity,
                                                  height: 60,
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      // Действие при нажатии на кнопку
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      foregroundColor:
                                                          Colors.white,
                                                      backgroundColor:
                                                          const Color(
                                                              0xff133bc9),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 5),
                                                          child: Flexible(
                                                            child: Text(
                                                              "Приобрести тариф",
                                                              style: GoogleFonts
                                                                  .montserrat(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                              maxLines: 2,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            });
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: const Color(0xffeff1f3),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/ic-bus.png",
                                  width: 40,
                                  height: 40,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Container(
                                    color: Colors.blue,
                                    width: 1,
                                    height: 40,
                                  ),
                                ),
                                Image.asset(
                                  "assets/ic-trolleybus.png",
                                  width: 40,
                                  height: 40,
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Единый проездной\nна 30 поездок на месяц",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                  textAlign: TextAlign.center,
                                ),
                                Text("750 руб.",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey)),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    height: 100,
                    child: ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20))),
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                height: MediaQuery.of(context).size.height / 2,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Image.asset(
                                              "assets/ic-bus.png",
                                              width: 60,
                                              height: 60,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5),
                                              child: Container(
                                                color: Colors.blue,
                                                width: 1,
                                                height: 60,
                                              ),
                                            ),
                                            Image.asset(
                                              "assets/ic-trolleybus.png",
                                              width: 60,
                                              height: 60,
                                            )
                                          ],
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5),
                                                child: Text(
                                                    "Единоразовый проездной",
                                                    style:
                                                        GoogleFonts.montserrat(
                                                            fontSize: 22,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black)),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5),
                                                child: Text(
                                                    "Транспорт: Автобус, Троллейбус",
                                                    style:
                                                        GoogleFonts.montserrat(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black)),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5),
                                                child: Text("Число поездок: 60",
                                                    style:
                                                        GoogleFonts.montserrat(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black)),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5),
                                                child: Text(
                                                    "Срок действия: Месяц",
                                                    style:
                                                        GoogleFonts.montserrat(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black)),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5),
                                                child: Text(
                                                    "Стоимость: 1500 руб.",
                                                    style:
                                                        GoogleFonts.montserrat(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black)),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 20),
                                                child: Container(
                                                  // margin: EdgeInsets.symmetric(horizontal: 20),
                                                  width: double.infinity,
                                                  height: 60,
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      // Действие при нажатии на кнопку
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      foregroundColor:
                                                          Colors.white,
                                                      backgroundColor:
                                                          const Color(
                                                              0xff133bc9),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 5),
                                                          child: Flexible(
                                                            child: Text(
                                                              "Приобрести тариф"
                                                              "",
                                                              style: GoogleFonts
                                                                  .montserrat(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                              maxLines: 2,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            });
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: const Color(0xffeff1f3),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/ic-bus.png",
                                  width: 40,
                                  height: 40,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Container(
                                    color: Colors.blue,
                                    width: 1,
                                    height: 40,
                                  ),
                                ),
                                Image.asset(
                                  "assets/ic-trolleybus.png",
                                  width: 40,
                                  height: 40,
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Единый проездной\nна 60 поездок на месяц",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                  textAlign: TextAlign.center,
                                ),
                                Text("1500 руб.",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey)),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
