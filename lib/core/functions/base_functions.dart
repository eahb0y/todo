import 'dart:core';

class Functions {
  static int getColor(int color) {
    return color == 0xFFf3d1c7
        ? 0xFFEE2B00
        : color == 0xFFf6e2c9
            ? 0xFFEE8F00
            : color == 0xFFc8e7f4
                ? 0xFF056EA1
                : 0xFF009FEE;
  }
}
