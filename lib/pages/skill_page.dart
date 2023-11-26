import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SkillPage extends StatefulWidget {
  const SkillPage({
    super.key,
  });

  @override
  State<SkillPage> createState() => _SkillPageState();
}

class _SkillPageState extends State<SkillPage> {
  bool _animate = false;
  bool _isMounted = false;
  @override
  void initState() {
    _isMounted = true;
    startAnim();
    super.initState();
  }
  @override
  void dispose() {
    _isMounted = false;
    super.dispose();
  }
  void startAnim(){
    if (_isMounted) {
      Future.delayed(Duration.zero).then(
            (_) {
          setState(() {
            _animate = true;
          });
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        height: size.height - kToolbarHeight,
        width: size.width,
        alignment: Alignment.center,
        child: Column(
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
                '# My Skills',
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
            AnimatedSlide(
              duration: Duration(seconds: 3),
              offset: Offset(0, _animate ? 0 : 0.3),
              child: Container(
                padding: EdgeInsets.all(10),
                height: size.height / 1.5,
                width: 500,
                child: GridView.count(
                  crossAxisSpacing: 25,
                  mainAxisSpacing: 20,
                  crossAxisCount: (size.width>500)?4:(size.width<500&&size.width>350)?3:2,
                  children: [
                    IconWidget(
                      imageWidget: Image.asset('assets/icons/flutter.png'),
                      imageName: 'Flutter',
                      knowledge: 0.8,
                    ),
                    IconWidget(
                      imageWidget: Image.asset('assets/icons/dart.png'),
                      imageName: 'Dart',
                      knowledge: 0.7,
                    ),
                    IconWidget(
                      imageWidget: Image.asset('assets/icons/andriod.png'),
                      imageName: 'Android',
                      knowledge: 0.9,
                    ),
                    IconWidget(
                      imageWidget: Image.asset('assets/icons/java.png'),
                      imageName: 'Java',
                      knowledge: 0.85,
                    ),
                    IconWidget(
                      imageWidget: Image.asset('assets/icons/javascript.png'),
                      imageName: 'JavaScript',
                      knowledge: 0.7,
                    ),
                    IconWidget(
                      imageWidget: Image.asset('assets/icons/firebase.png'),
                      imageName: 'Firebase',
                      knowledge: 0.85,
                    ),
                    IconWidget(
                      imageWidget: Image.asset('assets/icons/mongo.png'),
                      imageName: 'MongoDB',
                      knowledge: 0.75,
                    ),
                    IconWidget(
                      imageWidget: Image.asset('assets/icons/nodejs.png'),
                      imageName: 'NodeJS',
                      knowledge: 0.7,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

class IconWidget extends StatefulWidget {
  final Widget imageWidget;
  final String imageName;
  final double knowledge;
  const IconWidget({
    super.key,
    required this.imageWidget,
    required this.imageName,
    required this.knowledge,
  });

  @override
  State<IconWidget> createState() => _IconWidgetState();
}

class _IconWidgetState extends State<IconWidget> {
  bool _isHover = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {},
      onHover: (hover) {
        print(hover);
        setState(() {
          _isHover = !_isHover;
        });
      },
      child: Stack(
        children: [
          AnimatedContainer(
            duration: Duration(seconds: 1),
            margin: EdgeInsets.all(_isHover ? 10 : 0),
            height: size.width < 500 ? 100 : 150,
            width: size.width < 500 ? 100 : 150,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.white30),
                color: Colors.white.withOpacity(_isHover ? 0.5 : 0.1),
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 0),
                    color: Colors.white10,
                    blurRadius: 15,
                    spreadRadius: 5,
                  )
                ]),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(child: widget.imageWidget),
                  Text(widget.imageName),
                ],
              ),
            ),
          ),
          if (_isHover)
            Positioned(
                bottom: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    '${widget.knowledge * 100}%',
                    style: TextStyle(
                        color: Colors.purple.shade900,
                        fontWeight: FontWeight.bold),
                  ),
                )),
          if (_isHover)
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                ),
                child: TweenAnimationBuilder<double>(
                  tween: Tween<double>(begin: 0, end: widget.knowledge),
                  duration: const Duration(seconds: 1),
                  builder: (context, value, child) => CircularProgressIndicator(
                    strokeCap: StrokeCap.round,
                    color: Colors.pink.shade300,
                    value: value,
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}

