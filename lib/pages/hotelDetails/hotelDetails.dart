import 'package:apitest3/core/constants/color_palatte.dart';
import 'package:flutter/material.dart';
import 'package:apitest3/core/helpers/asset_helper.dart';
import 'package:apitest3/core/helpers/image_helper.dart';
import 'package:apitest3/models/hotel_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:travo_app_source/representation/screen/rooms_screen.dart';
import 'package:apitest3/components/dash_line.dart';
import 'package:apitest3/components/item_button_widget.dart';
import 'package:get/get.dart';

import '../../../core/constants/dimension_constants.dart';
import '../../../core/constants/textstyle_ext.dart';
import 'package:apitest3/components/item_utility_hotel.dart';

class DetailHotelScreen extends StatefulWidget {
  static const String routeName = '/detail_hotel_screen';

  const DetailHotelScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<DetailHotelScreen> createState() => _DetailHotelScreenState();
}

class _DetailHotelScreenState extends State<DetailHotelScreen> {
  final HotelModel hotelModel = HotelModel(
    hotelImage: AssetHelper.hotel3,
    hotelName: 'Hodel Valle Sur - Sede Sur',
    location: 'Moquegua',
    awayKilometer: '1.1 km',
    star: 4.2,
    numberOfReview: 86,
    price: 132,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned.fill(
            child: ImageHelper.loadFromAsset(
              AssetHelper.hotelScreen,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            top: kMediumPadding * 3,
            left: kMediumPadding,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorPalette.dividerColor,
                    width: 2
                  ),
                  borderRadius: BorderRadius.circular(
                    
                    kDefaultPadding,
                  ),
                  color: ColorPalette.buttonColor,
                ),
                padding: EdgeInsets.all(kItemPadding),
                child: Icon(
                  FontAwesomeIcons.arrowLeft,
                  size: kDefaultPadding,
                  color: ColorPalette.iconColor,
                ),
              ),
            ),
          ),
          Positioned(
            top: kMediumPadding * 3,
            right: kMediumPadding,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorPalette.dividerColor,
                    width: 2
                  ),
                  borderRadius: BorderRadius.circular(
                    kDefaultPadding,
                  ),
                  color: ColorPalette.buttonColor,
                ),
                padding: EdgeInsets.all(kItemPadding),
                child: Icon(
                  FontAwesomeIcons.solidHeart,
                  size: kDefaultPadding,
                  color: Colors.red,
                ),
              ),
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.3,
            maxChildSize: 0.68,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: kMediumPadding),
                decoration: BoxDecoration(
                  color: ColorPalette.backgroundScaffoldColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(kDefaultPadding * 2),
                    topRight: Radius.circular(kDefaultPadding * 2),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: kDefaultPadding),
                      child: Container(
                        height: 5,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(kItemPadding),
                          color: ColorPalette.iconColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: kMediumPadding,
                    ),
                    Expanded(
                      child: ListView(
                        controller: scrollController,
                        padding: EdgeInsets.zero,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    hotelModel.hotelName,
                                    style:
                                        TextStyles.defaultStyle.fontHeader.bold,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: kDefaultPadding,
                              ),
                              Row(
                                children: [
                                  ImageHelper.loadFromAsset(
                                    AssetHelper.icoLocationBlank,
                                  ),
                                  SizedBox(
                                    width: kMinPadding,
                                  ),
                                  Text(
                                    hotelModel.location,
                                    style: TextStyles.defaultStyle.secundaryTextColor,
                                  ),
                                  Text(
                                    ' - ${hotelModel.awayKilometer} para el destino',
                                    style: TextStyles.defaultStyle
                                        .subTitleTextColor.fontCaption,
                                  ),
                                ],
                              ),
                              DashLineWidget(),
                              Row(
                                children: [
                                  ImageHelper.loadFromAsset(
                                    AssetHelper.icoStar,
                                  ),
                                  SizedBox(
                                    width: kMinPadding,
                                  ),
                                  Text(
                                    hotelModel.star.toString(),
                                    style: TextStyles.defaultStyle.secundaryTextColor,
                                  ),
                                  Text(
                                    ' (${hotelModel.numberOfReview} opiniones)',
                                    style: TextStyles
                                        .defaultStyle.subTitleTextColor,
                                  ),
                                ],
                              ),
                              DashLineWidget(),
                              Text(
                                'Información',
                                style: TextStyles.defaultStyle.bold,
                              ),
                              SizedBox(
                                height: kDefaultPadding,
                              ),
                              Text(
                                '''El hotel se encuentra al lado del terminal por lo que será muy comodo para la estadia''',
                                style: TextStyles.defaultStyle.secundaryTextColor,
                              ),
                              ItemUtilityHotelWidget(),
                              SizedBox(
                                height: kDefaultPadding,
                              ),
                              Text(
                                'Ubicación',
                                style: TextStyles.defaultStyle.bold,
                              ),
                              SizedBox(
                                height: kDefaultPadding,
                              ),
                              Text(
                                '''Ubicado en la ciudad de Moquegua''',
                                style: TextStyles.defaultStyle.secundaryTextColor,
                              ),
                              SizedBox(
                                height: kDefaultPadding,
                              ),
                              /* ImageHelper.loadFromAsset(
                                AssetHelper.imageMap,
                                width: double.infinity,
                              ), */
                              SizedBox(
                                height: kMediumPadding,
                              ),
                              ItemButtonWidget(
                                  data: 'Seleccionar una habitación',
                                  onTap: () {
                                    Get.toNamed("/selectPax&Date");
                                    
                                  }),
                              SizedBox(
                                height: kMediumPadding,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          // Positioned(
          //   bottom: 0,
          //   left: 0,
          //   right: 0,
          //   child: Container(
          //     height: MediaQuery.of(context).size.height * 0.7,
          //     padding: EdgeInsets.symmetric(horizontal: kMediumPadding),
          //     decoration: BoxDecoration(
          //       color: Colors.white,
          //       borderRadius: BorderRadius.only(
          //         topLeft: Radius.circular(kDefaultPadding * 2),
          //         topRight: Radius.circular(kDefaultPadding * 2),
          //       ),
          //     ),
          //     child: Column(
          //       children: [
          //         Container(
          //           alignment: Alignment.center,
          //           margin: EdgeInsets.only(top: kDefaultPadding),
          //           child: Container(
          //             height: 5,
          //             width: 60,
          //             decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(kItemPadding),
          //               color: Colors.black,
          //             ),
          //           ),
          //         ),
          //         SizedBox(
          //           height: kMediumPadding,
          //         ),
          //         Expanded(
          //           child: SingleChildScrollView(
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Row(
          //                   children: [
          //                     Text(
          //                       widget.hotelModel.hotelName,
          //                       style: TextStyles.defaultStyle.fontHeader.bold,
          //                     ),
          //                     Spacer(),
          //                     Text(
          //                       '\$${widget.hotelModel.price.toString()}',
          //                       style: TextStyles.defaultStyle.fontHeader.bold,
          //                     ),
          //                     Text(
          //                       ' /night',
          //                       style: TextStyles.defaultStyle.fontCaption,
          //                     ),
          //                   ],
          //                 ),
          //                 SizedBox(
          //                   height: kDefaultPadding,
          //                 ),
          //                 Row(
          //                   children: [
          //                     ImageHelper.loadFromAsset(
          //                       AssetHelper.icoLocationBlank,
          //                     ),
          //                     SizedBox(
          //                       width: kMinPadding,
          //                     ),
          //                     Text(
          //                       widget.hotelModel.location,
          //                     ),
          //                     Text(
          //                       ' - ${widget.hotelModel.awayKilometer} from destination',
          //                       style: TextStyles.defaultStyle.subTitleTextColor.fontCaption,
          //                     ),
          //                   ],
          //                 ),
          //                 DashLineWidget(),
          //                 Row(
          //                   children: [
          //                     ImageHelper.loadFromAsset(
          //                       AssetHelper.icoStar,
          //                     ),
          //                     SizedBox(
          //                       width: kMinPadding,
          //                     ),
          //                     Text(
          //                       widget.hotelModel.star.toString(),
          //                     ),
          //                     Text(
          //                       ' (${widget.hotelModel.numberOfReview} reviews)',
          //                       style: TextStyles.defaultStyle.subTitleTextColor,
          //                     ),
          //                     Spacer(),
          //                     Text(
          //                       'See All',
          //                       style: TextStyles.defaultStyle.bold.primaryTextColor,
          //                     ),
          //                   ],
          //                 ),
          //                 DashLineWidget(),
          //                 Text(
          //                   'Infomation',
          //                   style: TextStyles.defaultStyle.bold,
          //                 ),
          //                 SizedBox(
          //                   height: kDefaultPadding,
          //                 ),
          //                 Text(
          //                   '''You will find every comfort because many of the services that the hotel offers for travellers and of course the hotel is very comfortable.''',
          //                 ),
          //                 ItemUtilityHotelWidget(),
          //                 SizedBox(
          //                   height: kDefaultPadding,
          //                 ),
          //                 Text(
          //                   'Location',
          //                   style: TextStyles.defaultStyle.bold,
          //                 ),
          //                 SizedBox(
          //                   height: kDefaultPadding,
          //                 ),
          //                 Text(
          //                   '''Located in the famous neighborhood of Seoul, Grand Luxury’s is set in a building built in the 2010s.''',
          //                 ),
          //                 SizedBox(
          //                   height: kDefaultPadding,
          //                 ),
          //                 ImageHelper.loadFromAsset(
          //                   AssetHelper.imageMap,
          //                   width: double.infinity,
          //                 ),
          //                 SizedBox(
          //                   height: kMediumPadding,
          //                 ),
          //                 ItemButtonWidget(
          //                     data: 'Select Room',
          //                     onTap: () {
          //                       Navigator.of(context).pushNamed(RoomsScreen.routeName);
          //                     }),
          //                 SizedBox(
          //                   height: kMediumPadding,
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
