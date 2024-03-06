import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_assign/homescreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_assign/createaccount.dart';
import 'package:http/http.dart' as http;

class LoginIn extends StatefulWidget {
  const LoginIn({super.key});
  @override
  State<LoginIn> createState() => _LoginInScreen();
}

class _LoginInScreen extends State<LoginIn> {
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();

  void clear() {
    userName.clear();
    password.clear();
  }

  Future<void> login() async {
    print("in login function");
    final response = await http.post(
        Uri.parse('https://demo0413095.mockable.io/digitalflake/api/login'),
        body: {
          "email": userName.text.trim(),
          "password": password.text.trim(),
        });

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
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 89,
                width: double.infinity,
              ),
              Container(
                alignment: Alignment.center,
                height: 44,
                width: 44,
                child: Image.asset("assets/DF_Icon.png"),
              ),
              const SizedBox(
                height: 14,
              ),
              SizedBox(
                height: 32,
                width: 149,
                child: Text(
                  "Co-working",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 24,
                      color: const Color.fromRGBO(0, 0, 0, 1)),
                ),
              ),
              const SizedBox(
                height: 81,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                    width: 195,
                    child: Text(
                      "Mobile number or Email",
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
                      controller: userName,
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
                  SizedBox(
                    height: 20,
                    width: 79,
                    child: Text(
                      "Password",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: const Color.fromRGBO(73, 73, 73, 1),
                      ),
                    ),
                  ),
                  Container(
                    color: const Color.fromRGBO(249, 249, 249, 1),
                    margin: const EdgeInsets.only(top: 10, bottom: 24),
                    height: 56,
                    width: 312,
                    child: TextField(
                      controller: password,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1,
                            color: Color.fromRGBO(218, 218, 218, 1),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        suffixIcon: const Icon(
                          Icons.visibility_off_outlined,
                          color: Color.fromRGBO(168, 168, 168, 1),
                        ),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  const SizedBox(
                    height: 110,
                  ),
                  GestureDetector(
                    onTap: () {
                      login();
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
                        "Log In",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: const Color.fromRGBO(255, 255, 255, 1),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 20,
                        width: 75,
                        alignment: Alignment.center,
                        child: Text(
                          "New user? ",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const Createaccount(),
                            ),
                          );
                        },
                        child: Text(
                          " Create an Account",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: const Color.fromARGB(255, 72, 16, 131)),
                        ),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
