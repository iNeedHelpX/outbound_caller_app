import 'package:flutter/material.dart';
import 'package:phonecallforgirls/ViewElements/calldadbutton.dart';
import 'package:phonecallforgirls/ui/appbariconpress.dart';
import 'package:phonecallforgirls/ui/isthisforguys.dart';
import 'package:phonecallforgirls/ui/paddedtextbox.dart';
import 'package:phonecallforgirls/ViewElements/credittext.dart';

//main view of app.
class CallerView extends StatefulWidget {
  CallerView({Key? key}) : super(key: key);

  @override
  _CallerViewState createState() => _CallerViewState();
}

//global variables:
String staticPhone =
    "YOUR TWILIO NUMBER"; //the number where the call comes from.
//the recording of the voice sample that plays
String callToRec =
//twilml bin
    "SOME TWILML BIN";

class _CallerViewState extends State<CallerView> {
  //Controller for phone number input
  TextEditingController _phoneController = TextEditingController();
//this is what encompasses the main app view
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 54, 48, 115),
            title: Text('Dad Calls for you'),
            actions: [IconPress()],
          ),
          backgroundColor: Color.fromARGB(255, 149, 223, 213),
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  //the box for entering phone number
                  PaddedTextBox(phoneController: _phoneController),
                  SizedBox(height: 100),
                  CallButton(
                      phoneController: _phoneController,
                      staticPhone: staticPhone,
                      callToRec: callToRec),
                  SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {
                      //function for pressing button to get info
                      buildShowDialog(context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 51, 53, 166),
                    ),
                    child: Text("I'm a guy, is this for me?"),
                  ),
                  SizedBox(height: 60),
                  CreditText(),
                ],
              ),
            ),
          ),
          resizeToAvoidBottomInset: false,
        ),
      ),
    );
  }
}
