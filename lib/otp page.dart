import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'model.dart';
class OtpVerify extends StatefulWidget {
  const OtpVerify({Key? key}) : super(key: key);
  @override
  _OtpVerifyState createState() => _OtpVerifyState();
}
class _OtpVerifyState extends State<OtpVerify> {
  late String userCode;
  late Map mapResponse;
  //Future<Verify>
  Tak() async {
    final http.Response response = await http.post(
      Uri.parse('https://dev-api.billmart.com/access/verifyotp'),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
      encoding: Encoding.getByName('utf-8'),
      body: {
        'countryCode':'1',
        'referralCode':'1',
        'mobileNumber':'0303190001',
        'otpType':'2',
        'otp':'999999',
        'password':'rHTEwbfHbv6vNHFzbdZXnBryYUL3nA7wIPCoOmeScAosXzXpyASEMCCBabtpsl38HXf6XirUMx2+ymiz0Abl1KFd7AiZ53Y2qQw+cfi8OhUGZFYlt1ag7DeCEJ4e3NH9cmla1FRizOHnSkdcUbDbhTC1mNMhvhM0+es32KUfskjQxsEA89mEuKsuNMMwzI8cLgiEOcjvrH4Kk4vW1dEosKTpCVw9rHo+E7FT9PnMff4+0zhKhI0EFZ5myNV365EpT4tdrxht9UW640xKgc+ADg3lYMaEJhayBEqt7hCbv+E92wgAtrH2xQ7sZZOCn0EDnfDq1dboa1t3RoWx6htjZqpX5iKYpFAe7twwaDck3OdrkbKiR7lMSRZK4ShPuF0LXb5Ax8e8xVwihniZkVZdVRiwMEJMUaC1VVsSfEwJaOszVVEYxZZDedfUlzhaFP2lMl08p7ae71+R0YSTYLQ6JgnwlHD/rNliMu5mSEYsuDAl7qZrvLuNYqJcf96wV1nk1qbgWLFnVTYH89yzv0xWTO3vlyxVFM8SKQJLGnrT0VLYuXsR7MatxJi3tv8Qu7jKe161+VPIyEGsoxXyaPXOtdJW00eHrt1TQf04zarSzP4K5b7Qey7mjLHlodKkjkm2fEH0OpQAOnf1omlwotCEaSm8l3GneHIpaDvTrAh8Ti4='
   },
    );
    if (response.statusCode==200) {
      return  debugPrint(response.body);
setState(() {
  mapResponse=jsonDecode(response.body);
  userCode=mapResponse['access'];
  print(userCode);

});

      // return debugPrint(response.body);response.body.toString();
      //   //Verify.fromJson(json.decode(response.body.toString()));
    } else {
      throw Exception('Failed to send data.');
    }
  }
  // @override
  // void initState() {
  //   Tak();
  //   // TODO: implement initState
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('logo Registration'),),
      body: Column(children: [SizedBox(height: 50,),
        Center(child: Text('OTP Verification',style: TextStyle(color: Colors.deepOrange,fontSize: 26),)),
        SizedBox(height: 50,),
        Center(child: Text('Please enter the 6 digit One Time Password sent to your mobile number',style: TextStyle(fontSize: 16),)),
        Padding(
          padding: const EdgeInsets.fromLTRB(20,60,20,60),
          child: TextField(
    decoration: InputDecoration(
    border: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red, width: 1.0),
    borderRadius: BorderRadius.circular(10)),
    focusColor: Colors.red,
    hintText: '6 digit otp',
    filled: true,
    fillColor: Colors.white),
    ),
        ),
        //Text(userCode),
        GestureDetector(onTap: ()=>Tak(),
          child: Container(
            child: Center(
                child: Text(
                  'Sign In ',
                  style: TextStyle(fontSize: 18),
                )),
            height: 60,
            width: (MediaQuery.of(context).size.width)/2-29,
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(30)),
          ),
        ),
      ],),
    );
  }
}
