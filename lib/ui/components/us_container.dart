import 'package:flutter/material.dart';
import 'package:flutter_new_test/ui/components/item_title.dart';
import 'package:flutter_new_test/ui/components/us_phone_list.dart';

class UsContainer extends StatelessWidget {
  const UsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: Column(
        children: [
          ItemTitle(
            image: 'assets/images/usa.png',
            text: 'United States',
          ),
          SizedBox(height: 19),
          SizedBox(
            height: 250,
            child: USPhoneList(),
          ),
        ],
      ),
    );
  }
}
