import 'package:flutter/material.dart';
import 'package:flutter_assign/confirmation.dart';
import 'package:google_fonts/google_fonts.dart';

class AvailableDesk extends StatefulWidget {
  const AvailableDesk({super.key});

  @override
  State<AvailableDesk> createState() => _AvailableDeskState();
}

class _AvailableDeskState extends State<AvailableDesk> {
  int tappedButtonIndex = -1;
  Color buttonColor(int buttonIndex) {
    if (buttonIndex == 2 ||
        buttonIndex == 5 ||
        buttonIndex == 10 ||
        buttonIndex == 37 ||
        buttonIndex == 32 ||
        buttonIndex == 13 ||
        buttonIndex == 27) {
      return const Color.fromRGBO(227, 227, 227, 1);
    } else if (buttonIndex != tappedButtonIndex) {
      return const Color.fromRGBO(240, 245, 255, 1);
    } else {
      return const Color.fromRGBO(77, 96, 209, 1);
    }
  }

  Color buttonTextColor(int buttonIndex) {
    if (buttonIndex == 2 ||
        buttonIndex == 5 ||
        buttonIndex == 10 ||
        buttonIndex == 37 ||
        buttonIndex == 32 ||
        buttonIndex == 13 ||
        buttonIndex == 27) {
      return const Color.fromRGBO(246, 246, 246, 1);
    } else if (buttonIndex != tappedButtonIndex) {
      return const Color.fromRGBO(91, 97, 128, 1);
    } else {
      return const Color.fromRGBO(240, 245, 255, 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Available desks",
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              fontSize: 20,
              color: const Color.fromRGBO(0, 0, 0, 1)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            Text(
              'Wed 31 May , 05:00PM-06:00PM',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                  color: const Color.fromRGBO(0, 0, 0, 1)),
            ),
            const SizedBox(height: 19),
            Wrap(
              spacing: 12.0,
              runSpacing: 12.0,
              children: List.generate(
                  40,
                  (index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            tappedButtonIndex = index;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: buttonColor(index),
                              borderRadius: BorderRadius.circular(3),
                              border: Border.all(
                                width: 1,
                                color: const Color.fromARGB(255, 191, 205, 232),
                              )),
                          width: 42,
                          height: 42,
                          alignment: Alignment.center,
                          child: Text(
                            "${index + 1}",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: buttonTextColor(index)),
                          ),
                        ),
                      )),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                setState(() {
                  Confirmation.showMyDialog(context);
                });
              },
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 10, bottom: 14),
                height: 56,
                width: 312,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(81, 103, 235, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "Book Desk",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: const Color.fromRGBO(255, 255, 255, 1)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
