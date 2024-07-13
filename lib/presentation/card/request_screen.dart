import 'package:flutter/material.dart';
import 'package:dakakeen/config/theme/assets_manager.dart';
import 'package:dakakeen/config/theme/color_manager.dart';
import 'package:dakakeen/core/common_widget/primary_textfiled.dart';
import 'package:dakakeen/core/extensions/empty_space_extension.dart';
import 'package:dakakeen/core/extensions/validation.dart';
import 'package:dakakeen/model/card_model.dart';
import 'package:dakakeen/presentation/home/card_section.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../controller/home_provider.dart';
import '../../core/common_widget/circular_card.dart';
import '../../core/common_widget/primary_button.dart';
import '../../core/common_widget/primary_text.dart';
import '../../core/utils/navigation.dart';
import '../../injection_container.dart';

class RequestMoneyScreen extends StatefulWidget {
  const RequestMoneyScreen({super.key});

  @override
  State<RequestMoneyScreen> createState() => _RequestMoneyScreenState();
}

class _RequestMoneyScreenState extends State<RequestMoneyScreen> {
  TextEditingController? nameController;
  TextEditingController? descriptionController;
  TextEditingController? emailController;
  GlobalKey<FormState>? formKey;

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    nameController = TextEditingController();
    descriptionController = TextEditingController();
    emailController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
        key: formKey,
        child: GestureDetector(
        onTap: () {
      FocusScope.of(context).unfocus();
    },
    child: Padding(
    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
        child: Column(
          children: [
            20.height,
            Row(
              children: [
                GestureDetector(
                  onTap: () => sl<NavigationService>().pop(),
                  child: CircularCard(
                    widget: SvgPicture.asset(
                      IconAssets.arrow_back,
                      color: Colors.black,
                    ),
                    width: 45.w,
                    height: 45.h,
                  ),
                ),
                80.width,
                PrimaryText(
                  'Request Money',
                  fontWeight: FontWeight.w500,
                  fontSize: 18.sp,
                ),
              ],
            ),
            PrimaryText('Payer Name',color: ColorManager.secondaryText,),
            PrimaryTextField(
              controller: nameController,
              validator: (value) {
                return value!.isValidName;
              },
              prefixIcon: SvgPicture.asset(
                IconAssets.user,
                width: 20.w,
                height: 20.h,
              ),
            ),
            20.height,
            PrimaryText('Email Address',color: ColorManager.secondaryText,),
            PrimaryTextField(
              controller: emailController,
              validator: (value) {
                return value!.isValidEmail;
              },
              prefixIcon: SvgPicture.asset(
                IconAssets.email,
                width: 20.w,
                height: 20.h,
              ),
            ),
            20.height,
            PrimaryText('Description',color: ColorManager.secondaryText,),
            PrimaryTextField(
              controller: descriptionController,
              validator: (value) {
              },
multiLines: true,

            ),
            20.height,
          ],
        ),
    ),
        ),
    ),
      ),
    );
  }
}
