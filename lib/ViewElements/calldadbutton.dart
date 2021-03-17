import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:phonecallforgirls/apicall/apicall.dart';

class CallButton extends StatefulWidget {
  const CallButton({
    Key? key,
    required TextEditingController phoneController,
    required this.staticPhone,
    required this.callToRec,
  })   : _phoneController = phoneController,
        super(key: key);

  final TextEditingController _phoneController;
  final String staticPhone;
  final String callToRec;

  @override
  _CallButtonState createState() => _CallButtonState();
}

class _CallButtonState extends State<CallButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.pink,
          onPrimary: Colors.white,
          onSurface: Colors.grey,
          padding: EdgeInsets.all(20)),
      onPressed: () async {
        String phone = widget._phoneController.text;
        if (phone.length != 10) {
          final snack = SnackBar(
            content: Text("you need a 10 digit US/CA number"),
            action: SnackBarAction(
              label: 'OK',
              onPressed: () {},
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snack);
        } else {
          _attemptCall(phone, widget.staticPhone, widget.callToRec);
        }

        //api call here
      },
      child: Text('Get a call from dad NOW!'),
    );
  }
  //function that causes the outbound call to happen upon button press

  Future<CallModel> _attemptCall(
      String phone, String staticPhone, String callToRec) async {
    http.Response response = await http.post(
      Uri.https("api.twilio.com",
          "/2010-04-01/Accounts/{YOUR API ID HERE}/Calls.json"),
      headers: {
        "Host": "api.twilio.com",
        "Content-type": "application/x-www-form-urlencoded",
        "Accept-Encoding": "gzip, deflate, br",
        "Authorization": "SOME BASIC CALCULATED TOKEN",
      },
      body: {
        //body goes here
        "To": phone,
        "From": staticPhone,
        "Url": callToRec,
      },
    );

    if (response.statusCode == 201) {
      String responseString = response.body;
      //print statement for testing purposes
      //print(responseString);
      return callModelFromJson(responseString);
    } else {
      //until i come up with a better idea!
      throw Exception('Sorry something went wrong');
    }
  }
}
