import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/home/home_body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF219ebc),
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'Welcome to Souq',
            style: GoogleFonts.getFont('Almarai'),
          ),
          centerTitle: false,
          actions: [
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {},
            )
          ],
        ),
        body: HomeBody(),
      ),
    );
  }
}
