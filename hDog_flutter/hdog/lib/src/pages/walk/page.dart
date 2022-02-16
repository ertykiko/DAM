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

class PageWalk extends StatefulWidget {
  const PageWalk({
    Key? key,
  }) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends AuthState<PageWalk> with SingleTickerProviderStateMixin {
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
              padding: EdgeInsets.zero,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                color: Color(0xFFFFFFFF),
              ),
              child: ListView(
                primary: true,
                children: [
                  Lottie.network(
                    '''https://assets1.lottiefiles.com/packages/lf20_XRLjtE.json''',
                    width: double.maxFinite,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  GestureDetector(
                    onTap: () async {
                      await Navigator.push<void>(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PageWalk_confirm(),
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
                      height: 220,
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
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 10,
                                  top: 10,
                                  right: 10,
                                  bottom: 10,
                                ),
                                child: Text(r'''Quiero un paseo a vulso''',
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
                          ),
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
                              width: double.maxFinite,
                              decoration: const BoxDecoration(
                                color: Color(0xFF000000),
                              ),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                    r'''Pide un paseo de cada vez cuando sea oportuno para ti. Si quieres experimentar conostros antes de tener tu plan o si tu vida cambia a toda hora, esta esla mejor opcion''',
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        color: const Color(0xFFFFFFFF),
                                        fontWeight: FontWeight.w300,
                                        fontSize: 16,
                                        fontStyle: FontStyle.normal,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                    textAlign: TextAlign.left,
                                    maxLines: 7),
                              ),
                            ),
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
                      height: 220,
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
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 10,
                                  top: 10,
                                  right: 10,
                                  bottom: 10,
                                ),
                                child: Text(r'''Queiro un plano de paseos''',
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
                          ),
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
                              width: double.maxFinite,
                              decoration: const BoxDecoration(
                                color: Color(0xFF000000),
                              ),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  r'''Hace una subscrición con paseos diários semanales. Si quieres popar tiempo, diñero y facilitar tu vida esto es lo mejor para ti y para ti perro. Los assintentes te daran un servicio prático y confiable''',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: const Color(0xFFFFFFFF),
                                      fontWeight: FontWeight.w300,
                                      fontSize: 16,
                                      fontStyle: FontStyle.normal,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
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
