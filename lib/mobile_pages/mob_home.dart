import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;

import 'package:url_launcher/url_launcher.dart';

class MobHomePage extends StatelessWidget {
  const MobHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    downloadFile(url) {
      html.AnchorElement(href: url)
        ..download = "CV" // Specify the filename
        ..click();
    }

    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(50),
                height: 250,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(image: AssetImage('assets/icons/boy.png'))),
              ),
            ),
            const Text(
              'Hi I am,',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 80,
              child: AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  TyperAnimatedText(
                    'Faiyaz \nUllah',
                    textStyle: TextStyle(
                      foreground: Paint()
                        ..shader = const LinearGradient(colors: [
                          Color(0xff7071E8),
                          Color(0xffFFC7C7),
                        ]).createShader(const Rect.fromLTWH(0, 0, 1500, 0)),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TyperAnimatedText(
                    'Flutter \nDeveloper',
                    textStyle: TextStyle(
                      color: Colors.blue.withOpacity(0.7),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const Text(
              'I am a Full Stack Android/IOS Developer',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '/*This Website is built using Flutter*/',
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  TextButton.icon(
                      style: TextButton.styleFrom(
                        iconColor: Colors.white,
                        foregroundColor: Colors.white,
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                        backgroundColor: Colors.purple.shade400,
                        elevation: 10,
                      ),
                      onPressed: () async{
                        // downloadFile('assets/faiyaz.pdf');
                        var url = Uri.parse('https://drive.google.com/file/d/1TcT82H6wj1zQIQbWLXwgEA2q_-CAedcu/view?usp=sharing');
                        if(await canLaunchUrl(url)){
                        await launchUrl(url);
                        }
                      },
                      icon: const Icon(Icons.download_sharp),
                      label: const Text(
                        'CV',
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
