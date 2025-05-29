import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: ConverterPage());
  }
}

class ConverterPage extends StatefulWidget {
  const ConverterPage({super.key});

  @override
  State<ConverterPage> createState() => _ConverterPageState();
}

class _ConverterPageState extends State<ConverterPage> {
  String _conversionType = 'fahrenheitToCelsius';
  final TextEditingController _inputController = TextEditingController();
  final TextEditingController _outputController = TextEditingController();
  final List<String> _history = []; // 🟡 History list

  void _convert() {
    final input = double.tryParse(_inputController.text);
    if (input == null) {
      _outputController.text = "Invalid input";
      return;
    }

    double result;
    String conversionLabel;

    if (_conversionType == 'fahrenheitToCelsius') {
      result = (input - 32) * 5 / 9;
      conversionLabel = "F to C";
    } else {
      result = (input * 9 / 5) + 32;
      conversionLabel = "C to F";
    }

    final formattedResult = result.toStringAsFixed(1);
    _outputController.text = formattedResult;

    setState(() {
      _history.insert(
        0,
        "$conversionLabel: ${input.toStringAsFixed(1)} -> $formattedResult",
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text("Converter"),
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Conversion:",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<String>(
                      title: const Text("Fahrenheit to Celsius"),
                      value: 'fahrenheitToCelsius',
                      groupValue: _conversionType,
                      onChanged: (value) {
                        setState(() {
                          _conversionType = value!;
                        });
                      },
                      contentPadding: const EdgeInsets.only(right: 8.0),
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<String>(
                      title: const Text("Celsius to Fahrenheit"),
                      value: 'celsiusToFahrenheit',
                      groupValue: _conversionType,
                      onChanged: (value) {
                        setState(() {
                          _conversionType = value!;
                        });
                      },
                      contentPadding: const EdgeInsets.only(left: 8.0),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _inputController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 14,
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      '=',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: _outputController,
                      readOnly: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _convert,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                      side: const BorderSide(color: Colors.black),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                  ),
                  child: const Text(
                    "Convert",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const SizedBox(height: 8),
              Container(
                height: 150,
                padding: const EdgeInsets.all(8),
                child: _history.isEmpty
                    ? const Text("No conversions yet.")
                    : ListView.builder(
                        itemCount: _history.length,
                        itemBuilder: (context, index) {
                          return Text(_history[index]);
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
