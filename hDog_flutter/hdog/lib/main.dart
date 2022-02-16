import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:myapp/src/pages/loginpage/page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Supabase.initialize(
    url:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlhdCI6MTY0NDA5MzQzNiwiZXhwIjoxOTU5NjY5NDM2fQ.qkyN1hlPtHZEItLOiySQeHk8EDq7HXexlj7F2VyyRRo',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoic2VydmljZV9yb2xlIiwiaWF0IjoxNjQ0MDkzNDM2LCJleHAiOjE5NTk2Njk0MzZ9.UdAD_QqcfLAz5LDQViQ1k80pSXm0wkxjF4LwFda79uQ',
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'hDog',
      home: SplashScreenView(
        navigateRoute: PageLoginPage(),
        duration: 2200,
        imageSize: 140,
        imageSrc: "teta-app.png",
        text: "",
        textType: TextType.NormalText,
        textStyle: TextStyle(
          fontSize: 30.0,
        ),
        backgroundColor: Colors.black,
      ),
    );
  }
}
