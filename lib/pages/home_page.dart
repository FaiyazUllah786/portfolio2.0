import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;

class HomePage extends StatelessWidget {
  const HomePage({
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Flexible(
            flex: 1,
            child: SizedBox(),
          ),
          Flexible(
            flex: 2,
            child: SizedBox(
              width: size.width / 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Hi I am,',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  AnimatedTextKit(
                    repeatForever: true,
                    animatedTexts: [
                      TyperAnimatedText(
                        'Faiyaz Ullah',
                        textStyle: TextStyle(
                          foreground: Paint()
                            ..shader = const LinearGradient(colors: [
                              Color(0xff7071E8),
                              Color(0xffFFC7C7),
                            ]).createShader(Rect.fromLTWH(0, 0, 1500, 0)),
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TyperAnimatedText(
                        'Flutter Developer',
                        textStyle: TextStyle(
                          color: Colors.blue.withOpacity(0.7),
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
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
                            onPressed: () {
                              downloadFile('assets/faiyaz.pdf');
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
          ),
          Flexible(
            flex: 1,
            child: Container(
              height: 350,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage('assets/icons/boy.png'))),
            ),
          )
        ],
      ),
    );
  }
}
