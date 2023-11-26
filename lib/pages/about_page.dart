import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../responsive/textsize.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Flexible(
            flex:2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedTextKit(repeatForever: true, animatedTexts: [
                  ColorizeAnimatedText(
                    colors: [
                      Colors.cyan.shade900,
                      Colors.grey.shade500,
                      Colors.cyan.shade900,
                      Colors.cyan.shade900,
                    ],
                    '# About Me',
                    textStyle: TextStyle(
                      fontSize: 30,
                      color: Colors.cyan.shade900,
                      letterSpacing: 2,
                      height: 2,
                      shadows: [
                        Shadow(
                          color: Colors.cyan.shade900,
                          offset: Offset(4, 4),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                  )
                ]),
                Flexible(
                  child: Text(
                    'Hello! I am Faiyaz Ullah, a passionate and dedicated final-year Computer Science student at Aliah University.',
                    style: TextStyle(
                      fontSize: textSize(size.width),
                      color: Colors.grey,
                    ),
                  ),
                ),
                AnimatedTextKit(repeatForever: true, animatedTexts: [
                  ColorizeAnimatedText(
                    colors: [
                      Colors.cyan.shade900,
                      Colors.grey.shade500,
                      Colors.cyan.shade900,
                      Colors.cyan.shade900,
                    ],
                    '# Academic Journey',
                    textStyle: TextStyle(
                      fontSize: 30,
                      color: Colors.cyan.shade900,
                      letterSpacing: 2,
                      height: 2,
                      shadows: [
                        Shadow(
                          color: Colors.cyan.shade900,
                          offset: const Offset(4, 4),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                  )
                ]),
                Flexible(
                  child: Text(
                    "I am currently pursuing my Bachelor's degree in Computer Science and Engineering, and I am expected to graduate in 2024. With a strong foundation in computer science principles and a current CGPA of 8.6, I have consistently demonstrated a commitment to academic excellence.",
                    style: TextStyle(
                      fontSize: textSize(size.width),
                      color: Colors.grey,
                    ),
                  ),
                ),
                AnimatedTextKit(repeatForever: true, animatedTexts: [
                  ColorizeAnimatedText(
                    colors: [
                      Colors.cyan.shade900,
                      Colors.grey.shade500,
                      Colors.cyan.shade900,
                      Colors.cyan.shade900,
                    ],
                    '# Future Aspirations',
                    textStyle: TextStyle(
                      fontSize: 30,
                      color: Colors.cyan.shade900,
                      letterSpacing: 2,
                      height: 2,
                      shadows: [
                        Shadow(
                          color: Colors.cyan.shade900,
                          offset: const Offset(4, 4),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                  )
                ]),
                Flexible(
                  child: Text(
                    "As I approach the completion of my degree, I am enthusiastic about applying the knowledge and skills I've gained to real-world challenges. My academic journey has equipped me with a solid understanding of computer science concepts, and I am excited to embark on a rewarding career in the field.Feel free to explore my portfolio to learn more about my projects, skills, and experiences.",
                    style: TextStyle(
                      fontSize: textSize(size.width),
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: SizedBox(height: 500, child: Lottie.asset('about.json')),
          )
        ],
      ),
    );
  }
}
