import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:apitest3/test_data/hoteldata.dart';
import 'package:apitest3/components/habitacionSimple.dart';

Column buildForYou(Color defaultColor, Size size) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Para Ti', //category name
            style: TextStyle(
              fontFamily: "Poppins",
              color: defaultColor,
              fontSize: size.height * 0.025,
              fontWeight: FontWeight.bold,
            ),
          ),
/*           InkWell(
            //TODO: add view all action
            onTap: () {},
            child: Text(
              'Ver más',
              style: TextStyle(
                color: defaultColor.withOpacity(0.4),
                fontSize: size.height * 0.02,
                fontWeight: FontWeight.bold,
              ),
            ),
          ), */
        ],
      ),
      Padding(
        padding: EdgeInsets.symmetric(
          vertical: size.height * 0.02,
        ),
        child: CarouselSlider.builder(

          itemCount: forYou.length,
          itemBuilder: (context, i, ri) {
            Map hotel = forYou[i];
            return buildHotel(hotel, defaultColor, size);
          },
          options: CarouselOptions(
            viewportFraction: 1,
            height: size.height * 0.222,
            enableInfiniteScroll: true,
            autoPlay: forYou.length > 1 ? true : false,
            autoPlayInterval: const Duration(seconds: 8),
            
          ),
        ),
      ),
      
    ],
  );
}
