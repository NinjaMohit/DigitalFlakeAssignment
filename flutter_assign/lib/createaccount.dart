import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_assign/homescreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_assign/LoginIn.dart';
import 'package:http/http.dart' as http;

class Createaccount extends StatefulWidget {
  const Createaccount({super.key});

  @override
  State<Createaccount> createState() => _AssignmentState();
}

class _AssignmentState extends State<Createaccount> {
  TextEditingController fullName = TextEditingController();
  TextEditingController mobNumber = TextEditingController();
  TextEditingController emailId = TextEditingController();

  void clear() {
    mobNumber.clear();
    emailId.clear();
    fullName.clear();
  }

  Future<void> createLogin() async {
    print("in createLogin function");
    final response = await http.post(
        Uri.parse(
            'https://demo0413095.mockable.io/digitalflake/api/create_account'),
        body: {
          "Name": fullName.text.trim(),
          "email": emailId.text.trim(),
        });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      print('Response : ${data['user_id']}');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const HomeScreen()));
    } else {
      throw Exception('Failed to load JSON');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            Container(
              alignment: Alignment.centerLeft,
              height: 50,
              width: 300,
              child: Text(
                "Create an Account",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 24,
                    color: const Color.fromRGBO(0, 0, 0, 1)),
              ),
            ),
            const SizedBox(
              height: 48,
            ),
            Container(
              padding: const EdgeInsets.only(left: 24, right: 19),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 20,
                    width: 85,
                    alignment: Alignment.center,
                    child: Text(
                      "Full name",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: const Color.fromRGBO(73, 73, 73, 1)),
                    ),
                  ),
                  Container(
                    color: const Color.fromRGBO(249, 249, 249, 1),
                    margin: const EdgeInsets.only(top: 10, bottom: 24),
                    height: 56,
                    width: 312,
                    child: TextField(
                      controller: fullName,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 1,
                              color: Color.fromRGBO(218, 218, 218, 1)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 20,
                    width: 128,
                    child: Text(
                      "Mobile number",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: const Color.fromRGBO(73, 73, 73, 1)),
                    ),
                  ),
                  Container(
                    color: const Color.fromRGBO(249, 249, 249, 1),
                    margin: const EdgeInsets.only(top: 10, bottom: 24),
                    height: 56,
                    width: 312,
                    child: TextField(
                      controller: mobNumber,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 1,
                              color: Color.fromRGBO(218, 218, 218, 1)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 20,
                    width: 68,
                    child: Text(
                      "Email ID",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: const Color.fromRGBO(73, 73, 73, 1)),
                    ),
                  ),
                  Container(
                    color: const Color.fromRGBO(249, 249, 249, 1),
                    margin: const EdgeInsets.only(top: 10, bottom: 24),
                    height: 56,
                    width: 312,
                    child: TextField(
                      controller: emailId,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 1,
                              color: Color.fromRGBO(218, 218, 218, 1)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  const SizedBox(
                    height: 115,
                  ),
                  GestureDetector(
                    onTap: () {
                      createLogin();
                      clear();
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
                        "Create an account",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: const Color.fromRGBO(255, 255, 255, 1)),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 20,
                        width: 100,
                        alignment: Alignment.center,
                        child: Text(
                          "Existing user?",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const LoginIn()));
                        },
                        child: Text(
                          "Login In",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: const Color.fromARGB(255, 72, 16, 131)),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
