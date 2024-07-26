import 'package:dakakeen/config/theme/color_manager.dart';
import 'package:dakakeen/controller/home_provider.dart';
import 'package:dakakeen/core/extensions/empty_space_extension.dart';
import 'package:dakakeen/core/lang/locale_keys.g.dart';
import 'package:dakakeen/model/notification_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../controller/service_provider.dart';
import '../../core/common_widget/primary_appbar.dart';
import '../../core/common_widget/primary_text.dart';
import '../../injection_container.dart';
import '../../model/message_model.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    return Scaffold(
      appBar:  PrimaryAppBar(
        title: LocaleKeys.notifications.tr(),
        withLeading: true,
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => 16.height,
        itemCount: NotificationModel.notifications.length,
        itemBuilder: (context, index) {
          final notification = NotificationModel.notifications[index];
          return Container(
            margin: EdgeInsetsDirectional.symmetric(horizontal: 8.w),
            padding: EdgeInsetsDirectional.symmetric(vertical: 8.w),
            decoration: BoxDecoration(
                color: (sl<ServiceProvider>().isDark ?? false)
                    ? Colors.black
                    : Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    offset: const Offset(0, 2),
                    blurRadius: 12,
                  ),
                ],
                borderRadius: BorderRadius.circular(8.r)),
            child: ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        notification.isRead
                            ? Icons.notifications
                            : Icons.notifications_active,
                        color: notification.isRead ? Colors.grey : Colors.blue,
                      ),
                      20.width,
                      PrimaryText(
                        notification.title,
                        fontSize: 14.sp,
                      ),
                    ],
                  ),
                  12.height,
                  PrimaryText(
                    notification.message,
                    maxLines: 6,
                    fontSize: 12.sp,
                  ),
                  8.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PrimaryText(
                        "${notification.date.day}/${notification.date.month}/${notification.date.year}",
                        color: Colors.grey,
                        fontSize: 11.sp,
                      ),
                      notification.isRead
                          ? const SizedBox()
                          : CircleAvatar(
                              backgroundColor: ColorManager.primary,
                              radius: 6.r,
                            ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
