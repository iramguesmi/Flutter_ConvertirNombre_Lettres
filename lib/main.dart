import 'package:flutter/material.dart';
import 'package:number_to_word_arabic/number_to_word_arabic.dart';
import 'package:number_to_words_english/number_to_words_english.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ArabicConverterScreen(),
    );
  }
}



class ArabicConverterScreen extends StatefulWidget {
  @override
  _ArabicConverterScreenState createState() => _ArabicConverterScreenState();
}

class _ArabicConverterScreenState extends State<ArabicConverterScreen> {
  TextEditingController _numberController = TextEditingController();
  String _result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Convertir Number'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _numberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter a number'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                convertToEnglish();
              },
              child: Text('Convert to English'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                convertToArabic();
              },
              child: Text('Convert to Arabic'),
            ),
            SizedBox(height: 16.0),
            Text('Result: $_result'),
          ],
        ),
      ),
    );
  }

void convertToEnglish() {}

  /*void convertToEnglish() {
  List<String> parts = _numberController.text.split(',');

  if (parts.length == 2) {
    // Convert the integer part to English words
    double? integerPart = double.tryParse(parts[0]);
    String integerWords = integerPart != null
        ? Tafqeet.convert(integerPart.toStrin())
        : "Invalid integer part";

    // Convert the fractional part to English words
    double? fractionalPart = double.tryParse(parts[1]);
    String fractionalWords = fractionalPart != null
        ? Tafqeet.convert(fractionalPart.toString())
        : "Invalid fractional part";

    // Display the result
    setState(() {
      _result = "$integerWords dollars and $fractionalWords cents";
    });
  } else if (parts.length == 1) {
    // Convert the entire input to English words (as a string)
    String? input = _numberController.text;
    String words = input != null ? Tafqeet.convert(input) : "Invalid input";

    // Display the result
    setState(() {
      _result = words;
    });
  } else {
    // Handle invalid input
    setState(() {
      _result = "Invalid input";
    });
  }
}*/

  void convertToArabic() {
     List<String> parts = _numberController.text.split(',');

    if (parts.length == 2) {
      // Convert the integer part to Arabic words
      double? integerPart = double.tryParse(parts[0]);
      String integerWords = integerPart != null
          ? Tafqeet.convert(integerPart.toString())
          : "Invalid integer part";

      // Convert the fractional part to Arabic words
      double? fractionalPart = double.tryParse(parts[1]);
      String fractionalWords = fractionalPart != null
          ? Tafqeet.convert(fractionalPart.toString())
          : "Invalid fractional part";

      // Display the result
      setState(() {
        _result = "$integerWords دينار و $fractionalWords مليم ";
      });
    } else if (parts.length == 1) {
      // Convert the entire input to Arabic words (as a string)
      String? input = _numberController.text;
      String words = input != null ? Tafqeet.convert(input) : "Invalid input";

      // Display the result
      setState(() {
        _result = words;
      });
    } else {
      // Handle invalid input
      setState(() {
        _result = "Invalid input";
      });
    }
  }

}