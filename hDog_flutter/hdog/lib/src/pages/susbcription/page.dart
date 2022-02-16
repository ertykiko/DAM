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

class PageSusbcription extends StatefulWidget {
  const PageSusbcription({
    Key? key,
  }) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends AuthState<PageSusbcription>
    with SingleTickerProviderStateMixin {
  final datasets = <String, dynamic>{};

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: Container(
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          width: double.maxFinite,
          height: 70,
          decoration: const BoxDecoration(
            color: Color(0xFF000000),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () async {
                  if (!Scaffold.of(context).isDrawerOpen) {
                    Scaffold.of(context).openDrawer();
                  }
                },
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        top: 20,
                        right: 20,
                        bottom: 20,
                      ),
                      child: Icon(
                        MdiIcons.fromString('''menu'''),
                        size: 34,
                        color: Color(0xFF5A5A5A),
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 25,
                    top: 25,
                    right: 25,
                    bottom: 25,
                  ),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Center(
                      child: Icon(
                        MdiIcons.fromString('''account'''),
                        size: 40,
                        color: Color(0xFF000000),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: SafeArea(
          left: false,
          top: true,
          right: true,
          bottom: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    top: 10,
                    right: 10,
                    bottom: 10,
                  ),
                  child: Container(
                    margin: EdgeInsets.zero,
                    padding: EdgeInsets.zero,
                    width: double.maxFinite,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                    child: Align(
                      child: Text(r'''Homepage''',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: const Color(0xFF000000),
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              fontStyle: FontStyle.normal,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          textAlign: TextAlign.left,
                          maxLines: 1),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    top: 10,
                    right: 10,
                    bottom: 10,
                  ),
                  child: Container(
                    margin: EdgeInsets.zero,
                    padding: EdgeInsets.zero,
                    width: double.maxFinite,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                    child: Align(
                      child: Text(r'''Suscripciones''',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: const Color(0xFF000000),
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              fontStyle: FontStyle.normal,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          textAlign: TextAlign.left,
                          maxLines: 1),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    top: 10,
                    right: 10,
                    bottom: 10,
                  ),
                  child: Container(
                    margin: EdgeInsets.zero,
                    padding: EdgeInsets.zero,
                    width: double.maxFinite,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                    child: Align(
                      child: Text(r'''Historial de servicios''',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: const Color(0xFF000000),
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              fontStyle: FontStyle.normal,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          textAlign: TextAlign.left,
                          maxLines: 1),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    top: 10,
                    right: 10,
                    bottom: 10,
                  ),
                  child: Container(
                    margin: EdgeInsets.zero,
                    padding: EdgeInsets.zero,
                    width: double.maxFinite,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                    child: Align(
                      child: Text(r'''Dados de mi perro''',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: const Color(0xFF000000),
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              fontStyle: FontStyle.normal,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          textAlign: TextAlign.left,
                          maxLines: 1),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    top: 10,
                    right: 10,
                    bottom: 10,
                  ),
                  child: Container(
                    margin: EdgeInsets.zero,
                    padding: EdgeInsets.zero,
                    width: double.maxFinite,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                    child: Align(
                      child: Text(r'''Quiero ser Asistente''',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: const Color(0xFF000000),
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              fontStyle: FontStyle.normal,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          textAlign: TextAlign.left,
                          maxLines: 1),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    top: 10,
                    right: 10,
                    bottom: 10,
                  ),
                  child: Container(
                    margin: EdgeInsets.zero,
                    padding: EdgeInsets.zero,
                    width: double.maxFinite,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                    child: Align(
                      child: Text(r'''Legal''',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: const Color(0xFF000000),
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              fontStyle: FontStyle.normal,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          textAlign: TextAlign.left,
                          maxLines: 1),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: const Color(0xFF000000),
      body: Stack(
        children: [
          SafeArea(
            left: false,
            top: false,
            right: false,
            bottom: false,
            child: Container(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                color: Color(0xFFFFFFFF),
              ),
              child: ListView(
                primary: true,
                children: [
                  GestureDetector(
                    child: Container(
                      margin: const EdgeInsets.only(
                        left: 20,
                        top: 20,
                        right: 20,
                        bottom: 20,
                      ),
                      padding: EdgeInsets.zero,
                      width: double.maxFinite,
                      height: 200,
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
                          Container(
                            margin: EdgeInsets.zero,
                            padding: const EdgeInsets.only(
                              left: 10,
                              top: 10,
                              right: 10,
                              bottom: 10,
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
                            child: Center(
                              child: Text(r'''Tú subscrición''',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: const Color(0xFF000000),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20,
                                      fontStyle: FontStyle.normal,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                  textAlign: TextAlign.left,
                                  maxLines: 1),
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 20,
                                          bottom: 10,
                                        ),
                                        child: Text(r'''4.7''',
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
                                            maxLines: 1),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          right: 20,
                                        ),
                                        child: Icon(
                                          MdiIcons.fromString('''star'''),
                                          size: 24,
                                          color: Color(0xFF000000),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 20,
                                      top: 10,
                                      right: 20,
                                    ),
                                    child: Text(r'''340 Paseos''',
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
                                        maxLines: 1),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 20,
                                      top: 10,
                                      right: 20,
                                    ),
                                    child: Text(r'''20.000 $''',
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
                                        maxLines: 1),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 30,
                                ),
                                child: Container(
                                  margin: EdgeInsets.zero,
                                  padding: EdgeInsets.zero,
                                  width: 120,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFFFFFFF),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30),
                                      bottomRight: Radius.circular(30),
                                      bottomLeft: Radius.circular(30),
                                    ),
                                    child: Image.network(
                                      r'''https://mfjprgwvxjgpioopxign.supabase.in/storage/v1/object/public/public/marcel.png''',
                                      width: double.maxFinite,
                                      height: 140,
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
                  GestureDetector(
                    child: Container(
                      margin: const EdgeInsets.only(
                        left: 20,
                        top: 20,
                        right: 20,
                        bottom: 20,
                      ),
                      padding: EdgeInsets.zero,
                      width: double.maxFinite,
                      height: 200,
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
                          Container(
                            margin: EdgeInsets.zero,
                            padding: const EdgeInsets.only(
                              left: 10,
                              top: 10,
                              right: 10,
                              bottom: 10,
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
                            child: Center(
                              child: Text(r'''Rodrigo Machado''',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: const Color(0xFF000000),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20,
                                      fontStyle: FontStyle.normal,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                  textAlign: TextAlign.left,
                                  maxLines: 1),
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 20,
                                          bottom: 10,
                                        ),
                                        child: Text(r'''3.9''',
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
                                            maxLines: 1),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          right: 20,
                                        ),
                                        child: Icon(
                                          MdiIcons.fromString('''star'''),
                                          size: 24,
                                          color: Color(0xFF000000),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 20,
                                      top: 10,
                                      right: 20,
                                    ),
                                    child: Text(r'''21 Paseos  ''',
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
                                        maxLines: 1),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 20,
                                      top: 10,
                                      right: 20,
                                    ),
                                    child: Text(r'''19.000 $''',
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
                                        maxLines: 1),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 30,
                                ),
                                child: Container(
                                  margin: EdgeInsets.zero,
                                  padding: EdgeInsets.zero,
                                  width: 120,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFFFFFFF),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30),
                                      bottomRight: Radius.circular(30),
                                      bottomLeft: Radius.circular(30),
                                    ),
                                    child: Image.network(
                                      r'''https://mfjprgwvxjgpioopxign.supabase.in/storage/v1/object/public/public/ro.jpg''',
                                      width: double.maxFinite,
                                      height: 140,
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
