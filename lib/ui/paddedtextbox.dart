import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'decor.dart';

//the text input box that grabs the phone number. But first we must Pad it!

class PaddedTextBox extends StatefulWidget {
  const PaddedTextBox({
    Key? key,
    required TextEditingController phoneController,
  })   : _phoneController = phoneController,
        super(key: key);

  final TextEditingController _phoneController;

  @override
  _PaddedTextBoxState createState() => _PaddedTextBoxState();
}

class _PaddedTextBoxState extends State<PaddedTextBox> {
  var formKey = GlobalKey<FormState>();
  bool autoValidate = false;

//function to toggle entered phone number between viewable and non-viewable
  // void _toggleVisibility() {
  //   setState(() {
  //     _isHidden = !_isHidden;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    //padding around the text form so that it doesnt bump on anything
    return Container(
      padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: formKey,
        //the actual text form.
        child: TextFormField(
          scrollPadding: EdgeInsets.all(2),
          style: TextStyle(
            color: Colors.black87,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
          validator: _validatePhone,
          keyboardType: TextInputType.number,
          maxLength: 10,
          controller: widget._phoneController,

          onTap: () => FocusScope.of(context).unfocus(),
          inputFormatters: [
            //input type as digits only
            FilteringTextInputFormatter.allow(
              RegExp(r'[0-9]'),
            ),
          ],

          //how the text box is decorated. With toggle icons to switch privacy
          decoration: buildInputDecoration(
            Icons.ring_volume_rounded,
            'Enter your 10 digit phone number',
          ),
        ),
      ),
    );
  }

//This function validates that the person has entered a full 10 digit number in the feild. Further validation comes later to ensure nothing BUT 10 digits is sent
  String? _validatePhone(String? value) {
    if (value!.length != 10) {
      return 'Number must be 10 digits';
    } else {
      if (value.length == 10) {
        return "Ready for call";
      }
    }
  }
}
