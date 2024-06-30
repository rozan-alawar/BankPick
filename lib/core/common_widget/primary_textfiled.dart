import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final Function(String)? onFieldSubmitted;
  final bool readOnly;
  final bool? multiLines;
  final TextInputAction? textInputAction;
  final TextAlign? textAlign;
  final dynamic inputFormater;
  // Color? fillColor = ColorManager.borderColor;
  final bool hideError;
  final ValueChanged<String>? onChanged;

  const PrimaryTextField(
      {Key? key,
      this.hintText,
      required this.controller,
      required this.validator,
      this.keyboardType = TextInputType.text,
      this.prefixIcon,
      this.onTap,
      this.readOnly = false,
      this.onFieldSubmitted,
      this.suffixIcon,
      this.hideError = false,
      this.multiLines = false,
      this.textAlign = TextAlign.start,
      this.onChanged,
      this.inputFormater,
      this.textInputAction = TextInputAction.none})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        controller: controller,
        readOnly: readOnly,
        textAlign: textAlign!,
        onChanged: onChanged,
        textInputAction: textInputAction,
        maxLines: multiLines! ? 6 : 1,
        inputFormatters: inputFormater,
        style: TextStyle(
          // color: ColorManager.secondryTextColor,
          // fontWeight: FontWeightManager.regular,
          fontSize: 14.sp,
          // fontFamily: FontConstants.arabicFontFamily
        ),
        keyboardType: keyboardType,
        onTap: onTap ?? () {},
        onFieldSubmitted: onFieldSubmitted ?? (v) {},
        decoration: InputDecoration(
          isDense: true,
          prefix: prefixIcon,
          helperText: ' ',
          suffixIcon: suffixIcon,
          hintText: hintText ?? '',
          hintStyle: TextStyle(
            // color: ColorManager.hintTextColor,
            fontSize: 14.sp,
            height: 0,
            // fontFamily: FontConstants.arabicFontFamily,
          ),
          filled: true,
          // enabledBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(24.r),
          //   // borderSide:
          //   //     BorderSide(color: ColorManager.chineseSilver.withOpacity(0.3)),
          // ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24.r),
            // borderSide: BorderSide(color: ColorManager.unSelectedBorder),
          ),
          contentPadding:
              EdgeInsets.symmetric(vertical: 17.h, horizontal: 15.w),
          suffixIconConstraints:
              BoxConstraints(minWidth: 40.w, minHeight: 50.h),
          prefixIconConstraints:
              BoxConstraints(minWidth: 40.w, minHeight: 50.h),
          // fillColor: fillColor,
          errorStyle: TextStyle(
              // color: ColorManager.primary,
              fontFamily: 'Almarai',
              fontSize: 12.sp),
          focusedErrorBorder: OutlineInputBorder(
            // borderSide: BorderSide(color: ColorManager.primary),
            borderRadius: BorderRadius.circular(24.r),
          ),
          errorBorder: OutlineInputBorder(
            // borderSide: hideError == false
            //     ? BorderSide(color: ColorManager.primary)
            //     : BorderSide(color: ColorManager.primary.withOpacity(0)),
            borderRadius: BorderRadius.circular(24.r),
          ),
        ),
        validator: validator,
      ),
    );
  }
}
