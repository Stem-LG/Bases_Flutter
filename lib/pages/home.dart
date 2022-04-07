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
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Wrap(
              spacing: 15,
              alignment: WrapAlignment.center,
              children: [
                SizedBox(
                  width: 250,
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        _invalue = value;
                      });
                    },
                    onSubmitted: (trash) {
                      _result = (convert(_invalue, _base1, _base2));
                      setState(() {});
                    },
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      labelText: 'Enter a number',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Wrap(
                    children: [
                      DropdownButton(
                        value: _base1,
                        items: [
                          "Decimal",
                          "Binary",
                          "Octal",
                          "Hexadecimal",
                          "Roman"
                        ].map((String value) {
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
                      Container(
                          padding: const EdgeInsets.all(10),
                          child:
                              const Text("to", style: TextStyle(fontSize: 20))),
                      DropdownButton(
                        value: _base2,
                        items: [
                          "Decimal",
                          "Binary",
                          "Octal",
                          "Hexadecimal",
                          "Roman"
                        ].map((String value) {
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
                ),
              ],
            ),
            Align(
              child: Container(
                margin: const EdgeInsets.all(15),
                width: 120,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    _result = (convert(_invalue, _base1, _base2));
                    setState(() {});
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
