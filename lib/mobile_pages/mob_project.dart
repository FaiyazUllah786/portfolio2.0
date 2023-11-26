import 'dart:html' as html;
import 'dart:math';
import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MobProjectPage extends StatelessWidget {
  const MobProjectPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    PageController _pageController = PageController(initialPage: 0);
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
        PointerDeviceKind.mouse,
        PointerDeviceKind.touch,
        PointerDeviceKind.trackpad,
        PointerDeviceKind.stylus,
      }),
      child: PageView(
        controller: _pageController,
        children: [
          ProjectWidget(
              controller: _pageController,
              projectName: '# Weather App',
              projectDesc:
                  'This is a Weather App.It fetch latest weather reports of your location.You can also find weather reports of your desired cities.This app shows weather data beautifully along with city known images',
              projectImage: 'assets/projectImages/weather.jpg',
              githubLink:
                  'https://github.com/FaiyazUllah786/heyflutter_contest_weatherApp'),
          ProjectWidget(
              controller: _pageController,
              projectName: '# Currency Converter App',
              projectDesc:
                  'It is a Currency Converter app that use OpenExchange Api to fetch latest currency rate.You can find every countries currency rates in this app and get your calcuted converted amount based on your query.  ',
              projectImage: 'assets/projectImages/currencyConverter.jpg',
              githubLink: 'https://github.com/FaiyazUllah786/codsoft_task3'),
          ProjectWidget(
            controller: _pageController,
            projectName: '# Chat App',
            projectDesc:
                'This Project is started as a WhatsApp clone.Now in this project I am currently trying to changing app ui and give some extra functionality such as More customization on themes,In-app file explorer,Material 3 UI etc. \n This Project is Under Development.Currently this project is private on github,i will change this to public Keep Learning everyone..... ',
            projectImage: 'assets/projectImages/whatsapp.jpg',
            githubLink: '',
          ),
        ],
      ),
    );
  }
}

class ProjectWidget extends StatelessWidget {
  final PageController controller;
  final String projectImage;
  final String projectName;
  final String projectDesc;
  final String githubLink;
  const ProjectWidget({
    super.key,
    required this.controller,
    required this.projectImage,
    required this.projectName,
    required this.projectDesc,
    required this.githubLink,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CardWidget(
                  projectImage: projectImage,
                ),
              )),
              Flexible(
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
                        projectName,
                        textStyle: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 25,
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
                    SizedBox(
                      height: size.height*0.2,
                      child: Text(
                        projectDesc,
                        style:  TextStyle(
                          fontSize: (size.height<600)?14: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    if (githubLink.isNotEmpty)
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomButton(
                            lottie: 'assets/github.json',
                            label: 'Source Code',
                            githubUrl: githubLink,
                            controller: controller,
                          ),
                          const SizedBox(width: 10),
                          CustomButton(
                            controller: controller,
                            lottie: 'assets/arrowRightCircle.json',
                            label: 'More',
                            btnColor: Colors.blue.shade700,
                            githubUrl: '',
                          )
                        ],
                      )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardWidget extends StatefulWidget {
  final String projectImage;
  const CardWidget({super.key, required this.projectImage});

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  double x = 0;
  double y = 0;
  double amplitude = 0.3;
  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: FractionalOffset.center,
      transform: Matrix4.identity()
        ..rotateX(x)
        ..rotateY(y),
      child: GestureDetector(
        onPanEnd: (details) {
          setState(() {
            y = 0;
            x = 0;
          });
        },
        onPanUpdate: (details) {
          if (y - details.delta.dx < 0) {
            setState(() {
              y = max(y - details.delta.dx / 100, -amplitude);
            });
          } else {
            setState(() {
              y = min(y - details.delta.dx / 100, amplitude);
            });
          }
          if (x + details.delta.dy < 0) {
            setState(() {
              x = max(x + details.delta.dy / 100, -amplitude);
            });
          } else {
            setState(() {
              x = min(x + details.delta.dy / 100, amplitude);
            });
          }
        },
        child: Container(
          height: 300,
          width: 150,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(widget.projectImage), fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Colors.white.withOpacity(0.5),
                    blurRadius: 20,
                    offset: Offset(y * 50, -x * 50))
              ]),
        ),
      ),
    );
  }
}

class CustomButton extends StatefulWidget {
  final String lottie;
  final String label;
  final Color btnColor;
  final String githubUrl;
  final PageController controller;
  const CustomButton(
      {super.key,
      required this.lottie,
      required this.label,
      required this.githubUrl,
      required this.controller,
      this.btnColor = Colors.purple});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isTap = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTapDown: (details) {
        setState(() {
          _isTap = true;
        });
        if (widget.githubUrl.isNotEmpty) {
          html.window.open(widget.githubUrl, '');
        } else {
          widget.controller.nextPage(
              duration: const Duration(seconds: 1), curve: Curves.decelerate);
        }
      },
      onTapUp: (deatails) {
        setState(() {
          _isTap = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 50),
        decoration: BoxDecoration(
            color: widget.btnColor.withOpacity(0.7),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 1, color: Colors.white.withOpacity(0.2)),
            boxShadow: [
              BoxShadow(
                color: widget.btnColor,
                offset: _isTap ? const Offset(0, 0) : const Offset(-1, 4),
                blurRadius: _isTap ? 0 : 2,
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
          child: Row(
            children: [Lottie.asset(widget.lottie), Text(widget.label)],
          ),
        ),
      ),
    );
  }
}
