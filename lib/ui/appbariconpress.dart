import 'package:flutter/material.dart';
import 'package:phonecallforgirls/ViewElements/customdialog.dart';

class IconPress extends StatelessWidget {
  const IconPress({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 15),
      child: IconButton(
          icon: Icon(
            Icons.live_help_sharp,
            color: Color.fromARGB(255, 251, 221, 17),
          ),
          iconSize: 30,
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return CustomDialogBox(
                    title: "Get a Call from Dad by Julia Pak",
                    description:
                        "Just enter your 10 digit phone number(area code and number only), press the pink button and dad will call you ASAP. Yes this produces a REAL outbound call to the number you entered. You must be in Canada or USA to receive this special call. Works great if you need to get yourself out of a sketchy situation.",
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
          }),
    );
  }
}
