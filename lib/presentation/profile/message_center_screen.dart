import 'package:dakakeen/core/common_widget/primary_appbar.dart';
import 'package:dakakeen/core/common_widget/primary_text.dart';
import 'package:dakakeen/core/extensions/empty_space_extension.dart';
import 'package:dakakeen/model/message_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/theme/assets_manager.dart';
import '../../core/common_widget/circular_card.dart';
import '../../core/utils/navigation.dart';
import '../../injection_container.dart';

class MessageCenterScreen extends StatelessWidget {
  const MessageCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(
        title: 'Message Center',
        withLeading: true,
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => 16.height,
        itemCount: Message.messages.length,
        itemBuilder: (context, index) {
          final message = Message.messages[index];
          return ListTile(
            leading: Image.asset(ImageAssets.profile),
            title: Text(message.sender.name),
            subtitle: PrimaryText(
              message.body,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              fontSize: 12.sp,
            ),
            trailing: Text(
              "${message.date.day}/${message.date.month}/${message.date.year}",
              style: const TextStyle(color: Colors.grey),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MessageDetailScreen(message: message),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class MessageDetailScreen extends StatelessWidget {
  final Message message;

  MessageDetailScreen({required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(
        title: 'Message Details',
        withLeading: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(message.sender.name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            10.height,
            Text(
                "${message.date.day}/${message.date.month}/${message.date.year}",
                style: TextStyle(color: Colors.grey)),
            10.height,
            Text(message.body),
          ],
        ),
      ),
    );
  }
}
