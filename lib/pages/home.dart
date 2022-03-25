import 'package:flutter/material.dart';
import '../tools/converter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _invalue = "";
  var _base1 = "Decimal";
  var _base2 = "Binary";
  var _result = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Wrap(
          spacing: 15,
          children: [
            SizedBox(
              width: 200,
              child: Center(
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      _invalue = value;
                    });
                  },
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    labelText: 'TextField',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            DropdownButton(
              value: _base1,
              items: ["Decimal", "Binary", "Octal", "Hexadecimal"]
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newvalue) {
                setState(() {
                  _base1 = newvalue!;
                });
              },
            ),
            DropdownButton(
              value: _base2,
              items: ["Decimal", "Binary", "Octal", "Hexadecimal"]
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newvalue) {
                setState(() {
                  _base2 = newvalue!;
                });
              },
            ),
          ],
        ),
        Container(
          width: 120,
          height: 40,
          margin: const EdgeInsets.only(top: 10),
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                _result = (convert(_invalue, getbase(_base1), getbase(_base2)));
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Icon(Icons.cached_rounded),
                Text("Convert"),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SelectableText(
          "Result:\n$_result",
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20),
        ),
      ]),
    );
  }
}
