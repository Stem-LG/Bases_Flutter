import 'package:b/b.dart' as b;
import 'package:numerus/numerus.dart';

String convert(String n, base1, base2) {
  if (base1 == "roman") {
    if (n.isValidRomanNumeralValue() != true) {
      return "Invalid Roman Numeral";
    }
    n = n.toRomanNumeralValue().toString();
    base1 = b.base10;
  }
  if (base2 == "roman") {
    n = b.BaseConversion(from: base1, to: b.base10)(n);
    return int.parse(n).toRomanNumeralString()!;
  }
  final b.BaseConversion bases = b.BaseConversion(from: base1, to: base2);
  try {
    return bases(n);
  } catch (e) {
    return "invalid input!!";
  }
}
