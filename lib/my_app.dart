import 'package:flutter/material.dart';
import 'package:flutter_new_test/domain/provider/app_provider.dart';
import 'package:flutter_new_test/ui/components/icon_items.dart';
import 'package:flutter_new_test/ui/components/photo_edit.dart';
import 'package:flutter_new_test/ui/themes/app_colors.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    double height = 80;
    return ChangeNotifierProvider(
      create: (context) => AppProvider(),
      child: MaterialAppWidget(width: width, height: height),
    );
  }
}

class MaterialAppWidget extends StatelessWidget {
  const MaterialAppWidget({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    final model = context.watch<AppProvider>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: const Drawer(
          backgroundColor: AppColors.lightPink,
        ),
        backgroundColor: AppColors.lightPink,
        appBar: PreferredSize(
          preferredSize: Size(width, height),
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.bottomCenter,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PhotoEdit(),
                  IconItems(),
                ],
              )),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColors.lightPink,
          elevation: 0,
          selectedItemColor: AppColors.darkBlue,
          unselectedItemColor: AppColors.middleGrey,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          currentIndex: model.curIndex,
          onTap: (index) {
            model.changScreens(index);
          },
          items: const [
            BottomNavigationBarItem(
                backgroundColor: AppColors.lightPink,
                icon: Icon(Icons.home),
                label: 'Home'),
            BottomNavigationBarItem(
                backgroundColor: AppColors.lightPink,
                icon: Icon(Icons.call_outlined),
                label: 'Calls'),
            BottomNavigationBarItem(
                backgroundColor: AppColors.lightPink,
                icon: SvgIcon(
                  icon: SvgIconData('assets/icons/mail.svg'),
                ),
                label: 'Messages'),
            BottomNavigationBarItem(
                backgroundColor: AppColors.lightPink,
                icon: Icon(Icons.person_outline),
                label: 'Contacts'),
          ],
        ),
        body: model.screens[model.curIndex],
      ),
    );
  }
}


