import 'dart:math';

const _numbers = "0123456789ABCDEF";

String convert(n, base1, base2) {
  n = base2dec(n, base1);
  n = dec2base(n, base2);
  return n;
}

String dec2base(n, base) {
  var res = "";
  while (n > 0) {
    res = _numbers[n % base] + res;
    n = n ~/ base;
  }
  return res;
}

int base2dec(n, base) {
  var res = 0;
  var j = n.length - 1;
  for (var i = 0; i < n.length; i++) {
    res += _numbers.indexOf(n[i]) * pow(base, j).toInt();
    j -= 1;
  }
  return res;
}

int getbase(base) {
  int _base_code = 10;
  switch (base.toLowerCase()) {
    case "decimal":
      _base_code = 10;
      break;
    case "binary":
      _base_code = 2;
      break;
    case "octal":
      _base_code = 8;
      break;
    case "hexadecimal":
      _base_code = 16;
      break;
  }
  return _base_code;
}

void main() {
  print(convert("9564823554", getbase("Binary"), getbase("Decimal")));
}
