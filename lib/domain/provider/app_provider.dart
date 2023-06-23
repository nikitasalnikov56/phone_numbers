import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_new_test/ui/components/uk_container.dart';
import 'package:flutter_new_test/ui/components/us_container.dart';
import 'package:flutter_new_test/ui/pages/calls_page.dart';
import 'package:flutter_new_test/ui/pages/contacts_page.dart';
import 'package:flutter_new_test/ui/pages/home_page.dart';
import 'package:flutter_new_test/ui/pages/message_page.dart';
import 'package:image_picker/image_picker.dart';

class AppProvider extends ChangeNotifier {
  AppProvider();

  List<Widget> screens = [
    const HomePage(),
    const CallsPage(),
    const MessagesPage(),
    const ContactsPage(),
  ];

  int curIndex = 0;
  changScreens(int index) {
    curIndex = index;
    notifyListeners();
  }

  //search controller
  final searchontroller = TextEditingController();

  //tabs
  List<String> str = [
    'SMS',
    'MMS',
    'Voice',
  ];
  int thisIndex = 0;
  tabsIndex(int index) {
    thisIndex = index;
    notifyListeners();
  }

  //dropdown items
  final List<String> items = [
    'Landline or Mobile',
    'Landline',
    'Mobile',
  ];
  String? selectedValue;
  changeValue(String? val) {
    selectedValue = val;
    notifyListeners();
  }

  //checkbox
  bool isChecked = false;

  checkValue(bool? val) {
    isChecked = val ?? false;
    notifyListeners();
  }

  //us phones list
  List<String> usPhones = [
    '+1(201)123-45-67',
    '+1(201)123-45-67',
    '+1(201)123-45-67',
  ];
  List<String> ukPhones = [
    '+44(201)123-45-67',
    '+44(201)123-45-67',
    '+44(201)123-45-67',
  ];

  List<String> towns = [
    'New Jersey',
    'New Jersey',
    'New Jersey',
  ];

  //pick image
  File? imageFile;
  final imagePicker = ImagePicker();
  String path = '';

  Future imagePickerMethod(BuildContext context) async {
    final pick = await imagePicker.pickImage(source: ImageSource.camera);

    if (pick != null) {
      path = pick.path;

      imageFile = File(path);
    } else {
      // ignore: use_build_context_synchronously
      showSnackBar(
          'No file selected', const Duration(milliseconds: 500), context);
    }
    notifyListeners();
  }

  showSnackBar(String snackText, Duration duration, BuildContext context) {
    final snackBar = SnackBar(
      content: Text(snackText),
      duration: duration,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Widget showItems() {
    if (selectedValue == 'Landline or Mobile' &&
        isChecked == true &&
        str[thisIndex] == 'MMS' &&
        searchontroller.text == '') {
      return const Column(
        children: [
          UsContainer(),
          SizedBox(height: 20),
          UkContainer(),
        ],
      );
    } else if (searchontroller.text.toLowerCase() ==
            'United States'.toLowerCase() &&
        str[thisIndex] == 'MMS' &&
        isChecked == true) {
      return const UsContainer();
    } else if (searchontroller.text.toLowerCase() ==
            'United Kingdom'.toLowerCase() &&
        str[thisIndex] == 'MMS' &&
        isChecked == true) {
      return const UkContainer();
    } else {
      return const SizedBox();
    }
  }

  onSearch() async {
    showItems();
    notifyListeners();
  }
}
