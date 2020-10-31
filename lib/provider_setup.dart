import 'package:pdf_app/StateManagement/PdfController.dart';
import 'package:pdf_app/core/PdfFileService.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumableProviders
];

List<SingleChildWidget> independentServices = [Provider.value(value: PdfFileService())];

List<SingleChildWidget> dependentServices = [
  ProxyProvider<PdfFileService, PdfController>(
    update: (context, pdfFileServ, pdfcontroller) =>
        PdfController(pdfFileService: pdfFileServ),
  )
];

List<SingleChildWidget> uiConsumableProviders = [

];