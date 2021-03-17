import 'package:flutter/material.dart';
import 'package:phonecallforgirls/ViewElements/customdialog.dart';

Future buildShowDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return CustomDialogBox(
          title: "Is this for guys?",
          description:
              "This app is geared towards women, however you may find this useful as a man too. Many women feel unsafe in certain situations and need someone to call them to get them out of a bad situation. However sometimes you may not have a friend or family member to call you, so use this app",
          text: "Exit",
          textlink:
              "Check me out on gitHub and get involved https://github.com/iNeedHelpX",
          img: Image.asset(
            'assets/beard.jpg',
          )
          //asset('assets/notificationIlustration.png'),
          );
    },
  );
}
