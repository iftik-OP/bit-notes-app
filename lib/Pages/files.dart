import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

class listFiles extends StatefulWidget {
  @override
  _listFilesState createState() => _listFilesState();
}

class _listFilesState extends State<listFiles> {
  List<String> _fileNames = [];

  @override
  void initState() {
    super.initState();
    _getFilesFromFirebaseStorage();
  }

  Future<void> _getFilesFromFirebaseStorage() async {
    final storage = FirebaseStorage.instance;
    final ListResult result =
        await storage.ref().listAll(); // retrieves all files from root folder

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
