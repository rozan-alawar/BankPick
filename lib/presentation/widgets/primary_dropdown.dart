import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PrimaryDropDownButton extends StatelessWidget {
  const PrimaryDropDownButton({
    super.key,
    this.value,
    this.hint,
    this.onChanged,
    this.items,
  });

  final String? value;
  final String? hint;
  final void Function(String?)? onChanged;
  final List<DropdownMenuItem<String>>? items;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      decoration: BoxDecoration(
        // border: Border.all(color: ColorManager.unSelectedBorder),
        borderRadius: BorderRadius.circular(50.r),
      ),
      child: DropdownButtonFormField<String>(
        // decoration: InputDecoration(fillColor: ColorManager.grey),
        elevation: 8,
        alignment: Alignment.bottomCenter,
        hint: Align(
          // alignment: Services.textDirection() == TextDirection.rtl
          //     ? Alignment.centerRight
          //     : Alignment.centerLeft,
          child: Text(
            hint ?? '',
            // style: MyTextStyles.hintTextStyle,
            textAlign: TextAlign.left,
          ),
        ),
        isExpanded: true,
        borderRadius: BorderRadius.circular(20),
        icon: SvgPicture.asset('assets/icons/arrow-circle-down.svg'),
        value: value,
        items: items,
        onChanged: onChanged,
      ),
    );
  }
}
