import 'package:flutter/material.dart';
import 'package:news/core/constants/image_assets.dart';
import 'package:news/core/widgets/custom_search_field.dart';
import 'package:news/core/widgets/custon_bottom.dart';
import 'package:news/features/weather/view/weather_screen.dart';

class Mapscreen extends StatelessWidget {
  const Mapscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Column(
       children: [
        SizedBox(height: 40,),
         Padding(
           padding: const EdgeInsets.all(16),
           child: SafeArea(
             child: Container(
               height: 55,
               decoration: BoxDecoration(
                 color: const Color(0xffF2F2F2),
                 borderRadius: BorderRadius.circular(12),
               ),
               child: CustomSearchField(
                 hintText: "Ahmed Saber",
                 prefixIcon: Icon(Icons.person_outlined),
               )
             ),
           ),
         ),
     
         Expanded(
           child: Stack(
             children: [
               Positioned.fill(
                 child: Image.asset(
                   AppImages.map,
                 ),
               ),
     
               Align(
                 alignment: Alignment.bottomCenter,
                 child: Padding(
                   padding: const EdgeInsets.only(bottom: 50),
                   child: CustomButton(
                     text: 'Get Started',
                     width: 180,
                     onPressed: () {Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const WeatherScreen(),
                        ),
                      );},
                   ),
                 ),
               ),
             ],
           ),
         ),
       ],
     ),
    );
  }
}