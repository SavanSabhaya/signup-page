import 'package:flutter/material.dart';
import 'package:flutter_application_1/component.dart/checkbox.dart';
import 'package:flutter_application_1/homepage.dart';

import 'package:form_field_validator/form_field_validator.dart';

// class Screen extends StatelessWidget {
//   const Screen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Screenpage(),
//     );
//   }
// }

class Screenpage extends StatefulWidget {
  const Screenpage({super.key});

  @override
  State<Screenpage> createState() => ScreenpageState();
}

//int _value = 0;

class ScreenpageState extends State<Screenpage> {
  void _toggle() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  void _show() {
    setState(() {
      wrong = !wrong;
    });
  }

  Map<String, String> fieldValues = {};
  setFieldValue(label, value) {
    fieldValues[label] = value;
  }

  final List<String> items = [
    'Ahmedabad',
    'Surat',
    'Vadodara',
    'Gandhinagar',
    'Junagadh',
    'Bhavnagar',
    'Jamnagar',
    'Patan',
    'Bharuch',
    'Navsari',
    'Anand',
    'Porbandar',
    'Amreli',
    'Mehsana',
    'Valsad',
    'Dahod',
    'Morbi',
    'Surendranagar',
    'Bhuj',
    'Botad',
    'Nadiad',
    'Veraval',
    'Gandhidham',
    'Palanpur',
    'Godhra',
    'Vapi',
    'Ankleshwar',
    'Mandvi',
    'Gondal',
    'Deesa',
    'Jetpur',
    'Balasinor',
    'Jabalpur',
    'Kalol',
    'Amravati',
    'Ujjain',
    'Saharanpur'
  ];

  String? selectedValue;

  bool obscureText = true;
  bool wrong = true;
  bool value = false;
  bool checkboxValue = false;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phonenumber = TextEditingController();
  TextEditingController Password = TextEditingController();
  TextEditingController ConfirmPassword = TextEditingController();
  TextEditingController valueTextController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  String dropdownvalue = '';
  double _currentSliderValue = 0;
  String gender = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Sign up"),
        ),
        body: ListView(children: [
          Form(
            autovalidateMode: AutovalidateMode.always,
            key: _formkey,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(6),
                      child: TextFormField(
                        controller: name,
                        onSaved: (newValue) {},
                        focusNode: FocusNode(),
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'plaese enter name';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('name'),
                          hintText: "enter name",
                          prefixIcon: Padding(
                            padding:
                                EdgeInsetsDirectional.only(start: 6.0, end: 6),
                            child: Icon(Icons.person),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6),
                      child: TextFormField(
                        controller: email,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        validator: MultiValidator([
                          EmailValidator(errorText: 'enter valid email'),
                          RequiredValidator(errorText: ' Email required'),
                        ]),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('Email'),
                          hintText: "Email",
                          prefixIcon: Padding(
                            padding:
                                EdgeInsetsDirectional.only(start: 6, end: 6),
                            child: Icon(Icons.email),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6),
                      child: TextFormField(
                        controller: phonenumber,
                        textInputAction: TextInputAction.next,
                        maxLength: 10,
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'phone number required';
                          } else if (value.length != 10) {
                            return ' invalid number';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('Phone Number'),
                          hintText: "Number",
                          prefixIcon: Padding(
                            padding:
                                EdgeInsetsDirectional.only(start: 6.0, end: 6),
                            child: Icon(Icons.phone),
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      'Gender',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                    ),
                    RadioListTile(
                      title: Text("Male"),
                      value: "male",
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value!;
                        });
                      },
                    ),
                    RadioListTile(
                      title: Text("Female"),
                      value: "female",
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value!;
                        });
                      },
                    ),
                    RadioListTile(
                      title: Text("Others"),
                      value: "other",
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value!;
                        });
                      },
                    ),
                    const Text(
                      'Age',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                    ),
                    Slider(
                      value: _currentSliderValue,
                      min: 0,
                      max: 100,
                      divisions: 100,
                      label: _currentSliderValue.round().toString(),
                      onChanged: (value) {
                        print('value');
                        setState(() {
                          _currentSliderValue = value;
                          valueTextController.text = value.toString();
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6),
                      child: TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                            hintText: 'Enter age',
                            labelText: 'Age',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                        controller: valueTextController,
                        validator: (value) {
                          if (_currentSliderValue == 0) {
                            return 'Enter age';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6),
                      child: DropdownButtonFormField(
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                          hint: const Text(
                            'select city',
                            style: TextStyle(fontSize: 14),
                          ),
                          items: items
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ))
                              .toList(),
                          value: selectedValue,
                          onChanged: (value) {
                            setState(() {
                              dropdownvalue = value.toString();
                            });
                          },
                          validator: (value) {
                            if (dropdownvalue == '') {
                              return 'please select city';
                            }
                            return null;
                          }),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(6),
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          maxLength: 12,
                          obscureText: obscureText,
                          controller: Password,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: 'password',
                            hintText: 'password',
                            prefixIcon: const Padding(
                              padding: EdgeInsetsDirectional.only(start: 12.0),
                              child: Icon(Icons.lock),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: _toggle,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'plaese enter Password';
                            }
                            return null;
                          },
                        )),
                    Padding(
                      padding: const EdgeInsets.all(6),
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        obscureText: wrong,
                        controller: ConfirmPassword,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'Confirm Pasword',
                          hintText: "password",
                          prefixIcon: const Padding(
                            padding: EdgeInsetsDirectional.only(start: 12),
                            child: Icon(Icons.lock),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              wrong ? Icons.visibility : Icons.visibility_off,
                            ),
                            onPressed: _show,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'confirm Password';
                          }
                          print(Password.text);
                          print(ConfirmPassword.text);
                          if (Password.text != ConfirmPassword.text) {
                            return 'password does not match';
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    CheckboxFormField(callback: setFieldValue),
                    ElevatedButton(
                      autofocus: true,
                      child: Text('Submit'),
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return Homepage(
                                  name: name.text,
                                  email: email.text,
                                  phonenumber: phonenumber.text,
                                  age: valueTextController.text,
                                  city: dropdownvalue.toString(),
                                  gender: gender.toString(),
                                );
                              },
                            ),
                          );
                          // Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('submit'),
                            duration: Duration(seconds: 2),
                          ));
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('please check the detail'),
                            duration: Duration(seconds: 2),
                          ));
                        }
                      },
                    ),
                  ]),
            ),
          ),
        ]),
      ),
    );
  }
}
