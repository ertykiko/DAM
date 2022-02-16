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

class PageHome extends StatefulWidget {
  const PageHome({
    Key? key,
  }) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends AuthState<PageHome> with SingleTickerProviderStateMixin {
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
                onTap: () async {
                  await Navigator.push<void>(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PageProfile(),
                    ),
                  );
                },
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
            mainAxisAlignment: MainAxisAlignment.center,
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
          Container(
            padding: EdgeInsets.zero,
            width: double.maxFinite,
            decoration: const BoxDecoration(
              color: Color(0xFFFFFFFF),
            ),
            child: SafeArea(
              left: false,
              top: false,
              right: false,
              bottom: true,
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
                        color: const Color(0xFFF6CDCD),
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
                            margin: const EdgeInsets.only(
                              left: 10,
                              top: 10,
                              right: 10,
                              bottom: 10,
                            ),
                            padding: EdgeInsets.zero,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              color: const Color(0xFF000000),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(24),
                                topRight: Radius.circular(24),
                                bottomRight: Radius.circular(24),
                                bottomLeft: Radius.circular(24),
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(r'''Planea la vida de tu perro !''',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: const Color(0xFFFFFFFF),
                                      fontWeight: FontWeight.w500,
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
                              Padding(
                                padding: EdgeInsets.zero,
                                child: Container(
                                  margin: const EdgeInsets.only(
                                    left: 10,
                                    top: 10,
                                    right: 10,
                                    bottom: 10,
                                  ),
                                  padding: EdgeInsets.zero,
                                  width: 170,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF000000),
                                  ),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      r'''Maneja tu subscicion de tu paseos, baños y mucho más! Poupa tiempo y diñero, mientras que tu perro tinene su vida planeada''',
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          color: const Color(0xFFFFFFFF),
                                          fontWeight: FontWeight.w300,
                                          fontSize: 13,
                                          fontStyle: FontStyle.normal,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.zero,
                                padding: EdgeInsets.zero,
                                width: 100,
                                decoration: const BoxDecoration(
                                  color: Color(0xFF000000),
                                ),
                                child: Lottie.network(
                                  '''https://assets4.lottiefiles.com/packages/lf20_syqnfe7c.json''',
                                  width: double.maxFinite,
                                  height: 140,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await Navigator.push<void>(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PageActivities(),
                        ),
                      );
                    },
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
                        color: const Color(0xFFF6CDCD),
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
                            margin: const EdgeInsets.only(
                              left: 10,
                              top: 10,
                              right: 10,
                              bottom: 10,
                            ),
                            padding: EdgeInsets.zero,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              color: const Color(0xFF000000),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(24),
                                topRight: Radius.circular(24),
                                bottomRight: Radius.circular(24),
                                bottomLeft: Radius.circular(24),
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(r'''Que necesita tu pero hoy ?''',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: const Color(0xFFFFFFFF),
                                      fontWeight: FontWeight.w500,
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
                              Padding(
                                padding: EdgeInsets.zero,
                                child: Container(
                                  margin: const EdgeInsets.only(
                                    left: 15,
                                    top: 15,
                                    right: 15,
                                    bottom: 15,
                                  ),
                                  padding: EdgeInsets.zero,
                                  width: 170,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF000000),
                                  ),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                        r'''Encontra todos los servicios para simplificar tu vida y ayudar la de tu mejor amigo ! Desde paseos y baños a idas el vet.''',
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            color: const Color(0xFFFFFFFF),
                                            fontWeight: FontWeight.w300,
                                            fontSize: 13,
                                            fontStyle: FontStyle.normal,
                                            decoration: TextDecoration.none,
                                          ),
                                        ),
                                        textAlign: TextAlign.left,
                                        maxLines: 6),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.zero,
                                padding: EdgeInsets.zero,
                                width: 100,
                                decoration: const BoxDecoration(
                                  color: Color(0xFF000000),
                                ),
                                child: Lottie.network(
                                  '''https://assets4.lottiefiles.com/packages/lf20_2ixzdfvy.json''',
                                  width: double.maxFinite,
                                  height: 140,
                                  fit: BoxFit.cover,
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
                      height: 150,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF6CDCD),
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
                            margin: const EdgeInsets.only(
                              left: 10,
                              top: 10,
                              right: 10,
                              bottom: 10,
                            ),
                            padding: EdgeInsets.zero,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              color: const Color(0xFF000000),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(24),
                                topRight: Radius.circular(24),
                                bottomRight: Radius.circular(24),
                                bottomLeft: Radius.circular(24),
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(r'''Tu área de cliente''',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: const Color(0xFFFFFFFF),
                                      fontWeight: FontWeight.w500,
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
                              Padding(
                                padding: EdgeInsets.zero,
                                child: Container(
                                  margin: const EdgeInsets.only(
                                    left: 10,
                                    top: 10,
                                    right: 10,
                                    bottom: 10,
                                  ),
                                  padding: EdgeInsets.zero,
                                  width: 170,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF000000),
                                  ),
                                  child: Text(
                                      r'''Acesa a todos los dados de tu perro y tuyo historico con asistente canino''',
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          color: const Color(0xFFFFFFFF),
                                          fontWeight: FontWeight.w300,
                                          fontSize: 13,
                                          fontStyle: FontStyle.normal,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                      textAlign: TextAlign.left,
                                      maxLines: 6),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.zero,
                                padding: EdgeInsets.zero,
                                width: 100,
                                decoration: const BoxDecoration(
                                  color: Color(0xFF000000),
                                ),
                                child: Lottie.network(
                                  '''https://assets9.lottiefiles.com/packages/lf20_96g1yneg.json''',
                                  width: double.maxFinite,
                                  height: 70,
                                  fit: BoxFit.cover,
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
                      height: 170,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF6CDCD),
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
                            margin: const EdgeInsets.only(
                              left: 10,
                              top: 10,
                              right: 10,
                              bottom: 10,
                            ),
                            padding: EdgeInsets.zero,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              color: const Color(0xFF000000),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(24),
                                topRight: Radius.circular(24),
                                bottomRight: Radius.circular(24),
                                bottomLeft: Radius.circular(24),
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(r'''O que és hDog ?''',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: const Color(0xFFFFFFFF),
                                      fontWeight: FontWeight.w500,
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
                              Padding(
                                padding: EdgeInsets.zero,
                                child: Container(
                                  margin: const EdgeInsets.only(
                                    left: 10,
                                    top: 10,
                                    right: 10,
                                    bottom: 10,
                                  ),
                                  padding: EdgeInsets.zero,
                                  width: 170,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF000000),
                                  ),
                                  child: Text(
                                      r'''Una plataforma que conecta a ti y ty perro con asistentes que lo ayudaran con todo que necessita''',
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          color: const Color(0xFFFFFFFF),
                                          fontWeight: FontWeight.w300,
                                          fontSize: 13,
                                          fontStyle: FontStyle.normal,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                      textAlign: TextAlign.left,
                                      maxLines: 6),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.zero,
                                padding: EdgeInsets.zero,
                                width: 100,
                                decoration: const BoxDecoration(
                                  color: Color(0xFF000000),
                                ),
                                child: Lottie.network(
                                  '''https://assets3.lottiefiles.com/packages/lf20_2w2iwhfl.json''',
                                  width: double.maxFinite,
                                  height: 100,
                                  fit: BoxFit.cover,
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
