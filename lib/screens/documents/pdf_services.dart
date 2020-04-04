import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class PdfServices{

  //downloading file into the device
  Future<File> getFileFromUrl(String url,String docName)async{
    try{
      print("entered");
      print(url);
      final filename = "mypdf.pdf";
      var response = await http.get(url);
      if(response.statusCode == 200){
        print("got data sucessfully");
        print(response.body);
      }
      var bytes = response.bodyBytes;
      String dir = (await getApplicationDocumentsDirectory()).path;
      File file = File('$dir/$filename');
      File urlFile = await file.writeAsBytes(bytes);
      return urlFile;
    }catch(e){
      print("got error");
      print(e.toString());
      return null;

    }

  }  

}