import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  late String name, email, phonenumber, age, city, gender;
  //bool gender = false;

  Homepage(
      {required this.name,
      required this.email,
      required this.phonenumber,
      required this.age,
      required this.city,
      required this.gender});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Login Data'),
        ),
        body: Center(
          child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Text(
                  'Name   :      ${name}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 20),
                Text('Email ID  :  ${email}',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                SizedBox(height: 20),
                Text('Phone No:${phonenumber}',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                SizedBox(
                  height: 20,
                ),
                Text('Age:${age}',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                SizedBox(
                  height: 20,
                ),
                Text('city:${city}',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                SizedBox(
                  height: 20,
                ),
                Text('gender:${gender}',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
              ]),
        ),
      ),
    );
  }
}
