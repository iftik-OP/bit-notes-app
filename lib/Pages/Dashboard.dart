import 'package:bit_app/Pages/files.dart';
import 'package:flutter/material.dart';

class dashboard extends StatefulWidget {
  const dashboard({super.key});

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  String? _selectedItem = 'CSE';
  String? _selectedSem = 'First';
  List<String> items = [
    'CSE',
    'ECE',
    'BCA',
    'BBA',
    'EEE',
    'MBA',
  ];
  List<String> sems = [
    'First',
    'Second',
    'Third',
    'Fourth',
    'Fifth',
    'Sixth',
    'Seventh',
    'Eighth'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Branch'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 100),
              Text(
                'Choose Branch: ',
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 200,
                child: DropdownButton(
                  value: _selectedItem,
                  items: items
                      .map((item) =>
                          DropdownMenuItem(value: item, child: Text(item)))
                      .toList(),
                  onChanged: (item) => setState(
                    () {
                      _selectedItem = item;
                    },
                  ),
                ),
              ),
              SizedBox(height: 50),
              Text(
                'Choose Semester: ',
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 200,
                child: DropdownButton(
                  value: _selectedSem,
                  items: sems
                      .map((itemsem) => DropdownMenuItem(
                          value: itemsem, child: Text(itemsem)))
                      .toList(),
                  onChanged: (itemsem) => setState(
                    () {
                      _selectedSem = itemsem;
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => listFiles(
                              selectedItem: _selectedItem!,
                              selectedSem: _selectedSem!,
                            )),
                      ),
                    ),
                  },
                  child: Text('Continue'),
                ),
              ),
              SizedBox(
                height: 280,
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'Made with ❤️ By Iftikhar',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
