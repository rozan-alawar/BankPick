import 'package:dakakeen/core/common_widget/primary_appbar.dart';
import 'package:dakakeen/core/common_widget/primary_text.dart';
import 'package:dakakeen/core/extensions/empty_space_extension.dart';
import 'package:dakakeen/model/message_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../config/theme/assets_manager.dart';
import '../../config/theme/color_manager.dart';
import '../../controller/profile_provider.dart';
import '../../core/common_widget/circular_card.dart';
import '../../core/utils/navigation.dart';
import '../../injection_container.dart';
import 'message_bubble_widget.dart';

class MessageCenterScreen extends StatefulWidget {
  const MessageCenterScreen({super.key});

  @override
  State<MessageCenterScreen> createState() => _MessageCenterScreenState();
}

class _MessageCenterScreenState extends State<MessageCenterScreen> {
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

class MessageDetailScreen extends StatefulWidget {
  final Message message;

  MessageDetailScreen({required this.message});

  @override
  State<MessageDetailScreen> createState() => _MessageDetailScreenState();
}

TextEditingController? messageController;
GlobalKey<FormState>? formKey;

class _MessageDetailScreenState extends State<MessageDetailScreen> {
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
        title: 'Message Details',
        withLeading: true,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
              children: [

                  SizedBox(
                    width: MediaQuery.of(context).size.width/1.3,
                      child: MessageBubbleWidget(message:widget.message)),

const Spacer(),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 8.w, vertical: 20.h),
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
