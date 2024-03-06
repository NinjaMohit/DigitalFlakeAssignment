import 'package:flutter/material.dart';
import 'package:flutter_assign/booking.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_assign/desk.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isBookWorkTap1 = true;
  bool isBookWorkTap2 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 25, left: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
            ),
            Row(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 22,
                      width: 22,
                      child: Image.asset("assets/DF_Icon.png"),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 20,
                      width: 90,
                      child: Text(
                        "Co-working",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color: const Color.fromRGBO(83, 79, 79, 1)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 60,
                ),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: const Color.fromRGBO(81, 103, 235, 1),
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(1, 1),
                            spreadRadius: 0,
                            blurRadius: 10,
                            color: Color.fromRGBO(0, 0, 0, 0.2))
                      ]),
                  height: 30,
                  width: 131,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Desk()));
                    },
                    child: GestureDetector(
                      onTap: () {
                        // fetchBookings();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const Booking()));
                      },
                      child: Text(
                        "Booking history",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: const Color.fromRGBO(255, 255, 255, 1),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 61,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isBookWorkTap1 = false;
                        });
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const Desk()));
                      },
                      child: Container(
                        height: 147,
                        width: 147,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: isBookWorkTap1
                                ? const Color.fromRGBO(199, 207, 252, 1)
                                : const Color.fromRGBO(77, 96, 201, 1)),
                        child: Image.asset("assets/Group.png"),
                      ),
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 56,
                      width: 113,
                      child: Text(
                        "Book Work Station",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          color: const Color.fromRGBO(67, 62, 62, 1),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isBookWorkTap2 = false;
                        });
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const Desk()));
                      },
                      child: Container(
                        height: 147,
                        width: 147,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: !isBookWorkTap2
                                ? const Color.fromRGBO(77, 96, 201, 1)
                                : const Color.fromRGBO(199, 207, 252, 1)),
                        child: Image.asset("assets/meetingroom1.png"),
                      ),
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 56,
                      width: 113,
                      child: Text(
                        "Meeting room",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          color: const Color.fromRGBO(67, 62, 62, 1),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
