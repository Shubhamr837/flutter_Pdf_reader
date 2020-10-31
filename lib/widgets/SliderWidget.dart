import 'package:flutter/material.dart';
import 'package:pdf_app/StateManagement/PdfController.dart';
import 'package:pdf_app/StateManagement/PdfViewModel.dart';
import 'package:provider/provider.dart' as pro;

class SliderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _controller = pro.Provider.of<PdfController>(context);

    return Expanded(
      child: pro.Consumer<PdfViewModel>(
          builder: (context, controller, _) => Slider(
              value: controller.getCurrentPage(),
              max: controller.getTotalPages().toDouble(),
              min: 0,
              onChanged: (value) {
                _controller.currentPage = value.toInt();
                controller.setCurrentPage(value.toInt(),null);
              })),
    );
  }
}
