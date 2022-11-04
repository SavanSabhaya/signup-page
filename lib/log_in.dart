import 'package:flutter/material.dart';
import 'package:flutter_application_1/signup_page.dart';
import 'package:form_field_validator/form_field_validator.dart';

class Case extends StatelessWidget {
  const Case({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Casepage(),
    );
  }
}

class Casepage extends StatefulWidget {
  const Casepage({super.key});

  @override
  State<Casepage> createState() => _CasepageState();
}

class _CasepageState extends State<Casepage> {
  final _formforkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('log in'),
        ),
        body: Form(
            key: _formforkey,
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 22, right: 22, top: 30, bottom: 10),
                child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: ' User name',
                      hintText: 'email ID ',
                    ),
                    validator: MultiValidator([
                      EmailValidator(errorText: 'Enter valid email address'),
                      RequiredValidator(errorText: 'Enter email'),
                    ])),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 22, right: 22, top: 10),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: ' password',
                    hintText: 'password ',
                  ),
                  validator: RequiredValidator(errorText: 'enter password'),
                ),
              ),
              Row(
                children: [
                  Expanded(
                      child: Padding(
                    padding:
                        const EdgeInsets.only(top: 30, right: 60, left: 60),
                    child: ElevatedButton(
                      child: const Text(
                        'log in',
                        style: TextStyle(fontSize: 18),
                      ),
                      onPressed: () {
                        setState(() {
                          if (_formforkey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('log In sucessfully'),
                            ));
                          }
                        });
                      },
                    ),
                  ))
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(right: 60, left: 60),
                    child: ElevatedButton(
                        onPressed: (() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Screenpage()),
                          );
                        }),
                        child: const Text(
                          'Sign up',
                          style: TextStyle(fontSize: 18),
                        )),
                  )),
                ],
              ),
            ])));
  }
}
