import 'package:flutter/cupertino.dart';

class CustomLoadingWidget extends StatelessWidget {
  final Color? color;
  final double? radius;

  const CustomLoadingWidget({super.key, this.color, this.radius});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CupertinoActivityIndicator(
          color: color,
          radius: radius ?? 10,
        ),
      ],
    );
  }
}
