import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_assign/available_desk.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class Desk extends StatefulWidget {
  const Desk({super.key});

  @override
  State<Desk> createState() => _DeskState();
}

class _DeskState extends State<Desk> {
  // DateTime _selectedValue;
  int tappedButtonIndex = -1;
  Color buttonColor(int buttonIndex) {
    if (buttonIndex == 1 || buttonIndex == 6 || buttonIndex == 5) {
      return const Color.fromRGBO(227, 227, 227, 1);
    } else if (buttonIndex != tappedButtonIndex) {
      return const Color.fromRGBO(240, 245, 255, 1);
    } else {
      return const Color.fromRGBO(77, 96, 209, 1);
    }
  }

  Color buttonTextColor(int buttonIndex) {
    if (buttonIndex == 1 || buttonIndex == 6 || buttonIndex == 5) {
      return const Color.fromRGBO(246, 246, 246, 1);
    } else if (buttonIndex != tappedButtonIndex) {
      return const Color.fromRGBO(91, 97, 128, 1);
    } else {
      return const Color.fromRGBO(240, 245, 255, 1);
    }
  }

  @override
  void initState() {
    super.initState();

    var todaysDate = DateTime.now();

    var selectedDate = DateFormat("yyyy-MM-dd").format(todaysDate);
    print("SelectedDate =$selectedDate");
    getSlot(date: selectedDate);
  }

  void getSlot({required String? date}) async {
    print("in createLogin function");
    final response = await http.get(
      Uri.parse(
          'https://demo0413095.mockable.io/digitalflake/api/get_slots?date=$date'),
    );
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      print('Response : ${data['user_id']}');
      print("data=${data}");
      // Navigator.of(context)
      //     .push(MaterialPageRoute(builder: (context) => const HomeScreen()));
    } else {
      throw Exception('Failed to load JSON');
    }
  }

  List<String> timeSlot = [
    '10:00AM - 11:00AM',
    '11:00AM - 12:00PM',
    '01:00PM - 02:00PM',
    '02:00PM - 03:00PM',
    '04:00PM - 05:00PM',
    '05:00PM - 06:00PM',
    '06:00PM - 07:00PM',
    '07:00PM - 08:00PM',
    '08:00PM - 09:00PM',
    '09:00PM - 10:00PM'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select Date & Slot',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 89,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 0.5),
            ),
            child: DatePicker(
              DateTime.now(),
              initialSelectedDate: DateTime.now(),
              selectionColor: const Color.fromRGBO(77, 96, 209, 1),
              selectedTextColor: Colors.white,
              onDateChange: (date) {
                // New date selected
                setState(() {
                  // _selectedValue = date;
                  print(date);
                });
              },
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3.0,
                mainAxisSpacing: 12.0,
                crossAxisSpacing: 12.0,
              ),
              shrinkWrap: true,
              itemCount: timeSlot.length,
              itemBuilder: ((context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      tappedButtonIndex = index;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: buttonColor(index),

                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: const Color.fromRGBO(199, 207, 252, 1),
                      ),
                      // color: Colors.grey.shade200,
                    ),
                    child: Text(
                      timeSlot[index],
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: buttonTextColor(index),
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AvailableDesk()));
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
                "Next",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: const Color.fromRGBO(255, 255, 255, 1)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
