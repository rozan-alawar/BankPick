import 'package:dakakeen/core/extensions/validation.dart';
import 'package:dakakeen/core/utils/date_to_String.dart';
import 'package:flutter/material.dart';
import 'package:dakakeen/config/routes/routes.dart';
import 'package:dakakeen/controller/home_provider.dart';
import 'package:dakakeen/core/extensions/empty_space_extension.dart';
import 'package:dakakeen/presentation/home/profile_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../config/theme/assets_manager.dart';
import '../../config/theme/color_manager.dart';
import '../../controller/profile_provider.dart';
import '../../core/common_widget/circular_card.dart';
import '../../core/common_widget/primary_appbar.dart';
import '../../core/common_widget/primary_button.dart';
import '../../core/common_widget/primary_text.dart';
import '../../core/common_widget/primary_textfiled.dart';
import '../../core/utils/navigation.dart';
import '../../injection_container.dart';
import '../../model/user_model.dart';

class PersonalInformationScreen extends StatefulWidget {
  const PersonalInformationScreen({super.key});

  @override
  State<PersonalInformationScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<PersonalInformationScreen> {
  GlobalKey<FormState>? formKey;
  TextEditingController? nameController;
  TextEditingController? phoneController;
  TextEditingController? emailController;

  @override
  void initState() {
    super.initState();
    User? user = HomeProvider().user;
    formKey = GlobalKey<FormState>();
    nameController =
        TextEditingController(text: user?.name ?? "Rozan AbuAlawar");
    phoneController =
        TextEditingController(text: user?.phoneNumber ?? "+972592417852");
    emailController =
        TextEditingController(text: user?.email ?? "rosanalawer2002@gmail.com");
  }

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    final profileProvider = Provider.of<ProfileProvider>(context);

    return Scaffold(
      appBar: const PrimaryAppBar(
        title: 'Personal Information',
        withLeading: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.height,
            Center(
              child: CircleAvatar(
                radius: 40.r,
                backgroundImage: AssetImage(
                  homeProvider.user!.avatarUrl,
                ), // Add a profile image in assets folder
              ),
            ),
            30.height,
            PrimaryText(
              'Full Name',
              fontSize: 12.sp,
              color: ColorManager.secondaryText,
            ),
            8.height,
            PrimaryText(
              homeProvider.user?.name ?? "Rozan AbuAlawar",
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
            24.height,
            PrimaryText(
              'Email Address',
              fontSize: 12.sp,
              color: ColorManager.secondaryText,
            ),
            8.height,
            PrimaryText(
              homeProvider.user?.email ?? "xyz@gmail.com",
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
            24.height,
            PrimaryText(
              'Phone Number',
              fontSize: 12.sp,
              color: ColorManager.secondaryText,
            ),
            8.height,
            PrimaryText(
              homeProvider.user?.phoneNumber ?? "0147822368",
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
            24.height,
            PrimaryText(
              'Birth Date',
              fontSize: 12.sp,
              color: ColorManager.secondaryText,
            ),
            8.height,
            PrimaryText(
              ConvertDate.dateToString(homeProvider.user!.birthDate) ?? "0147822368",
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
            24.height,
            50.height,
            Center(
              child: PrimaryText(
                'Joined ${homeProvider.user!.joinedDate.day}/${homeProvider.user!.joinedDate.month}/${homeProvider.user!.joinedDate.year}',
                color: ColorManager.secondaryText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
