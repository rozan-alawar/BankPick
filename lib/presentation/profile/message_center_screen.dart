import 'package:dakakeen/core/common_widget/primary_appbar.dart';
import 'package:dakakeen/core/common_widget/primary_text.dart';
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
      appBar: PrimaryAppBar(title: 'Message Center',withLeading: true,),
      body: ListView.builder(
        itemCount: Message.messages.length,
        itemBuilder: (context, index) {
          final message = Message.messages[index];
          return ListTile(
            title: Text(message.sender),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(message.subject, style: TextStyle(fontWeight: FontWeight.bold)),
                Text(message.body, maxLines: 1, overflow: TextOverflow.ellipsis),
              ],
            ),
            trailing: Text(
              "${message.date.day}/${message.date.month}/${message.date.year}",
              style: TextStyle(color: Colors.grey),
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
      appBar: AppBar(
        title: Text('Message Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(message.sender, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(message.subject, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text("${message.date.day}/${message.date.month}/${message.date.year}", style: TextStyle(color: Colors.grey)),
            SizedBox(height: 20),
            Text(message.body),
          ],
        ),
      ),
    );
  }
}