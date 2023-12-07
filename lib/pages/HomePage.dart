import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:camera_app/pages/camera_page.dart';
import 'package:google_fonts/google_fonts.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,title:  Text("Hii there!!!",style: GoogleFonts.montserrat(fontSize:20 ,fontWeight: FontWeight.w600,color: Colors.black),)
      ,backgroundColor: Colors.yellow,),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () async {
              await availableCameras().then((value) => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => CameraPage(cameras: value))));
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.yellow, // Background color
              onPrimary: Colors.black, // Text color
            ),
            child: const Text("Take a Picture"),
          ),
        ),
      ),
    );
  }
}
