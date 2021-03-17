import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class CreditText extends StatefulWidget {
  const CreditText({
    Key? key,
  }) : super(key: key);

  @override
  _CreditTextState createState() => _CreditTextState();
}

class _CreditTextState extends State<CreditText> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 140, 20, 5),
      child: Center(
        child: Linkify(
          textAlign: TextAlign.center,
          onOpen: _onOpen,
          text: "Voice of call by Jason https://twitter.com/Budget_JStatham",
          style: TextStyle(
            color: Color.fromARGB(255, 41, 34, 60),
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Future<void> _onOpen(LinkableElement link) async {
    if (await canLaunch(link.url)) {
      await launch(link.url);
    } else {
      throw 'Could not launch $link';
    }
  }
}
