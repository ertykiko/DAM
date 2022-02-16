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

class PageCard extends StatefulWidget {
  const PageCard({
    Key? key,
    this.name = 'Insert name',
    this.rating = '4.3',
    this.image = 'https://source.unsplash.com/random',
    this.price = '20.000',
    this.experience = '126',
  }) : super(key: key);

  final String name;

  final String rating;

  final String image;

  final String price;

  final String experience;

  @override
  _State createState() => _State();
}

class _State extends AuthState<PageCard> with SingleTickerProviderStateMixin {
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
            height: 250,
            decoration: BoxDecoration(
              color: const Color(0xFF000000),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
                bottomRight: Radius.circular(40),
                bottomLeft: Radius.circular(40),
              ),
            ),
            child: Align(
              child: Container(
                margin: const EdgeInsets.only(
                  left: 20,
                  top: 20,
                  right: 20,
                  bottom: 20,
                ),
                width: double.maxFinite,
                height: 250,
                decoration: BoxDecoration(
                  color: const Color(0xFF000000),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        margin: const EdgeInsets.only(
                          left: 5,
                          top: 5,
                          right: 5,
                          bottom: 5,
                        ),
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          color: const Color(0xFF000000),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                        ),
                        child: Center(
                          child: Text('''${widget.title}''',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: const Color(0xFFFFFFFF),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 30,
                                  fontStyle: FontStyle.normal,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              textAlign: TextAlign.left,
                              maxLines: 1),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                    left: 10,
                                    top: 10,
                                    right: 10,
                                    bottom: 10,
                                  ),
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                    bottom: 10,
                                  ),
                                  width: 40,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF000000),
                                  ),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text('''${widget.rating}''',
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            color: const Color(0xFFFFFFFF),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 18,
                                            fontStyle: FontStyle.normal,
                                            decoration: TextDecoration.none,
                                          ),
                                        ),
                                        textAlign: TextAlign.left,
                                        maxLines: 5),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                    left: 10,
                                    top: 10,
                                    bottom: 10,
                                  ),
                                  padding: EdgeInsets.zero,
                                  width: 10,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF000000),
                                  ),
                                  child: Icon(
                                    MdiIcons.fromString('''star'''),
                                    size: 24,
                                    color: Color(0xFF000000),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                left: 10,
                                top: 10,
                                right: 10,
                                bottom: 10,
                              ),
                              padding: const EdgeInsets.only(
                                left: 5,
                                top: 5,
                                right: 5,
                                bottom: 5,
                              ),
                              width: 180,
                              decoration: const BoxDecoration(
                                color: Color(0xFF000000),
                              ),
                              child: Text('''${widget.experience}''',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: const Color(0xFFFFFFFF),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      fontStyle: FontStyle.normal,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                  textAlign: TextAlign.left,
                                  maxLines: 5),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                left: 10,
                                top: 10,
                                right: 10,
                                bottom: 10,
                              ),
                              padding: const EdgeInsets.only(
                                left: 5,
                                top: 5,
                                right: 5,
                                bottom: 5,
                              ),
                              width: 180,
                              decoration: const BoxDecoration(
                                color: Color(0xFF000000),
                              ),
                              child: Center(
                                child: Text('''${widget.price}''',
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        color: const Color(0xFFFFFFFF),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 20,
                                        fontStyle: FontStyle.normal,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                    textAlign: TextAlign.left,
                                    maxLines: 5),
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: EdgeInsets.zero,
                            padding: EdgeInsets.zero,
                            width: 120,
                            height: 120,
                            decoration: const BoxDecoration(
                              color: Color(0xFF000000),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40),
                                bottomRight: Radius.circular(40),
                                bottomLeft: Radius.circular(40),
                              ),
                              child: Image.network(
                                '''${widget.image}''',
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
