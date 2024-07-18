import 'package:flutter/material.dart';

import '../../core/common_widget/primary_appbar.dart';

class AddNewReciver extends StatelessWidget {
  const AddNewReciver({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  PrimaryAppBar(
        title: 'Add New Reciver',
        withLeading: true,
      ),
    );
  }
}
