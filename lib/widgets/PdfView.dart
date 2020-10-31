import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:pdf_app/StateManagement/PdfViewModel.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart' as pro;
import 'package:pdf_app/StateManagement/PdfController.dart';

class PdfView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final _controller = pro.Provider.of<PdfViewModel>(context);

    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: <Widget>[
          PDFView(
            filePath: _controller.pdfController.filePath,
            enableSwipe: true,
            swipeHorizontal: true,
            autoSpacing: false,
            pageFling: true,
            pageSnap: true,
            defaultPage: 0,
            fitPolicy: FitPolicy.BOTH,
            preventLinkNavigation: false,
            // if set to true the link is handled in flutter
            onRender: _controller.setTotalPages,
            onError: (error) {
              print(error.toString());
            },
            onPageError: (page, error) {
              print('$page: ${error.toString()}');
            },
            onViewCreated: _controller.complete,
            onLinkHandler: (String uri) {
              print('goto uri: $uri');
            },
            onPageChanged: _controller.setCurrentPage,
          ),
        ],
      ),
    );
  }
}
