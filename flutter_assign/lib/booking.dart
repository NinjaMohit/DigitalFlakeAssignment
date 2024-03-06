import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_assign/bookingmodel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class Booking extends StatefulWidget {
  const Booking({super.key});

  @override
  State<Booking> createState() => _BookingState();
}

class ModelClass {
  int? deskId;
  String? name;
  String? bookedon;

  ModelClass({this.deskId, this.name, this.bookedon});
}

class _BookingState extends State<Booking> {
  List<ModelClass> histroy = [
    ModelClass(
      deskId: 1234,
      name: "Supriya Thete",
      bookedon: "31 may 2022 at 02:00PM",
    ),
    ModelClass(
      deskId: 21564,
      name: "Ram Lokhande",
      bookedon: "30 may 2022 at 01:00PM",
    ),
    ModelClass(
      deskId: 89451,
      name: "Priyanshu Jain",
      bookedon: "29 may 2022 at 12:00PM",
    ),
    ModelClass(
      deskId: 37903,
      name: "Priyanka Mahajan",
      bookedon: "26 may 2022 at 01:00PM",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Booking history"),
      ),
      body: ListView.builder(
          itemCount: histroy.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              width: MediaQuery.of(context).size.width,
              height: 88,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color.fromRGBO(245, 247, 255, 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Text(
                        "DeskId         : ",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: const Color.fromRGBO(137, 137, 137, 1)),
                      ),
                      // ),
                      Text(
                        " ${histroy[index].deskId}",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: const Color.fromRGBO(30, 30, 30, 1)),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Name          : ",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: const Color.fromRGBO(137, 137, 137, 1)),
                      ),
                      // ),
                      Text(
                        " ${histroy[index].name}",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: const Color.fromRGBO(30, 30, 30, 1)),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Booked on  :",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: const Color.fromRGBO(137, 137, 137, 1)),
                      ),
                      // ),
                      Text(
                        " ${histroy[index].bookedon}",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: const Color.fromRGBO(30, 30, 30, 1)),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}
