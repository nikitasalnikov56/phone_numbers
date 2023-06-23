import 'package:flutter/material.dart';
import 'package:flutter_new_test/domain/provider/app_provider.dart';
import 'package:provider/provider.dart';

class TextFormWidget extends StatelessWidget {
  const TextFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<AppProvider>();
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        IconButton(
          onPressed: () {
            model.onSearch();
          },
          icon: const Icon(
            Icons.search,
            size: 30,
          ),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 280),
          child: TextField(
            controller: model.searchontroller,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.only(left: 15),
              hintText: 'Country name',
            ),
          ),
        ),
      ],
    );
  }
}
