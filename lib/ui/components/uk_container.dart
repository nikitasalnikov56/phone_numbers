import 'package:flutter/material.dart';
import 'package:flutter_new_test/ui/components/item_title.dart';
import 'package:flutter_new_test/ui/components/uk_phone_list.dart';

class UkContainer extends StatelessWidget {
  const UkContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: Column(
        children: [
          ItemTitle(
            image: 'assets/images/uk.png',
            text: 'United Kingdom',
          ),
          SizedBox(height: 19),
          SizedBox(
            height: 250,
            child: UkPhoneList(),
          ),
        ],
      ),
    );
  }
}