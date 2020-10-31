
import 'dart:async';

import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:pdf_app/core/PdfFileService.dart';

class PdfController{

  PdfController({this.pdfFileService});

  PdfFileService pdfFileService;
  int _currentPage=0;
  int _totalPages=1;
  Completer<PDFViewController> _pdfViewController = Completer<PDFViewController>();

  String _filePath;

  String get filePath => _filePath;

  set filePath(String value) {
    _filePath = value;
  }

  Completer<PDFViewController> get pdfViewController => _pdfViewController;


  int get totalPages => _totalPages;

  int get currentPage => _currentPage;

  set currentPage(int page)
  {
    print(page);
    _currentPage=page;
  }

  set totalPages(int pages){
    _totalPages=pages-1;
  }


}