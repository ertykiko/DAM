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

class PageProfile extends StatefulWidget {
  const PageProfile({
    Key? key,
  }) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends AuthState<PageProfile>
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(r'''Nothing to see here''',
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
            ),
          ),
        ],
      ),
    );
  }
}
