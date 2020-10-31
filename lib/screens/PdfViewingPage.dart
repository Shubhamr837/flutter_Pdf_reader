import 'package:flutter/material.dart';
import 'package:pdf_app/StateManagement/PdfViewModel.dart';
import 'package:pdf_app/widgets/PdfView.dart';
import 'package:pdf_app/widgets/SliderWidget.dart';
import 'package:provider/provider.dart' as pro;

class PdfViewingPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return pro.ChangeNotifierProvider<PdfViewModel>.value(
      value: PdfViewModel(pro.Provider.of(context)),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Pdf Reader"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              PdfView(),
              SliderWidget(),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
