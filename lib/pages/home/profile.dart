import 'package:apitest3/components/HeaderProfile.dart';
import 'package:apitest3/components/custom_textfield.dart';
import 'package:apitest3/components/header_profile.dart';
import 'package:apitest3/controller/profileController.dart';
import 'package:apitest3/core/constants/color_palatte.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class profilePage extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorPalette.backgroundScaffoldSecundaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: FutureBuilder(
              future: controller.getUser(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 270,
                        width: MediaQuery.of(context).size.width,
                        child: Stack(
                          children: <Widget>[
                            CustomHeaderProfile(
                              title: "Perfil",
                              height: 220,
                              size: size,
                              profilePic: "assets/images/face.jpg",
                              borderPic: ColorPalette.primaryColor,
                              logout: (){
                                controller.logout();
                                Get.toNamed("/welcome");
                              },
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        snapshot.data!["nombres"] +
                            " " +
                            snapshot.data!["apellidos"],
                        style: TextStyle(
                          color: ColorPalette.text1Color,
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        snapshot.data!["username"],
                        style: TextStyle(
                          color: ColorPalette.text1Color,
                          fontFamily: 'Poppins',
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nombre de Usuario',
                              style: TextStyle(
                                color: ColorPalette.text1Color,
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            CustomTextFormField(
                              readOnly: true,
                              label: "Nombre de Usuario",
                              hintText: "Nombre de Usuario",
                              controller: TextEditingController(
                              
                                  text: snapshot.data!["username"]),
                              enableFloatingLabel: false,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Correo Electrónico',
                              style: TextStyle(
                                color: ColorPalette.text1Color,
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            CustomTextFormField(
                              readOnly: true,
                              label: "Correo Electrónico",
                              hintText: "Correo Electrónico",
                              controller: TextEditingController(
                                  text: snapshot.data!["email"]),
                              enableFloatingLabel: false,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nombres',
                              style: TextStyle(
                                color: ColorPalette.text1Color,
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            CustomTextFormField(
                              readOnly: true,
                              label: "Nombres",
                              hintText: "Nombres",
                              controller: TextEditingController(
                                  text: snapshot.data!["nombres"]),
                              enableFloatingLabel: false,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Apellidos',
                              style: TextStyle(
                                color: ColorPalette.text1Color,
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            CustomTextFormField(
                              readOnly: true,
                              label: "Apellidos",
                              hintText: "Apellidos",
                              controller: TextEditingController(
                                  text: snapshot.data!["apellidos"]),
                              enableFloatingLabel: false,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else {
                  return Container();
                }
              }),
        ),
      ),
      /* body: Center(child: ElevatedButton(
        onPressed: (){
          controller.logout();
          Get.offNamed("/welcome");
        }, 
        child: const Text("Cerrar Sesión")
        )
        ), */
    );
  }
}
/* class profilePage extends StatefulWidget {
  const profilePage({super.key});

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: ElevatedButton(
        onPressed: (){

        }, 
        child: const Text("Cerrar Sesión")
        )
        ),
    );
  }
} */