// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cs_100/shared/enums/spinner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class Spinner extends StatelessWidget {
  const Spinner({
    Key? key,
    this.size,
    this.color,
  }) : super(key: key);
  final SpinnerSize? size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    double spinSize = 50;
    if (size == SpinnerSize.sm) {
      spinSize = 20;
    } else if (size == SpinnerSize.md) {
      spinSize = 30;
    } else if (size == SpinnerSize.lg) {
      spinSize = 60;
    }

    return SpinKitDoubleBounce(
      color: color ?? Get.theme.colorScheme.primaryContainer,
      size: spinSize,
    );
  }
}
