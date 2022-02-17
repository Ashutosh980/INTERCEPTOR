import 'dart:js';

import 'package:flutter/material.dart';
void main() => runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const String _title = 'Flutter Code Sample';
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: MyStatelessWidget(),
    );
  }
}
class MyStatelessWidget extends StatelessWidget {

  const MyStatelessWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
   //   appBar: AppBar(title: const Text('LayoutBuilder Example')),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 600) {
            return _buildWideContainers();
          } else {
            return _buildNormalContainer();
          }
        },
      ),
    );
  }
  Widget _buildNormalContainer() {
    TextEditingController mobilenumber=TextEditingController();
    return Scaffold(
        backgroundColor: Color(0xff123466),
        body: SafeArea(
          child: OverflowBox(
            child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 25, 20, 0),
                child: Column(
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
                              Expanded(
                                child: GestureDetector(onTap: ()=>{},
                                  child: Container(
                                    child: Center(
                                        child: Text(
                                          'Sign In with OTP',
                                          style: TextStyle(fontSize: 18),
                                        )),
                                    height: 60,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10)),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Container(
                                  child: Center(
                                      child: Text(
                                        'Sign In ',
                                        style: TextStyle(color: Colors.white, fontSize: 18),
                                      )),
                                  height: 60,
                                  decoration: BoxDecoration(
                                      color: Colors.deepOrangeAccent,
                                      borderRadius: BorderRadius.circular(10)),
                                ),
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
                    ),
                    ),
          ),
    );
  }
}
  Widget _buildWideContainers() {
    TextEditingController mobilenumber=TextEditingController();
    return Scaffold(
        backgroundColor: Color(0xff123466),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 25, 20, 0),
                child: Column(
                    children:[ Row(
                        children:[
                          Expanded(child: Image.asset('assets/Untitled.png')),
                          Expanded(
                            child: Column(
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
                                        child: TextField(
                                          controller: mobilenumber,
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
                                    Expanded(child: Container(
                                      child: Center(
                                          child: Text(
                                            'Sign In with OTP',
                                            style: TextStyle(fontSize: 18),
                                          )),
                                      height: 60,
                                      //width: 22,
                                      //(double.maxFinite)/4-29,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(10)),
                                    ),),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      child: Container(
                                        child: Center(
                                            child: Text(
                                              'Sign In ',
                                              style: TextStyle(color: Colors.white, fontSize: 18),
                                            )),
                                        height: 60,
                                        //width:22,
                                        //(double.maxFinite)/4-29,
                                        decoration: BoxDecoration(
                                            color: Colors.deepOrangeAccent,
                                            borderRadius: BorderRadius.circular(10)),
                                      ),
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
                          ),
                        ]),
                    ])),
          ),
        ));
  }

