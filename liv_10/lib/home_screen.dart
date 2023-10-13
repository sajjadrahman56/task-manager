import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<int> _selectedIndices = [];
  final List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
    'Item 7',
    'Item 8'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selection Screen'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Selected Items'),
                content:
                    Text('No of selected items ${_selectedIndices.length} '),
                actions: <Widget>[
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Close')),
                ],
              );
            },
          );
        },
        child: Icon(Icons.check),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                if (_selectedIndices.contains(index)) {
                  _selectedIndices.remove(index);
                } else {
                  _selectedIndices.add(index);
                }
              });
            },
            child: Container(
              color: _selectedIndices.contains(index) ? Colors.blue : null,
              child: ListTile(
                title: Text(items[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}
