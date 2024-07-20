import 'dart:ui';

import 'package:dakakeen/config/theme/color_manager.dart';
import 'package:dakakeen/core/common_widget/primary_textfiled.dart';
import 'package:dakakeen/core/extensions/empty_space_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../controller/profile_provider.dart';
import '../../core/common_widget/primary_appbar.dart';
import '../../model/message_model.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

TextEditingController? messageController;
GlobalKey<FormState>? formKey;

class _ContactUsScreenState extends State<ContactUsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    formKey = GlobalKey<FormState>();
    messageController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(context);

    return Scaffold(
      appBar: const PrimaryAppBar(
        title: 'Contact Us',
        withLeading: true,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  reverse: true,
                  itemCount: profileProvider.contactUsMessages.length,
                  itemBuilder: (context, index) {
                    final message = profileProvider.contactUsMessages[
                        profileProvider.contactUsMessages.length - 1 - index];
                    return _buildMessageBubble(message);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 20.h),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: messageController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: ColorManager.secondaryText,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(16.r),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: ColorManager.secondaryText,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(16.r),
                            ),
                          ),
                        ),
                        validator: (value) {},
                      ),
                    ),
                    8.width,
                    GestureDetector(
                      onTap: () => profileProvider.sendMessage(
                          controller: messageController!),
                      child: const Icon(
                        Icons.send_outlined,
                        color: ColorManager.primary,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMessageBubble(Message message) {
    final profileProvider = Provider.of<ProfileProvider>(context);

    bool isSentByUser = message.sender.name == profileProvider.user!.name;
    return Align(
      alignment: isSentByUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Row(
        children: [
          CircleAvatar(
            radius: 20.r,
            backgroundColor: ColorManager.transparent,
            child: Image.asset(message.sender.avatarUrl),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
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
                Text(
                  message.body,
                  style: TextStyle(
                    color: isSentByUser ? Colors.white : Colors.black,
                  ),
                ),
                SizedBox(height: 5),
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
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    messageController!.dispose();
    super.dispose();
  }
}
