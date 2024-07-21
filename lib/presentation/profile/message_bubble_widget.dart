import 'package:flutter/material.dart';

import '../../core/common_widget/primary_text.dart';
import 'dart:ui';

import 'package:dakakeen/config/theme/color_manager.dart';
import 'package:dakakeen/core/common_widget/primary_textfiled.dart';
import 'package:dakakeen/core/extensions/empty_space_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../controller/profile_provider.dart';
import '../../core/common_widget/primary_appbar.dart';
import '../../core/common_widget/primary_text.dart';
import '../../model/message_model.dart';

class MessageBubbleWidget extends StatelessWidget {
  const MessageBubbleWidget({super.key, required this.message});

  final Message message;
  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(context);

    bool isSentByUser = message.sender.name == profileProvider.user!.name;
    return Stack(
      alignment: isSentByUser ? Alignment.centerRight : Alignment.centerLeft,
      children: [
        CircleAvatar(
          radius: 20.r,
          backgroundColor: ColorManager.transparent,
          child: Image.asset(message.sender.avatarUrl),
        ),
        Transform.translate(offset:  Offset(isSentByUser ?-45:45,0),
          child: Container(
            margin: EdgeInsetsDirectional.only(
                end: 10.w,
                top: 5.h,
                start: isSentByUser ? 70.w : 10,
                bottom: 5.h),
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            decoration: BoxDecoration(
              color: isSentByUser ? Colors.blue : Colors.grey[300],
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              crossAxisAlignment: isSentByUser
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                PrimaryText(
                  message.body,
                  maxLines: 8,
                  fontSize: 14.sp,
                  color: isSentByUser ? Colors.white : Colors.black,
                ),
                5.height,
                Text(
                  "${message.date.hour}:${message.date.minute}",
                  style: TextStyle(
                    fontSize: 10,
                    color: isSentByUser ? Colors.white60 : Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
