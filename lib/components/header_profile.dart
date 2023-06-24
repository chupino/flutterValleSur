import 'package:apitest3/components/HeaderProfile.dart';
import 'package:apitest3/components/custom_textfield.dart';
import 'package:apitest3/components/headerSelectPaxAndDate.dart';
import 'package:apitest3/controller/profileController.dart';
import 'package:apitest3/core/constants/color_palatte.dart';
import 'package:apitest3/core/helpers/asset_helper.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HeaderProfile extends GetView<ProfileController> {
  const HeaderProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorPalette.backgroundScaffoldSecundaryColor,
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: controller.getUser(),
          builder: (context,snapshot) {
            if(snapshot.hasData){
            return Column(
                  children: [
                    SizedBox(
                      height: 270,
                      width: MediaQuery.of(context).size.width,
                      child: Stack(
                        children: <Widget>[
                          CustomHeaderProfile(title: "Perfil", height: 220, size: size,profilePic: "assets/images/face.jpg",borderPic: ColorPalette.primaryColor,logout: (){},)
                          /* Positioned(
                            top: 0,
                            left: 0,
                            child: Container(
                              height: 187,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [ColorPalette.granate, ColorPalette.blue],
                                ),
                              ),
                              child: null,
                            ),
                          ),
                          Positioned(
                              top: 130,
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 65,
                                      backgroundColor: ColorPalette.primaryColor,
                                      child: CircleAvatar(
                                        radius: 60,
                                        backgroundImage:
                                            AssetImage('assets/images/face.jpg'),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        */
                        ],
                      ),
                    ), 
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      snapshot.data!["nombres"]+" "+snapshot.data!["apellidos"],
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
                          CustomTextFormField(label: "Nombre de Usuario", hintText: "Nombre de Usuario",controller: TextEditingController(text: snapshot.data!["username"]),enableFloatingLabel: false,)
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
                          CustomTextFormField(label: "Correo Electrónico", hintText: "Correo Electrónico",controller: TextEditingController(text: snapshot.data!["email"]),enableFloatingLabel: false,)
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
                          CustomTextFormField(label: "Nombres", hintText: "Nombres",controller: TextEditingController(text: snapshot.data!["nombres"]),enableFloatingLabel: false,)
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
                          CustomTextFormField(label: "Apellidos", hintText: "Apellidos",controller: TextEditingController(text: snapshot.data!["apellidos"]),enableFloatingLabel: false,)
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                );

            }else if(snapshot.connectionState==ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(),
              );
            }else if(snapshot.hasError){
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }else{
              return Container();
            }
          }
        ),
      )
    );
        }
      
    
  }

