import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class viewPdf extends StatefulWidget {
  final fileName;

  viewPdf({required this.fileName});

  @override
  State<viewPdf> createState() => _viewPdfState();
}



class _viewPdfState extends State<viewPdf> {
  PdfViewerController? _pdfViewerController;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF View'),
      ),
      body: SfPdfViewer.network(
        widget.fileName,
        controller: _pdfViewerController,
      ),
    );
  }
}
