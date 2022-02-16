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
import 'package:lottie/lottie.dart';

class PageLoginPage extends StatefulWidget {
  const PageLoginPage({
    Key? key,
  }) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends AuthState<PageLoginPage>
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
                Container(
                  margin: const EdgeInsets.only(
                    left: 40,
                    top: 40,
                    right: 40,
                    bottom: 40,
                  ),
                  padding: EdgeInsets.zero,
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFFFFF),
                  ),
                  child: Center(
                    child: Text(r'''hDog''',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: const Color(0xFF000000),
                            fontWeight: FontWeight.w400,
                            fontSize: 60,
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
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 20,
                    right: 20,
                    bottom: 20,
                  ),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: const Color(0xFFDBE6DB),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(90),
                      topRight: Radius.circular(90),
                      bottomRight: Radius.circular(90),
                      bottomLeft: Radius.circular(90),
                    ),
                  ),
                  child: Lottie.network(
                    '''https://assets4.lottiefiles.com/packages/lf20_T7TNvI.json''',
                    width: double.maxFinite,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 16,
                    top: 8,
                    right: 16,
                    bottom: 8,
                  ),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                  child: TextField(
                    onChanged: (String value) async {},
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                      hintText: r'''Username''',
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
                Container(
                  margin: const EdgeInsets.only(
                    left: 16,
                    top: 8,
                    right: 16,
                    bottom: 8,
                  ),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                  child: TextField(
                    onChanged: (String value) async {},
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                      hintText: r'''Password''',
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
                    obscureText: true,
                    showCursor: true,
                    autocorrect: false,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 5,
                    top: 5,
                    right: 5,
                    bottom: 5,
                  ),
                  child: Center(
                    child: GestureDetector(
                        onTap: () async {
                          await Navigator.push<void>(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PageHome(),
                            ),
                          );
                        },
                        child: Container(
                            width: 250,
                            height: 48,
                            decoration: BoxDecoration(
                              color: const Color(0xFF3285FF),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(230),
                                topRight: Radius.circular(230),
                                bottomRight: Radius.circular(230),
                                bottomLeft: Radius.circular(230),
                              ),
                            ),
                            child: Text(
                              '''Sign in''',
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
                Padding(
                  padding: const EdgeInsets.only(
                    left: 5,
                    top: 5,
                    right: 5,
                    bottom: 5,
                  ),
                  child: Center(
                    child: GestureDetector(
                        onTap: () async {
                          await Navigator.push<void>(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PageSignUpPage(),
                            ),
                          );
                        },
                        child: Container(
                            width: 250,
                            height: 48,
                            decoration: BoxDecoration(
                              color: const Color(0xFF3285FF),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(230),
                                topRight: Radius.circular(230),
                                bottomRight: Radius.circular(230),
                                bottomLeft: Radius.circular(230),
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
