import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transcard/model/user_model.dart';
import 'package:transcard/page/nav.dart';
import 'package:transcard/provider/auth_provider.dart';
import 'package:transcard/screens/home_screen.dart';
import 'package:transcard/utils/utils.dart';
import 'package:transcard/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class UserInfromationEditScreen extends StatefulWidget {
  const UserInfromationEditScreen({super.key});

  @override
  State<UserInfromationEditScreen> createState() =>
      _UserInfromationEditScreenState();
}

class _UserInfromationEditScreenState extends State<UserInfromationEditScreen> {
  File? image;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final bioController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    bioController.dispose();
  }

  // for selecting image
  void selectImage() async {
    image = await pickImage(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final isLoading =
    //     Provider.of<AuthProvider>(context, listen: true).isLoading;

    final ap = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      body: SafeArea(
        child:
            // isLoading == true
            //     ? const Center(
            //         child: CircularProgressIndicator(
            //           color: Colors.blue,
            //         ),
            //       )
            //     :
            SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 5.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 30,
                      )),
                ],
              ),
              Center(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () => selectImage(),
                      //Нужно добавить картинку котороя стоит у пользователя
                      child: image == null
                          ? const CircleAvatar(
                              backgroundColor: Color(0xff133bc9),
                              radius: 50,
                              child: Icon(
                                Icons.account_circle,
                                size: 50,
                                color: Colors.white,
                              ),
                            )
                          : CircleAvatar(
                              backgroundImage: FileImage(image!),
                              radius: 50,
                            ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 15),
                      margin: const EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          // name field
                          textFeld(
                            hintText: ap.userModel.name,
                            icon: Icons.account_circle,
                            inputType: TextInputType.name,
                            maxLines: 1,
                            controller: nameController,
                          ),

                          // email
                          textFeld(
                            hintText: ap.userModel.email,
                            icon: Icons.email,
                            inputType: TextInputType.emailAddress,
                            maxLines: 1,
                            controller: emailController,
                          ),

                          // bio
                          textFeld(
                            hintText: ap.userModel.bio,
                            icon: Icons.edit,
                            inputType: TextInputType.name,
                            maxLines: 2,
                            controller: bioController,
                          ),
                        ],
                      ),
                    ),
                    // const SizedBox(height: 20),
                    // SizedBox(
                    //   height: 50,
                    //   width: MediaQuery.of(context).size.width * 0.90,
                    //   child: CustomButton(
                    //     text: "Сохранить изменения",
                    //     onPressed: () => storeData(),
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Container(
                        // margin: EdgeInsets.symmetric(horizontal: 20),
                        width: MediaQuery.of(context).size.width * 0.90,
                        height: 60,
                        child: ElevatedButton(
                          onPressed: () => storeData(),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: const Color(0xff133bc9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Text("Сохранить изменения",
                              style: GoogleFonts.montserrat(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget textFeld({
    required String hintText,
    required IconData icon,
    required TextInputType inputType,
    required int maxLines,
    required TextEditingController controller,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        cursorColor: const Color(0xff133bc9),
        controller: controller,
        keyboardType: inputType,
        maxLines: maxLines,
        decoration: InputDecoration(
          prefixIcon: Container(
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.blue[900],
            ),
            child: Icon(
              icon,
              size: 20,
              color: Colors.white,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.white,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Color(0xff133bc9),
            ),
          ),
          hintText: hintText,
          alignLabelWithHint: true,
          border: InputBorder.none,
          fillColor: const Color(0xffeff1f3),
          filled: true,
        ),
      ),
    );
  }

  // store user data to database
  void storeData() async {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    UserModel userModel = UserModel(
      name: nameController.text.trim(),
      email: emailController.text.trim(),
      bio: bioController.text.trim(),
      profilePic: "",
      createdAt: "",
      phoneNumber: "",
      uid: "",
    );
    if (image != null) {
      ap.saveUserDataToFirebase(
        context: context,
        userModel: userModel,
        profilePic: image!,
        onSuccess: () {
          ap.saveUserDataToSP().then(
                (value) => ap.setSignIn().then(
                      (value) => Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Nav(),
                          ),
                          (route) => false),
                    ),
              );
        },
      );
    } else {
      showSnackBar(context, "Пожалуйста, загрузите фотографию своего профиля");
    }
  }
}
