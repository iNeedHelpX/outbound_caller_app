import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:phonecallforgirls/ui/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomDialogBox extends StatefulWidget {
  final String title, description, textlink, text;
  final Image img;

  const CustomDialogBox({
    Key? key,
    required this.title,
    required this.description,
    required this.textlink,
    required this.text,
    required this.img,
  }) : super(key: key);

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Constants.padding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
              left: Constants.padding,
              top: Constants.avatarRadius + Constants.padding,
              right: Constants.padding,
              bottom: Constants.padding),
          margin: EdgeInsets.only(top: Constants.avatarRadius),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Color.fromARGB(255, 161, 228, 243),
              borderRadius: BorderRadius.circular(Constants.padding),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 10),
                    blurRadius: 10),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                widget.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromARGB(255, 224, 52, 245),
                    fontSize: 24,
                    fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                widget.description,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.center,
                child: Linkify(
                  onOpen: _openLink,
                  text: widget.textlink,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    widget.text,
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: Constants.padding,
          right: Constants.padding,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: Constants.avatarRadius,
            child: ClipRRect(
                borderRadius:
                    BorderRadius.all(Radius.circular(Constants.avatarRadius)),
                child: Image.asset("assets/beard.jpg")),
          ),
        ),
      ],
    );
  }

  Future<void> _openLink(LinkableElement link) async {
    if (await canLaunch(link.url)) {
      await launch(link.url);
    } else {
      throw 'Could not launch $link';
    }
  }
}
