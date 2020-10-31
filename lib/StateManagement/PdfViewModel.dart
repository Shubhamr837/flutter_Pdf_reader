import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:pdf_app/StateManagement/PdfController.dart';

class PdfViewModel extends ChangeNotifier
{
  PdfController pdfController;
  PdfViewModel(this.pdfController);


  void complete(PDFViewController pdfViewController)
  {
    pdfController.pdfViewController.complete(pdfViewController);
  }

  double getCurrentPage()
  {
    return pdfController.currentPage.toDouble();
  }

  void setTotalPages(int pages)
  {
    pdfController.totalPages = pages;
  }

  int getTotalPages()
  {
    return pdfController.totalPages;
  }

  void setCurrentPage(int page,int total)
  {
    pdfController.currentPage = page ;
    notifyListeners();
  }


}