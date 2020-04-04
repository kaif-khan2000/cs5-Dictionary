import 'dart:io';

import 'package:cs5_dictionary/screens/documents/pdf_services.dart';
import 'package:cs5_dictionary/sharable/loading.dart';
import 'package:flutter/material.dart';
//import 'dart:io' as io;
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';
class OpenPdf extends StatefulWidget {
  final String url;
  final String docName;
  OpenPdf({this.url,this.docName});
  @override
  _OpenPdfState createState() => _OpenPdfState(url:url,docName:docName);
}

class _OpenPdfState extends State<OpenPdf> {
  final PdfServices _pdfService = PdfServices();
  final String url;
  final String docName;
  String path;
  bool loading = true;
  _OpenPdfState({this.url,this.docName});
  @override
  void initState()  {
    // TODO: implement initState
    super.initState();
    downloadFile();
    
  }
  void downloadFile() async {
    
    try{
      await _pdfService.getFileFromUrl(url,docName).then((f){
        setState(() {
          path = f.path;
          loading = false;
        });
        print(path);
        
      });
    }catch(e){
      print(e.toString());
    }

  }
  @override
  Widget build(BuildContext context) {
    return loading ? Loading():Scaffold(
        appBar: AppBar(
          title: Text("Document"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () {},
            ),
          ],
        ),
        body: PdfViewer(filePath: path,),
    );
  }
}