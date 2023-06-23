import 'package:flutter/material.dart';
import 'package:flutter_new_test/domain/provider/app_provider.dart';
import 'package:flutter_new_test/ui/components/check_box_widget.dart';
import 'package:flutter_new_test/ui/components/dropdown_menu.dart';
import 'package:flutter_new_test/ui/components/text_form_widget.dart';
import 'package:flutter_new_test/ui/themes/app_colors.dart';
import 'package:provider/provider.dart';

class ContainerItemsWidget extends StatelessWidget {
  const ContainerItemsWidget({
    super.key,

  });


  @override
  Widget build(BuildContext context) {
     final model = context.watch<AppProvider>();
    return Container(
      padding:
          const EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 20),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(25),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadowColor,
            blurRadius: 8,
            spreadRadius: 0,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          const TextFormWidget(),
          const SizedBox(height: 16),
          SizedBox(
            height: 35,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: model.str.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    model.tabsIndex(index);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 10),
                    decoration: BoxDecoration(
                      color: model.thisIndex == index
                          ? AppColors.tabsGreyColor
                          : AppColors.tabsColor,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Text(
                      model.str[index],
                      style: const TextStyle(color: AppColors.whiteColor),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) =>
                  const SizedBox(width: 16),
            ),
          ),
          const SizedBox(height: 20),
          const DropDownMenu(),
          const SizedBox(height: 20),
          const CheckBoxWidget(),
        ],
      ),
    );
  }
}
