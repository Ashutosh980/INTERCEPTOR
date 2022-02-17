import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'model.dart';

final originalName = 'BillMart_VAN HUESAN_DirAS_Undertaking (1) (4).pdf';
//Future<Welcome>
createAlbum() async {
  final http.Response response = await http.post(
    Uri.parse('https://dev-api.billmart.com/file/upload'),
    headers: <String, String>{
      'authorization':'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjExNTAsInJvbGUiOjIsImlkIjoiZTk3MmM1Y2ZlYmY3MWU4YyIsInZlcnNpb24iOiIwLjAuMSIsImlhdCI6MTY0NTA5OTEyMCwiZXhwIjoxNjQ1MDk5MjQwfQ.L2ND96NRM7MCOMTSUicfHJzEbIi4eU8-lyyiJ3tq84Y',
      //'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjExNTAsInJvbGUiOjIsImlkIjoiNmU0MjY3NmU2ZDAwYTFlYSIsInZlcnNpb24iOiIwLjAuMSIsImlhdCI6MTY0NTA5MDg2NywiZXhwIjoxNjQ1MDkwOTg3fQ.SNZu4QSL1dNCEr6s80h9yC4Qmkr7GZwYoWboK_AytZA',
      // 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjcxMCwicm9sZSI6MiwiaWF0IjoxNjQzOTY2ODA3LCJleHAiOjE2NDc1NjY4MDd9.kzT0SxMTKuQtGK8l9sge8ehdLb2UVVYHDaJjQCLqr7k',
      // 'Content-Type': 'application/json; charset=UTF-8',
      'nIUCd':'1150',
      'role':'2'
    },
    body: jsonEncode(<String, dynamic>{
      'file': '073cb263-4a1c-4a26-8ebb-b0dbcb05949a.pdf',
      // 'originalName': originalName,
      'type': '${1.toInt()}',
      // 'mimeType': 'application/pdf',
    }),
  );
  if (response.body!=null) {
    print(response.body);
    //return Welcome.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to create album.');
  }
}

void main() async {

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  _MyAppState createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _controller = TextEditingController();
  Future<Welcome>? _futureAlbum;
  var Url;
  String originalName = 'BillMart_VAN HUESAN_DirAS_Undertaking (1) (4).pdf';
  bool downloading = false;
  var progressString = "";

  @override
  Widget build(BuildContext context) {

    // Future<void> downloadFile(String url) async {
    //   Dio dio = Dio();
    //   try {
    //     var dir = await getExternalStorageDirectory();
    //     print('external:${dir}');
    //     //await
    //     // dio.download(url, "/storage/emulated/1/BillMart/A/B/$originalName",
    //     await dio.download(url, "${dir!.path}/$originalName",
    //         onReceiveProgress: (rec, total) {
    //           setState(() {
    //             downloading = true;
    //             progressString = ((rec / total) * 100).toStringAsFixed(0) + "%";
    //             print(progressString);
    //           });
    //         });
    //   } catch (e) {
    //     print(e);
    //   }
    //
    //   setState(() {
    //     downloading = false;
    //     progressString = "Completed";
    //   });
    //
    //   showTopSnackBar(
    //     context,
    //     CustomSnackBar.success(
    //       message:
    //       "File Saved",
    //     ),
    //   );
    //   print("Download completed");
    // }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Creating Data',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Post Method Test'),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: (_futureAlbum == null)
              ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text('Post Data'),
                onPressed: () {
                  setState(() {
                    _futureAlbum = createAlbum();
                  });
                },
              ),
            ],
          )
              : FutureBuilder<Welcome>(
            future: _futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                print(snapshot.data!.result);
                return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: GestureDetector(
                            child: Icon(
                              Icons.download,
                              color: Colors.blue,
                            ),
                            onTap: () async {

                              //await downloadFile(snapshot.data!.result);
                              {
                                Text(
                                  progressString,
                                  style: TextStyle(color: Colors.white),
                                );
                              }
                            }),
                      )
                    ]);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }

}

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));
String welcomeToJson(Welcome data) => json.encode(data.toJson());
class Welcome {
  Welcome({
    required this.errorMessage,
    required this.result,
    required this.status,
  });
  String errorMessage;
  String result;
  int status;
  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    errorMessage: json["errorMessage"],
    result: json["result"],
    status: json["status"],
  );
  Map<String, dynamic> toJson() => {
    "errorMessage": errorMessage,
    "result": result,
    "status": status,
  };
}
