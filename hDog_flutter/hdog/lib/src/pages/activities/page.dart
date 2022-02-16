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

class PageActivities extends StatefulWidget {
  const PageActivities({
    Key? key,
  }) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends AuthState<PageActivities>
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
                        color: Color(0xFF000000),
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
                onTap: () async {
                  await Navigator.push<void>(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PageHome(),
                    ),
                  );
                },
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
                onTap: () async {
                  await Navigator.push<void>(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PageLegal(),
                    ),
                  );
                },
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
                    onTap: () async {
                      await Navigator.push<void>(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PageWalk(),
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
                              child: Text(r'''Pasear''',
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
                                      r'''Encontra un asistente que te pasea el perro, te envia fuetos enquanto lo hace y partila su trajeto! Exercita tu pero y lo pone en contacto con la natureza ''',
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
                                width: 140,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF000000),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(20),
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(20),
                                  ),
                                  child: Image.network(
                                    r'''https://mfjprgwvxjgpioopxign.supabase.in/storage/v1/object/public/public/walky.png''',
                                    width: double.maxFinite,
                                    height: 145,
                                    fit: BoxFit.cover,
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
                    onTap: () async {
                      await Navigator.push<void>(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PageBath(),
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
                              child: Text(r'''Bañar''',
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
                                    right: 2,
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
                                        r'''Tu perro necessita que algueine lo banie  Queires un pelo liso, fofo y bien cheroso ? Busca quien lo bañe a los mejores prieces !''',
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
                                width: 140,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF000000),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(20),
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(20),
                                  ),
                                  child: Image.network(
                                    r'''https://mfjprgwvxjgpioopxign.supabase.in/storage/v1/object/public/public/hydrotherapy.png''',
                                    width: double.maxFinite,
                                    height: 140,
                                    fit: BoxFit.cover,
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
                              child: Text(r'''Cuidar por la noche o día''',
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
                                      r'''Vas de vaccaciones y no conosces a alguien de confianza para dejar tu perro? Trabajas todo el dia y no lo queires dejar en casa socino?''',
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
                                width: 140,
                                decoration: const BoxDecoration(
                                  color: Color(0xFF000000),
                                ),
                                child: Image.network(
                                  r'''https://mfjprgwvxjgpioopxign.supabase.in/storage/v1/object/public/public/animal-care.png''',
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
                              child: Text(r'''Transporte''',
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
                                      r'''Quieres ayuda para transportar tu perro ? Los assistentes pueden transportarlo con la mayor seguridad para onde queiras''',
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
                                margin: const EdgeInsets.only(
                                  left: 20,
                                ),
                                padding: EdgeInsets.zero,
                                width: 100,
                                decoration: const BoxDecoration(
                                  color: Color(0xFF000000),
                                ),
                                child: Image.network(
                                  r'''https://mfjprgwvxjgpioopxign.supabase.in/storage/v1/object/public/public/dog-carrier.png''',
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
                              child: Text(r'''Veterinário''',
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
                                    bottom: 10,
                                  ),
                                  padding: EdgeInsets.zero,
                                  width: 170,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF000000),
                                  ),
                                  child: Text(
                                      r'''No quieres tratar de lo tema de levar tu perro al veterinário para vacunas, check-ups y mas? ''',
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
                                margin: const EdgeInsets.only(
                                  right: 35,
                                ),
                                padding: EdgeInsets.zero,
                                width: 150,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF000000),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(20),
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(20),
                                  ),
                                  child: Image.network(
                                    r'''https://mfjprgwvxjgpioopxign.supabase.in/storage/v1/object/public/public/vet.png''',
                                    width: double.maxFinite,
                                    height: 148,
                                    fit: BoxFit.cover,
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
                              child: Text(r'''Entrenar''',
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
                                      r'''Puedes encontar alguien que entrene tu perro en los niveles que desejares''',
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
                                width: 140,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF000000),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(2),
                                    topRight: Radius.circular(2),
                                    bottomRight: Radius.circular(2),
                                    bottomLeft: Radius.circular(2),
                                  ),
                                ),
                                child: Image.network(
                                  r'''https://mfjprgwvxjgpioopxign.supabase.in/storage/v1/object/public/public/dog_train.png''',
                                  width: double.maxFinite,
                                  height: 130,
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
                      height: 230,
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
                            height: 60,
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
                              child: Text(
                                  r'''Comprar comida, juguetes y material''',
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
                                  maxLines: 2),
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
                                      r'''Nuestros asistentes saben de los mejores locales para comprar las cosas de tu perro, te ayudan popando tiempo y trabajo''',
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
                                width: 140,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF000000),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(20),
                                  ),
                                ),
                                child: Image.network(
                                  r'''https://mfjprgwvxjgpioopxign.supabase.in/storage/v1/object/public/public/toys.png''',
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
                              child: Text(r'''Mucho más''',
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
                                      r'''Nuestros asistentes pueden hacer to otro tipo de servicios relacionados con perros o mascotas''',
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
                                width: 140,
                                decoration: const BoxDecoration(
                                  color: Color(0xFF000000),
                                ),
                                child: Image.network(
                                  r'''https://mfjprgwvxjgpioopxign.supabase.in/storage/v1/object/public/public/pawprint.png''',
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
