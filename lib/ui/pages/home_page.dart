import 'package:flutter/material.dart';
import 'package:flutter_new_test/domain/provider/app_provider.dart';
import 'package:flutter_new_test/ui/components/container_items_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 16, right: 16),
      child: ListView(
        children: [
          const ContainerItemsWidget(),
          const SizedBox(height: 20),
          Consumer(
            builder: (context, AppProvider model, _) {
              return model.showItems();
            },
          ),
        ],
      ),
    );
  }
}
