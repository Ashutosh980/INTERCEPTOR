import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:billmart/otp%20page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'model.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
 // 0303190001
  Future<Future> Take() async {
    final  response = await http.post(
      Uri.parse('https://dev-api.billmart.com/access/loginotp'),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
      encoding: Encoding.getByName('utf-8'),
      body: {
        'countryCode':'1',
       'mobileNumber':'0303190001',
        'otpType':'2',
      },
    );
    if (response.statusCode==200 ) {
      return
        //Test.fromJson(json.decode(response.body));
        Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const OtpVerify()),);

        Test.fromJson(json.decode(response.body));

    } else {
      throw Exception('Failed to send data.');
    }
  }

  TextEditingController mobilenumber=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff123466),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 25, 20, 0),
                child: Column(
                  children:[
                  Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sign In",
                      style: TextStyle(
                          color: Colors.deepOrangeAccent, fontSize: 30),
                    ),
                    SizedBox(height: 35),
                    Text(
                      "Easy access to collateral-free capital for ",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "all Kind of Bussiness",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    SizedBox(
                      height: 55,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 20,
                          child:TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red, width: 1.0),
                                    borderRadius: BorderRadius.circular(10)),
                                focusColor: Colors.red,
                                hintText: '+91',
                                filled: true,
                                fillColor: Colors.white),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          child: Flexible(
                            flex: 80,
                            child: TextField(controller: mobilenumber,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red, width: 1.0),
                                      borderRadius: BorderRadius.circular(10)),
                                  focusColor: Colors.red,
                                  hintText: 'Mobile Number',
                                  filled: true,
                                  fillColor: Colors.white),
                            ),
                          ), //flexible
                        ), //container
                      ], //widget
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          labelText: 'Password',
                          hintText: 'Enter Password',
                          filled: true,
                          fillColor: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        GestureDetector(onTap: ()=>Take(),
                          child: Container(
                            child: Center(
                                child: Text(
                              'Sign In with OTP',
                              style: TextStyle(fontSize: 18),
                            )),
                            height: 60,
                            width: (MediaQuery.of(context).size.width)/2-29,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          child: Center(
                              child: Text(
                            'Sign In ',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          )),
                          height: 60,
                          width: (MediaQuery.of(context).size.width)/2-29,
                          decoration: BoxDecoration(
                              color: Colors.deepOrangeAccent,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                        child: Text(
                      "Forgot Password",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    )),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(
                      height: 20,
                      thickness: 3,
                      indent: 20,
                      endIndent: 0,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'New to BillMart ? ',
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                        Text(
                          "Sign Up",
                          style: TextStyle(
                              color: Colors.deepOrangeAccent, fontSize: 22),
                        ),
                      ],
                    ),
                  ],
                  ),
                ])),
          ),
        ));
  }
}
