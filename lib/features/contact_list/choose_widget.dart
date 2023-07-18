import 'package:flutter/material.dart';
import 'package:olinio_test/utils/helpers.dart';

class ChooseWidget extends StatelessWidget {
  const ChooseWidget({super.key, this.isChoosed = false});
  final bool isChoosed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPaddings.all_4Padding,
      decoration: BoxDecoration(
        color: isChoosed ? Colors.blue[200] : Colors.white,
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.check,
      ),
    );
  }
}
