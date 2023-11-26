import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  final PageController controller;
  const CustomDrawer({super.key, required this.controller});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final List<bool> _isHovering = [false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
          gradient: LinearGradient(colors: [
            Colors.purple.shade400,
            Colors.purple.shade700,
            Colors.purple.shade900,
            Colors.transparent,
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Drawer(
        backgroundColor: Colors.transparent,
        child: Column(
          children: [
            SizedBox(
              height: size.height / 20,
            ),
            Flexible(
              flex: 2,
              child: Container(
                padding: EdgeInsets.all(50),
                height: 150,
                decoration:const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(image: AssetImage('icons/boy.png'))),
              ),
            ),
            SizedBox(
              height: size.height / 15,
            ),
            Text(
              'Faiyaz Ullah',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.purple.shade400,
                shadows: const [
                  BoxShadow(
                      offset: Offset(3, 3), color: Colors.black, blurRadius: 5)
                ],
                letterSpacing: 3,
              ),
            ),
            SizedBox(
              height: size.height / 10,
            ),
            InkWell(
              onHover: (value) {
                setState(() {
                  value ? _isHovering[0] = true : _isHovering[0] = false;
                });
              },
              onTap: () {
                widget.controller.animateToPage(0,
                    duration: const Duration(seconds: 1),
                    curve: Curves.decelerate);

                Navigator.pop(context);
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Home',
                    style: TextStyle(
                      fontSize: 16,
                      color:
                          _isHovering[0] ? Colors.pink : Colors.purple.shade500,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 2,
                      shadows: const [
                        BoxShadow(
                            offset: Offset(3, 3),
                            color: Colors.black,
                            blurRadius: 5)
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  Visibility(
                    maintainAnimation: true,
                    maintainState: true,
                    maintainSize: true,
                    visible: _isHovering[0],
                    child: Container(
                      height: 2,
                      width: 20,
                      color: Colors.white38,
                    ),
                  )
                ],
              ),
            ),
          const  Divider(color: Colors.white30),
            InkWell(
              onHover: (value) {
                setState(() {
                  value ? _isHovering[1] = true : _isHovering[1] = false;
                });
              },
              onTap: () {
                widget.controller.animateToPage(1,
                    duration: const Duration(seconds: 1),
                    curve: Curves.decelerate);
                Navigator.pop(context);
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'About',
                    style: TextStyle(
                      fontSize: 16,
                      color:
                          _isHovering[1] ? Colors.pink : Colors.purple.shade500,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 2,
                      shadows: const [
                        BoxShadow(
                            offset: Offset(3, 3),
                            color: Colors.black,
                            blurRadius: 5)
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  Visibility(
                    maintainAnimation: true,
                    maintainState: true,
                    maintainSize: true,
                    visible: _isHovering[1],
                    child: Container(
                      height: 2,
                      width: 20,
                      color: Colors.white38,
                    ),
                  )
                ],
              ),
            ),
          const  Divider(color: Colors.white30),
            // SizedBox(width: size.width / 5),
            InkWell(
              onHover: (value) {
                setState(() {
                  value ? _isHovering[2] = true : _isHovering[2] = false;
                });
              },
              onTap: () {
                widget.controller.animateToPage(2,
                    duration: const Duration(seconds: 1),
                    curve: Curves.decelerate);
                Navigator.pop(context);
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Skills',
                    style: TextStyle(
                      fontSize: 16,
                      color:
                          _isHovering[2] ? Colors.pink : Colors.purple.shade500,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 2,
                      shadows: const [
                        BoxShadow(
                            offset: Offset(3, 3),
                            color: Colors.black,
                            blurRadius: 5)
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  Visibility(
                    maintainAnimation: true,
                    maintainState: true,
                    maintainSize: true,
                    visible: _isHovering[2],
                    child: Container(
                      height: 2,
                      width: 20,
                      color: Colors.white38,
                    ),
                  )
                ],
              ),
            ),
          const  Divider(color: Colors.white30),
            // SizedBox(width: size.width / 5),
            InkWell(
              onHover: (value) {
                setState(() {
                  value ? _isHovering[3] = true : _isHovering[3] = false;
                });
              },
              onTap: () {
                widget.controller.animateToPage(3,
                    duration: const Duration(seconds: 1),
                    curve: Curves.decelerate);
                Navigator.pop(context);
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Projects',
                    style: TextStyle(
                      fontSize: 16,
                      color:
                          _isHovering[3] ? Colors.pink : Colors.purple.shade500,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 2,
                      shadows: const [
                        BoxShadow(
                            offset: Offset(3, 3),
                            color: Colors.black,
                            blurRadius: 5)
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  Visibility(
                    maintainAnimation: true,
                    maintainState: true,
                    maintainSize: true,
                    visible: _isHovering[3],
                    child: Container(
                      height: 2,
                      width: 20,
                      color: Colors.white38,
                    ),
                  )
                ],
              ),
            ),
            // SizedBox(width: size.width / 5),
           const Divider(color: Colors.white30),
            InkWell(
              onHover: (value) {
                setState(() {
                  value ? _isHovering[4] = true : _isHovering[4] = false;
                });
              },
              onTap: () {
                widget.controller.animateToPage(4,
                    duration: const Duration(seconds: 1),
                    curve: Curves.decelerate);
                Navigator.pop(context);
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Contacts',
                    style: TextStyle(
                      fontSize: 16,
                      color:
                          _isHovering[4] ? Colors.pink : Colors.purple.shade500,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 2,
                      shadows: const [
                        BoxShadow(
                            offset: Offset(3, 3),
                            color: Colors.black,
                            blurRadius: 5)
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  Visibility(
                    maintainAnimation: true,
                    maintainState: true,
                    maintainSize: true,
                    visible: _isHovering[4],
                    child: Container(
                      height: 2,
                      width: 20,
                      color: Colors.white38,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
