// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';

class Spinner extends StatelessWidget {
  const Spinner({
    Key? key,
    this.color,
  }) : super(key: key);
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return CupertinoActivityIndicator(
      color: color,
    );
  }
}
