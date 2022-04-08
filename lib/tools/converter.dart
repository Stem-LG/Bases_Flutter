import 'package:b/b.dart';

String convert(n, base1, base2) {
  final BaseConversion bases = BaseConversion(from: base1, to: base2);
  try {
    return bases(n);
  } catch (e) {
    return "invalid input!!";
  }
}
