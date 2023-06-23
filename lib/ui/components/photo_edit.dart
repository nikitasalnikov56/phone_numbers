import 'package:flutter/material.dart';
import 'package:flutter_new_test/domain/provider/app_provider.dart';
import 'package:flutter_new_test/ui/themes/app_colors.dart';
import 'package:provider/provider.dart';

class PhotoEdit extends StatelessWidget {
  const PhotoEdit({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final model = context.watch<AppProvider>();
    return Stack(
      alignment: Alignment.center,
      children: [
        model.imageFile == null
            ? GestureDetector(
                onTap: () {
                  model.imagePickerMethod(context);
                },
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.middleGrey,
                    image: DecorationImage(
                      image: AssetImage('assets/images/no_image.png'),
                    ),
                  ),
                ),
              )
            : GestureDetector(
                onTap: () {
                  model.imagePickerMethod(context);
                },
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: CircleAvatar(
                    backgroundImage: FileImage(
                      model.imageFile!,
                    ),
                  ),
                ),
              ),
      ],
    );
  }
}
