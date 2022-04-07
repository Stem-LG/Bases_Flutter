import 'dart:math';

const _numbers = "0123456789ABCDEF";

String convert(n, base1, base2) {
  var _cbase1 = getbase(base1);
  var _cbase2 = getbase(base2);
  if (_cbase1 == -1 || _cbase2 == -1) {
    n = "Invalid base!!";
  } else if ((_cbase1 == 10 && RegExp(r'^[0-9]+$').hasMatch(n) == false) ||
      (_cbase1 == 2 && RegExp(r'^[0-1]+$').hasMatch(n) == false) ||
      (_cbase1 == 8 && RegExp(r'^[0-7]+$').hasMatch(n) == false) ||
      (_cbase1 == 16 && RegExp(r'^[0-9A-Fa-f]+$').hasMatch(n) == false)) {
    n = "Invalid input!!";
  } else if (base1 == base2) {
    n = n;
  } else {
    n = n.toUpperCase();
    int nDec = base2dec(n, _cbase1);
    n = dec2base(nDec, _cbase2);
  }
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
  switch (base.toLowerCase()) {
    case "decimal":
    case "dec":
    case "10":
      return 10;
    case "binary":
    case "bin":
    case "2":
      return 2;
    case "octal":
    case "oct":
    case "8":
      return 8;
    case "hexadecimal":
    case "hex":
    case "16":
      return 16;
    case "roman":
    case "rom":
    case 'r':
      return -2;
    default:
      return -1;
  }
}

void main() {
  print(convert("9564823554", getbase("Binary"), getbase("Decimal")));
}
