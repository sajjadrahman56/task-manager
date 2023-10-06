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
    'L': Colors.grey,
    'XL': Colors.grey,
    'XXL': Colors.grey,
    'XXXL': Colors.grey,
  };

  void _updateButtonState(String button) {
    setState(() {
      buttonColors.forEach((key, value) {
        buttonColors[key] = Colors.grey;
      });

      buttonColors[button] = Colors.red;

      selectedButton = button;
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
            Padding(
              padding: const EdgeInsets.all(22.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  ElevatedButton(
                    onPressed: () {
                      _updateButtonState('L');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColors['L'],
                    ),
                    child: const Text('L'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _updateButtonState('XL');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColors['XL'],
                    ),
                    child: const Text('XL'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _updateButtonState('XXL');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColors['XXL'],
                    ),
                    child: const Text('XXL'),
                  ),
                  SizedBox(
                    width: 30.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _updateButtonState('XXXL');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColors['XXXL'],
                    ),
                    child: const Text('XXXL'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
