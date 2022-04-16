import 'package:flutter/material.dart';
import 'package:flutter_mailer/flutter_mailer.dart';
import 'package:my_portfolio/utilities/screen_detector.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

class RequestService extends StatefulWidget {
  const RequestService({Key? key}) : super(key: key);

  @override
  State<RequestService> createState() => _RequestServiceState();
}

class _RequestServiceState extends State<RequestService> {
  final TextEditingController _senderName = TextEditingController();
  final TextEditingController _senderEmail = TextEditingController();
  final TextEditingController _messageDescription = TextEditingController();

  // final MailOptions mailOptions = MailOptions(
  //     body:_messageDescription ,
  //     subject: _subjectController.text,
  //     recipients: <String>['example@example.com'],
  //     isHTML: true,
  //     // bccRecipients: ['other@example.com'],
  //     ccRecipients: <String>['third@example.com'],
  //   );
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ResponsiveWrapper(
      child: Container(
        width: screenDetector.isDesktop(context) ? size.width / 2 : size.width,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              crossAxisAlignment: screenDetector.isDesktop(context)
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.start,
              children: [
                Text(
                  'Hire me',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                    height: 1.3,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: _senderName,
                  style: TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'Organization name/ Personal name',
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                    hintText: 'Akinsola faruq',
                    hintStyle: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                    ),
                    prefixStyle:
                        TextStyle(color: Colors.white.withOpacity(0.7)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _senderEmail,
                  style: TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                    hintText: 'Akindoyinfaruq@gmail.com',
                    hintStyle: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                    ),
                    prefixStyle:
                        TextStyle(color: Colors.white.withOpacity(0.7)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _messageDescription,
                  maxLines: 7,
                  style: TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'Job Description',
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                    hintText:
                        'e.g a website designed to increase productivity, a learning management system',
                    hintStyle: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                    ),
                    prefixStyle:
                        TextStyle(color: Colors.white.withOpacity(0.7)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: InkWell(
                    onTap: () {
                      print(_senderEmail.text);
                    },
                    child: Container(
                      height: 40,
                      width: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Theme.of(context).primaryColor),
                      child: Center(
                        child: Text(
                          'Submit',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
