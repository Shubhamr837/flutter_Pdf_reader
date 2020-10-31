import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';


class PdfFileService {

  Future<String> openFileExplorer(context) async {
    try {
      FilePickerResult result = await FilePicker.platform.pickFiles(
        type: FileType.custom, allowedExtensions: ['pdf'],);
      if (result != null) {
        return result.files.single.path;

      }
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    }
  }
}