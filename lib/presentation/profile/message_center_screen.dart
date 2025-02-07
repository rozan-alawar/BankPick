import 'package:dakakeen/core/common_widget/primary_appbar.dart';
import 'package:dakakeen/core/common_widget/primary_text.dart';
import 'package:dakakeen/core/extensions/empty_space_extension.dart';
import 'package:dakakeen/core/lang/locale_keys.g.dart';
import 'package:dakakeen/model/message_model.dart';
import 'package:easy_localization/easy_localization.dart';
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

TextEditingController? messageController;
GlobalKey<FormState>? formKey;

class _MessageCenterScreenState extends State<MessageCenterScreen> {
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
      appBar: PrimaryAppBar(
        title: LocaleKeys.message_center.tr(),
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
                    return MessageBubbleWidget(message: message);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
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
                        validator: (value) {
                          return null;
                        },
                      ),
                    ),
                    8.width,
                    GestureDetector(
                      onTap: () => profileProvider.sendMessage(
                          controller: messageController!, withOtherUser: false),
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

  @override
  void dispose() {
    // TODO: implement dispose
    messageController!.dispose();
    super.dispose();
  }
}
