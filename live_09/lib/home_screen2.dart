import 'package:flutter/material.dart';

class ButtonScreen2 extends StatefulWidget {
  @override
  _ButtonScreenState2 createState() => _ButtonScreenState2();
}

class _ButtonScreenState2 extends State<ButtonScreen2> {
  String selectedButton = 'S'; // Default selected button
  Map<String, Color> buttonColors = {
    'S': Colors.grey,
    'M': Colors.grey,
  };

  void _updateButtonState(String button) {
    setState(() {
      // Reset all buttons to gray
      buttonColors.forEach((key, value) {
        buttonColors[key] = Colors.grey;
      });

      // Set the selected button to red
      buttonColors[button] = Colors.red;

      // Update selected button
      selectedButton = button;

      // Show dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(child: Text(button)),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Close'),
              ),
            ],
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Size'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _updateButtonState('S');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColors['S'],
              ),
              child: const Text('S'),
            ),
            ElevatedButton(
              onPressed: () {
                _updateButtonState('M');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColors['M'],
              ),
              child: const Text('M'),
            ),
          ],
        ),
      ),
    );
  }
}
