import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class viewPdf extends StatefulWidget {
  const viewPdf({super.key});

  @override
  State<viewPdf> createState() => _viewPdfState();
}

class _viewPdfState extends State<viewPdf> {
  @override
  Widget build(BuildContext context) {
    return PDFView();
  }
}