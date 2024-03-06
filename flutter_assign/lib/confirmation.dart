import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_assign/homescreen.dart';

class Confirmation extends StatefulWidget {
  const Confirmation({super.key});

  @override
  State<Confirmation> createState() => _ConfirmationState();

  static Future<void> showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context1) {
        return AlertDialog(
          title: Row(
            children: [
              Text(
                'Confirm booking',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: const Color.fromRGBO(73, 73, 73, 1)),
              ),
              const Spacer(),
              const Icon(
                Icons.cancel,
                color: Colors.black,
                size: 15,
              )
            ],
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Row(
                  children: [
                    Text(
                      "Desk ID :",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: const Color.fromRGBO(148, 148, 148, 1)),
                    ),
                    Text(
                      "123456",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: const Color.fromRGBO(73, 73, 73, 1)),
                    ),
                    const SizedBox(
                      width: 67,
                    ),
                    Text(
                      "Desk 14",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: const Color.fromRGBO(73, 73, 73, 1)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 9,
                ),
                Row(
                  children: [
                    Text(
                      "Slot",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                          color: const Color.fromRGBO(148, 148, 148, 1)),
                    ),
                    Text(
                      " : Wed 31 May, 05:00PM-06:00PM",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: const Color.fromRGBO(73, 73, 73, 1)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 13,
                ),
                GestureDetector(
                  onTap: () {
                    const snackBar = SnackBar(
                      backgroundColor: Color.fromRGBO(25, 173, 30, 1),
                      content: Expanded(
                        child: Row(
                          children: [
                            Icon(Icons.check),
                            Column(
                              children: [
                                Text('Success'),
                                Text(
                                  ' have successfully booked your Desk',
                                  overflow: TextOverflow.visible,
                                  softWrap: true,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 10, bottom: 14),
                    height: 34,
                    width: 159,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(81, 103, 235, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "Confirm",
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
      },
    );
  }
}

class _ConfirmationState extends State<Confirmation> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
