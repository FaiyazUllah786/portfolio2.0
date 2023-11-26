import 'package:flutter/material.dart';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/services.dart';

import 'package:rive/rive.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({
    super.key,
  });

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  Artboard? riveArtBoard;
  SMIBool? isDance;
  SMITrigger? isLookUp;

  @override
  void initState() {
    super.initState();
    rootBundle.load('flutter_bird.riv').then((data) async {
      try {
        final file = RiveFile.import(data);
        final artboard = file.mainArtboard;
        var controller = StateMachineController.fromArtboard(artboard, 'birb');
        if (controller != null) {
          artboard.addController(controller);
          isDance = controller.findSMI('dance');
          isLookUp = controller.findSMI('look up');
        }
        setState(() {
          riveArtBoard = artboard;
        });
      } catch (e) {
        print(e);
      }
    });
  }

  final _nameController = TextEditingController();
  final _subjectController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  var name = '';
  var email = '';
  var subject = '';
  var message = '';

  void sendEmail() async {
    setState(() {
      isDance!.value = true;
    });
    // final String serviceId = dotenv.env['SERVICEID']!;
    // final String templateId = dotenv.env['TEMPLATEID']!;
    // final String userId = dotenv.env['USERID']!;
    name = _nameController.text.trim();
    email = _emailController.text.trim();
    subject = _subjectController.text.trim();
    message = _messageController.text.trim();
    try {
      // final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
      // final response = await http.post(url,
      //     headers: {'Content-Type': 'application/json'},
      //     body: json.encode({
      //       'service_id': serviceId,
      //       'template_id': templateId,
      //       'user_id': userId,
      //       'template_params': {
      //         'user_name': name,
      //         'user_email': email,
      //         'user_subject': subject,
      //         'user_message': message
      //       }
      //     }));

      final url = Uri.parse(
          'mailto:$email?subject=${Uri.encodeFull(subject)}&body:=${Uri.encodeFull(message)}');
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
        Future.delayed(const Duration(seconds: 10)).then(
          (_) {
            setState(() {
              isDance!.value = false;
            });
          },
        );

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.black,
            content: Text('Sending Mail...'),
            // width: 200,
            behavior: SnackBarBehavior.floating,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 10,
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height / 8,
              left: MediaQuery.of(context).size.height / 2,
              right: MediaQuery.of(context).size.height / 2,
            ),
          ),
        );
      }

      // print(response.body);
    } catch (e) {
      print(e);
    }

    print('service id or something is empty');
  }

  void toggleDance(bool newValue) {
    setState(() {
      isDance!.value = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Row(
        children: [
          Flexible(
            child: SizedBox(
              height: size.height * 0.75,
              child: riveArtBoard == null
                  ? const SizedBox()
                  : Column(
                      children: [
                        Flexible(child: Rive(artboard: riveArtBoard!)),
                        TextButton.icon(
                            style: TextButton.styleFrom(
                              iconColor: Colors.white,
                              textStyle: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                              foregroundColor: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                isDance!.value = !isDance!.value;
                              });
                            },
                            icon: const Icon(Icons.emoji_emotions_outlined),
                            label: const Text('Tap To Start Dance')),
                      ],
                    ),
            ),
          ),
          Flexible(
            child: Container(
              alignment: Alignment.center,
              // width: size.width / 3,
              height: size.height / 2,
              padding: const EdgeInsets.symmetric(horizontal: 18),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 2, color: Colors.white30)),
              child: Form(
                  autovalidateMode: AutovalidateMode.disabled,
                  onChanged: () {
                    isLookUp?.value = true;
                  },
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Flexible(
                        child: TextFormField(
                          validator: (name) {
                            if (name == null || name.isEmpty) {
                              return 'please enter your name';
                            } else {
                              return null;
                            }
                          },
                          controller: _nameController,
                          style: const TextStyle(color: Colors.white),
                          cursorColor: Colors.purple,
                          maxLength: 20,
                          decoration: InputDecoration(
                            hoverColor: Colors.purple,
                            counterText: '',
                            filled: true,
                            fillColor: Colors.transparent,
                            labelText: 'Name',
                            labelStyle: const TextStyle(color: Colors.white),
                            hintText: 'Enter Your Name',
                            hintStyle: const TextStyle(color: Colors.white54),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.purple),
                                borderRadius: BorderRadius.circular(10)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(10)),
                            errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(10)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(10)),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Flexible(
                        child: TextFormField(
                          validator: (email) {
                            if (email != null &&
                                !EmailValidator.validate(email)) {
                              return 'Enter a valid email';
                            } else {
                              return null;
                            }
                          },
                          controller: _emailController,
                          style: const TextStyle(color: Colors.white),
                          cursorColor: Colors.purple,
                          maxLength: 70,
                          decoration: InputDecoration(
                            hoverColor: Colors.purple,
                            counterText: '',
                            filled: true,
                            fillColor: Colors.transparent,
                            labelText: 'Email',
                            labelStyle: const TextStyle(color: Colors.white),
                            hintText: 'eg:test@gmail.com',
                            hintStyle: const TextStyle(color: Colors.white54),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.purple),
                                borderRadius: BorderRadius.circular(10)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(10)),
                            errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(10)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(10)),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Flexible(
                        child: TextFormField(
                          validator: (subject) {
                            if (subject == null || subject.isEmpty) {
                              return 'Please enter your subject';
                            } else {
                              return null;
                            }
                          },
                          controller: _subjectController,
                          style: const TextStyle(color: Colors.white),
                          cursorColor: Colors.purple,
                          maxLength: 120,
                          decoration: InputDecoration(
                            hoverColor: Colors.purple,
                            counterText: '',
                            filled: true,
                            fillColor: Colors.transparent,
                            labelText: 'Subject',
                            labelStyle: const TextStyle(color: Colors.white),
                            hintText: 'Enter Your Subject',
                            hintStyle: const TextStyle(color: Colors.white54),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.purple),
                                borderRadius: BorderRadius.circular(10)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(10)),
                            errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(10)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(10)),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Flexible(
                        child: TextFormField(
                          validator: (message) {
                            if (message == null || message.isEmpty) {
                              return 'Please enter your message';
                            } else {
                              return null;
                            }
                          },
                          controller: _messageController,
                          maxLines: null,
                          minLines: null,
                          expands: true,
                          textAlignVertical: TextAlignVertical.top,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          cursorColor: Colors.purple,
                          maxLength: 320,
                          decoration: InputDecoration(
                            hoverColor: Colors.purple,
                            counterText: '',
                            filled: true,
                            fillColor: Colors.transparent,
                            labelText: 'Message',
                            labelStyle: const TextStyle(color: Colors.white),
                            hintText: 'Enter Your Messasge',
                            hintStyle: const TextStyle(
                              color: Colors.white54,
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.purple),
                                borderRadius: BorderRadius.circular(10)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(10)),
                            errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(10)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(10)),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      TextButton.icon(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.green,
                          iconColor: Colors.white,
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          final isValidForm = _formKey.currentState!.validate();
                          if (isValidForm) {
                            print('working');
                            sendEmail();
                          } else {
                            print('something gone wrong..');
                          }
                        },
                        icon: const Icon(
                          Icons.send_rounded,
                        ),
                        label: Text(
                          'Send',
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
