import 'package:dakakeen/core/extensions/validation.dart';
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
class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  GlobalKey<FormState>? formKey;
  TextEditingController? nameController;
  TextEditingController? phoneController;
  TextEditingController? emailController;


  @override
  void initState() {
    super.initState();
User_Model? user = HomeProvider().user;
    formKey = GlobalKey<FormState>();
    nameController = TextEditingController(text: user?.name??"Rozan AbuAlawar");
    phoneController = TextEditingController(text: user?.phoneNumber??"+972592417852");
    emailController = TextEditingController(text: user?.email??"rosanalawer2002@gmail.com");
  }
  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    final profileProvider = Provider.of<ProfileProvider>(context);

    return  Scaffold(
      appBar: const PrimaryAppBar(title: 'Profile',withLeading: true,),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child:  Form(
        key: formKey,
        child: GestureDetector(
        onTap: () {
        FocusScope.of(context).unfocus();
        },
          child: SingleChildScrollView(
            child: Column(
              children: [

                    CircleAvatar(
                      radius: 40.r,
                      backgroundImage: AssetImage(
                        homeProvider.user!.avatarUrl,
                      ), // Add a profile image in assets folder
                    ),
                    20.height,
            
            
                        PrimaryText(homeProvider.user?.name ?? "Rozan AbuAlawar",
                            fontSize: 18, fontWeight: FontWeight.bold),
                        8.height,
                        PrimaryText('Senior Designer',
                            fontSize: 12.sp, color: ColorManager.secondaryText),
            
                30.height,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PrimaryText(
                      'Full Name',
                      fontSize: 12.sp,
                      color: ColorManager.secondaryText,
                    ),
                    // 8.height,
                    PrimaryTextField(
                      controller: nameController,
                      validator: (value) {
                        // registerProvider.setEmail(value!);
                        return value!.isValidName;
                      },
                      prefixIcon: SvgPicture.asset(
                        IconAssets.user,
                        width: 20.w,
                        height: 20.h,
                      ),
            
                    ),
                    PrimaryText(
                      'Email Address',
                      fontSize: 12.sp,
                      color: ColorManager.secondaryText,
                    ),
                    PrimaryTextField(
                      controller: emailController,
                      validator: (value) {
                        return      value!.isValidEmail;

                      },
                      prefixIcon: SvgPicture.asset(
                        IconAssets.email,
                        width: 20.w,
                        height: 20.h,
                      ),
                    ),
                    PrimaryText(
                      'Phone Number',
                      fontSize: 12.sp,
                      color: ColorManager.secondaryText,
                    ),
                    PrimaryTextField(
                      controller: phoneController,
                      validator: (value) {
                  return      value!.isValidPhone;
                      },
                      prefixIcon: SvgPicture.asset(
                        IconAssets.phone,
                        width: 20.w,
                        height: 20.h,
                      ),
                    ),
                    40.height,
                    PrimaryButton(
                      color:ColorManager.primary,
                      width: double.infinity,
                      height: 56.h,
                      onPressed: ()=> profileProvider.saveProfile(formKey!,context,nameController!.text,emailController!.text,phoneController!.text,),
                      child:  PrimaryText(
                        'Save',
                        color: ColorManager.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
    70.height,
    PrimaryText( 'Joined ${homeProvider.user!.joinedDate.day}/${homeProvider.user!.joinedDate.month}/${homeProvider.user!.joinedDate.year}',color: ColorManager.secondaryText,),

              ],
            ),
          ),
        ),
    ),
      ),
    );
  }
}
