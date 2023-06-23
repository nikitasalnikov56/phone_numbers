import 'package:flutter/material.dart';
import 'package:flutter_new_test/domain/provider/app_provider.dart';
import 'package:flutter_new_test/ui/themes/app_colors.dart';
import 'package:provider/provider.dart';

class DropDownMenu extends StatelessWidget {
  const DropDownMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<AppProvider>();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.darkBlue),
        borderRadius: BorderRadius.circular(15),
      ),
      child: DropdownButton(
        borderRadius: BorderRadius.circular(15),
        isExpanded: true,
        underline: const Divider(
          color: Colors.transparent,
        ),
        hint: const Text(
          'Select Item',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        items: model.items
            .map(
              (String item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: const TextStyle(fontSize: 14),
                ),
              ),
            )
            .toList(),
        value: model.selectedValue,
        onChanged: (String? value) {
          model.changeValue(value);
        },
        // buttonStyleData: ButtonStyleData(
        //   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
        //   height: 50,
        //   width: double.infinity,
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(15),
        //     border: Border.all(
        //       color: AppColors.darkBlue,
        //     ),
        //   ),
        // ),
        // iconStyleData: const IconStyleData(
        //   icon: Icon(
        //     Icons.keyboard_arrow_down_outlined,
        //   ),
        //   iconSize: 25,
        //   iconEnabledColor: AppColors.darkBlue,
        //   iconDisabledColor: AppColors.darkBlue,
        // ),
        // dropdownStyleData: const DropdownStyleData(
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.only(
        //       bottomLeft: Radius.circular(15),
        //       bottomRight: Radius.circular(15),
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
