import 'package:flutter/material.dart';
import 'package:flutter_new_test/domain/provider/app_provider.dart';
import 'package:flutter_new_test/ui/components/float_button_widget.dart';
import 'package:flutter_new_test/ui/themes/app_colors.dart';
import 'package:provider/provider.dart';

class USPhoneList extends StatelessWidget {
  const USPhoneList({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<AppProvider>();
    return Container(
      padding: const EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 20),
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
      child: ListView.builder(
          itemBuilder: (context, i) {
            return ListTile(
              contentPadding: const EdgeInsets.all(0),
              leading: const Icon(Icons.phone_android_rounded),
              title: Text(
                model.usPhones[i],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                model.towns[i],
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: SizedBox(
                width: 55,
                child: Row(
                  children: [
                    FloatButtonWidget(
                      text: 'S',
                      func: () {},
                    ),
                    const SizedBox(width: 5),
                    FloatButtonWidget(
                      text: 'V',
                      func: () {},
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: model.usPhones.length),
    );
  }
}
