/* import 'package:apitest3/pages/formReservaStep1.dart';
import 'package:apitest3/services/UserServices.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import '../formReserva.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final pb = PocketBase('https://pocketbase.io');
  void openDrawer(){
    _scaffoldKey.currentState!.openDrawer();
  }
  @override
  Widget build(BuildContext context) {
    return HomeApp();
  }

  Scaffold HomeApp() {
    return Scaffold(
      key: _scaffoldKey,
        appBar: AppBar(
          title: Text("Reservas"),
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              openDrawer();
            },
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  "Titulo",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () {
                  // Cerrar el Drawer y realizar alguna acción
                  Navigator.pop(context);
                  // Agregar aquí la navegación a la pantalla de inicio
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Cerrar Sesión'),
                onTap: () async{
                  pb.authStore.clear();
                  final prefs=await SharedPreferences.getInstance();
                  prefs.setString("token", "");
                  prefs.setBool("isLoggedIn", false);
                  prefs.setString("UID", "");
                  Get.offNamed("/welcome");
                  // Agregar aquí la navegación a la pantalla de configuración
                },
              ),
            ],
          ),
        ),
        body: Home());
  }
}

FutureBuilder Home() {
  return FutureBuilder(
      future: UserServices().getHabitaciones(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          //return Text("hola ${snapshot.data.length}");
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return Card(
                child: Container(
                  decoration: BoxDecoration(color: Colors.grey[300]),
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: [
                      Image.network(snapshot.data[index]["imagen"]),
                      ListTile(
                        title: Text(snapshot.data[index]["tipo_habitacion"]),
                        subtitle: Text(snapshot.data[index]["caracteristicas"]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                'Precio: \$${snapshot.data[index]["precio"].toStringAsFixed(2)}'),
                            Text('Piso: ${snapshot.data[index]["nro_piso"]}'),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 200,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                final habitacion = snapshot.data[index];
                                print(habitacion);
                                /* Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return reservaFormStep1(
                                    imagen: snapshot.data[index]["imagen"],
                                    reserva: snapshot.data[index] );
                                })); */
                                Get.toNamed("/reservaPaso1", arguments: [
                                  {
                                    "imagen": snapshot.data[index]["imagen"],
                                    "reserva": snapshot.data[index]
                                  }
                                ]);
                              },
                              child: Text("Reservar")),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      });
}
 */
import 'package:apitest3/components/for_you.dart';
import 'package:apitest3/components/headermini.dart';
import 'package:apitest3/components/item_hotel_widget.dart';
import 'package:apitest3/components/promo_carousel.dart';
import 'package:apitest3/core/constants/color_palatte.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

import 'package:apitest3/controller/homeController.dart';
import 'package:apitest3/components/header.dart';
import '../../core/helpers/asset_helper.dart';
import '../../main.dart';
import '../../models/hotel_model.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeApp extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      extendBody: true,
      backgroundColor: ColorPalette.backgroundScaffoldSecundaryColor,
      body: FutureBuilder(
        future: controller.getNombre(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            return CustomScrollView(
              slivers: <Widget>[
                /* SliverAppBar(
                  expandedHeight: 200,
                  flexibleSpace: FlexibleSpaceBar(
                    background: HeaderWithSearchBox(size: size),
                  ),
                ), */
                SliverPersistentHeader(
                  delegate: _HeaderDelegate(
                    size: size,
                    nombre: controller.nombre.value,
                  ),
                  pinned: true,
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Padding(
                        padding: const EdgeInsets.only(top: 5, right: 10, left: 10),
                        child: buildForYou(Colors.white, size),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
                        child: Promo_carousel(
                          colortiles: Colors.white,
                          subtitles: Colors.black,
                          size: size,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Text(
                          'Sedes',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontSize: size.height * 0.025,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25, right: 25, top: 15),
                        child: ItemHotelWidget(
                          hotelModel: HotelModel(
                            hotelImage: AssetHelper.hotel3,
                            hotelName: 'Hodel Valle Sur - Sede Sur',
                            location: 'Moquegua',
                            awayKilometer: '1.1 km',
                            star: 4.2,
                            numberOfReview: 86,
                            price: 132,
                          ),
                          onTap: ()  {
                            /* final prefs = await SharedPreferences.getInstance();
                            print(prefs.getString("token")); */
                            Get.toNamed("/detailsHotel");
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return Center(child: Text("Error"));
          }
        },
      ),
    );
  }
}

class _HeaderDelegate extends SliverPersistentHeaderDelegate {
  final Size size;
  final String nombre;

  _HeaderDelegate({required this.size,required this.nombre});

  @override
  Widget build(
    BuildContext context, double shrinkOffset, bool overlapsContent) {
    final scaleFactor = 1 - shrinkOffset / 200;
    final isCollapsed = shrinkOffset > 100;

    return Container(
      height: maxExtent,
      child: Stack(
        children: <Widget>[
          AnimatedOpacity(
            opacity: isCollapsed ? 0.0 : 1.0,
            duration: const Duration(milliseconds: 200),
            child: HeaderWithSearchBox(size: size,nombre: nombre,)
          ),
          AnimatedOpacity(
            opacity: isCollapsed ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 200),
            child: HeaderMini(size: size)
          ),
        ],
      ),
    );
  }
  
  @override
  // TODO: implement maxExtent
  double get maxExtent => size.height * 0.38;
  
  @override
  // TODO: implement minExtent
  double get minExtent => size.height*0.14;

  
  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return false;
  }

  // Resto de métodos...
}



// Resto del código y widgets utilizados en HomeApp

