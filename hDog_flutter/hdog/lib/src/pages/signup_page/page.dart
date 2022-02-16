import 'package:flutter/material.dart';
import 'package:supabase/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:myapp/auth/auth_state.dart';

import 'package:myapp/src/pages/index.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:map/map.dart';
import 'package:latlng/latlng.dart';
import 'package:paged_vertical_calendar/paged_vertical_calendar.dart';

class PageSignUpPage extends StatefulWidget {
  const PageSignUpPage({
    Key? key,
  }) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends AuthState<PageSignUpPage>
    with SingleTickerProviderStateMixin {
  final datasets = <String, dynamic>{};

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            width: double.maxFinite,
            decoration: const BoxDecoration(
              color: Color(0xFFFFFFFF),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 5,
                    top: 5,
                    right: 5,
                    bottom: 5,
                  ),
                  child: Center(
                    child: Text(r'''Please enter an email''',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: const Color(0xFF000000),
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            fontStyle: FontStyle.normal,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        textAlign: TextAlign.left,
                        maxLines: 1),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 10,
                    top: 8,
                    right: 10,
                    bottom: 8,
                  ),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                  child: TextField(
                    onChanged: (String value) async {},
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                      ),
                      hintText: r'''''',
                      contentPadding: const EdgeInsets.only(
                        left: 16,
                      ),
                    ),
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: const Color(0xFF000000),
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        fontStyle: FontStyle.normal,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    textAlign: TextAlign.left,
                    maxLines: 1,
                    minLines: 1,
                    maxLength: null,
                    obscureText: false,
                    showCursor: true,
                    autocorrect: false,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.zero,
                  child: Center(
                    child: Text(r'''Please enter a password''',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: const Color(0xFF000000),
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            fontStyle: FontStyle.normal,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        textAlign: TextAlign.left,
                        maxLines: 1),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 20,
                    top: 20,
                    right: 20,
                    bottom: 20,
                  ),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                  child: TextField(
                    onChanged: (String value) async {},
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                      ),
                      hintText: r'''''',
                      contentPadding: const EdgeInsets.only(
                        left: 15,
                        top: 15,
                        right: 15,
                        bottom: 15,
                      ),
                    ),
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: const Color(0xFF000000),
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        fontStyle: FontStyle.normal,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    textAlign: TextAlign.left,
                    maxLines: 1,
                    minLines: 1,
                    maxLength: null,
                    obscureText: true,
                    showCursor: true,
                    autocorrect: false,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 20,
                    right: 20,
                    bottom: 20,
                  ),
                  child: Center(
                    child: GestureDetector(
                        child: Container(
                            width: 140,
                            height: 48,
                            decoration: BoxDecoration(
                              color: const Color(0xFF3285FF),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                              ),
                            ),
                            child: Text(
                              '''Sign up''',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: const Color(0xFFFFFFFF),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  fontStyle: FontStyle.normal,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              textAlign: TextAlign.center,
                            ))),
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
