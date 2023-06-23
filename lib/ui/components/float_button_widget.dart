import 'package:flutter/material.dart';
import 'package:flutter_new_test/ui/themes/app_colors.dart';

class FloatButtonWidget extends StatelessWidget {
  const FloatButtonWidget({super.key, required this.text, required this.func});
  final String text;
  final Function func;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 25,
      height: 25,
      child: FloatingActionButton.extended(
        elevation: 0,
        backgroundColor: AppColors.darkBlue,
        onPressed: () {
          func();
        },
        label: Text(text),
      ),
    );
  }
}
