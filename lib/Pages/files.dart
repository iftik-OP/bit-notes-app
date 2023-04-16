import 'package:bit_app/Pages/viewPdf.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class listFiles extends StatefulWidget {
  final String selectedItem;
  final String selectedSem;

  listFiles({required this.selectedItem, required this.selectedSem});
  @override
  _listFilesState createState() => _listFilesState();
}

class _listFilesState extends State<listFiles> {
  List<String> _fileNames = [];
  List<String> _pdfurls = [];

  final pdfurl = '';

  @override
  void initState() {
    super.initState();
    _getFilesFromFirebaseStorage();
  }

  Future<void> _getFilesFromFirebaseStorage() async {
    final storage = FirebaseStorage.instance;

    final ListResult result = await storage
        .ref('${widget.selectedItem}/${widget.selectedSem}')
        .listAll(); // retrieves all files from root folder

    result.items.forEach((Reference ref) {
      setState(() {
        _fileNames.add(ref.name);
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Storage Files'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _fileNames.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    viewPdf(
                      fileName: _pdfurls[index],
                    );
                  },
                  title: Text(_fileNames[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
