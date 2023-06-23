import 'package:flutter/material.dart';
import 'package:flutter_new_test/domain/provider/app_provider.dart';
import 'package:flutter_new_test/ui/themes/app_colors.dart';
import 'package:provider/provider.dart';

class CheckBoxWidget extends StatelessWidget {
  const CheckBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<AppProvider>();
    return Row(
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.darkBlue,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Checkbox(
            fillColor: MaterialStateProperty.all(AppColors.whiteColor),
            checkColor: AppColors.darkBlue,
            value: model.isChecked,
            onChanged: (value) {
              model.checkValue(value);
            },
          ),
        ),
        const SizedBox(width: 16),
        const Text(
          'Show numbers eithout verification',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
