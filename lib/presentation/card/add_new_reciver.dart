import 'package:flutter/material.dart';

import '../../core/common_widget/primary_appbar.dart';

class AddNewReciver extends StatelessWidget {
  const AddNewReciver({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      appBar:  PrimaryAppBar(
        // title: LocaleKeys.notifications.tr()'Add New Reciver',
        title:'Add New Reciver',
        withLeading: true,
      ),
    );
  }
}
