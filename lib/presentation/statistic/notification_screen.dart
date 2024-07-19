import 'package:dakakeen/controller/home_provider.dart';
import 'package:dakakeen/core/extensions/empty_space_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../core/common_widget/primary_appbar.dart';
import '../../core/common_widget/primary_text.dart';
import '../../model/message_model.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    return Scaffold(
      appBar: const PrimaryAppBar(
        title: 'Notification',
        withLeading: true,
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => 16.height,
        itemCount: Message.messages.length,
        itemBuilder: (context, index) {
          final message = Message.messages[index];
          return Container(
            margin: EdgeInsetsDirectional.symmetric(horizontal: 8.w),
            padding: EdgeInsetsDirectional.symmetric(vertical: 8.w),
            decoration: BoxDecoration(color: (homeProvider.isDark??false)?Colors.black: Colors.white, boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                offset: const Offset(0, 2),
                blurRadius: 12,
              ),
            ],
            borderRadius: BorderRadius.circular(8.r)),
            child: ListTile(
              title: PrimaryText(
                message.body,
                maxLines: 3,
                fontSize: 12.sp,
              ),
              subtitle: Text(
                "${message.date.day}/${message.date.month}/${message.date.year}",
                style: const TextStyle(color: Colors.grey),
              ),
            ),
          );
        },
      ),
    );
  }
}
