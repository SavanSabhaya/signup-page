import 'package:flutter/material.dart';

class RadioFormField extends StatefulWidget {
  final Function callback;
  const RadioFormField({Key? key, required this.callback}) : super(key: key);

  @override
  _RadioFormFieldState createState() => _RadioFormFieldState();
}

class _RadioFormFieldState extends State<RadioFormField> {
  String radioValue = '0';

  @override
  Widget build(BuildContext context) {
    return FormField(
      builder: (state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Radio<String>(
                    value: '1',
                    groupValue: radioValue,
                    onChanged: (String? value) {
                      setState(() {
                        radioValue = value.toString();
                      });
                    }),
                const Text('Male',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
                Radio(
                    value: '3',
                    groupValue: radioValue,
                    onChanged: (value) {
                      setState(() {
                        radioValue = value!;
                      });
                    }),
                const Text(
                  'Female',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                ),
                Radio<String>(
                    value: '2',
                    groupValue: radioValue,
                    onChanged: (String? value) {
                      setState(() {
                        radioValue = value.toString();
                      });
                    }),
                const Text('Others',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
              ],
            ),
            Text(
              state.errorText ?? '',
              style: TextStyle(
                color: Theme.of(context).errorColor,
              ),
            ),
          ],
        );
      },
      validator: (value) {
        if (radioValue == '0') {
          return 'You must choose the gender.';
        }
        return null;
      },
      onSaved: (value) {
        widget.callback('Radio', radioValue);
      },
    );
  }
}
