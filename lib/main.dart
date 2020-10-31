import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:pdf_app/StateManagement/PdfController.dart';
import 'package:pdf_app/core/PdfFileService.dart';
import 'package:pdf_app/screens/PdfViewingPage.dart';
import 'StateManagement/PdfViewModel.dart';
import 'package:provider/provider.dart' as prov;
import 'provider_setup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return prov.MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Pdf Reader',
        theme: ThemeData(

          primarySwatch: Colors.red,
        ),
        home: MyHomePage(title: 'Pdf Reader'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;


  void _selectFile(context) async {
    final _pdfView = prov.Provider.of<PdfController>(context,listen: false);
    String path =await _pdfView.pdfFileService.openFileExplorer(context);

    _pdfView.filePath = path;
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => PdfViewingPage()));

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(title),
        ),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Select Pdf File by clicking on floating + button to View")
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed:  () => _selectFile(context),

          child: Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.

    );
  }
}
