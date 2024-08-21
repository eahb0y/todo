import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo/core/theme/app_text_style.dart';
import 'package:todo/core/theme/colors/app_colors.dart';
import 'package:todo/core/utils/app_utils.dart';
import 'package:todo/generated/l10n.dart';
import 'package:todo/router/name_routes.dart';

class EventAppBarWidget extends StatelessWidget {
  final String title;
  final String time;
  final String location;
  final Function() onEdit;

  const EventAppBarWidget({
    super.key,
    required this.time,
    required this.title,
    required this.location,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: 230,
      pinned: true,
      floating: false,
      automaticallyImplyLeading: false,
      shape: const RoundedRectangleBorder(
        borderRadius: AppUtils.kBorderRadiusBottom20,
      ),
      backgroundColor: AppColors.lightBlue,
      flexibleSpace: SafeArea(
        minimum: AppUtils.kPaddingVer18Hor28,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppUtils.kBoxHeight20,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  borderRadius: AppUtils.kBorderRadius64,
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      Routes.home,
                      (route) => false,
                    );
                  },
                  child: Ink(
                    decoration: const BoxDecoration(
                      borderRadius: AppUtils.kBorderRadius64,
                      color: AppColors.white,
                    ),
                    padding: AppUtils.kPaddingAll8,
                    child: const Icon(Icons.arrow_back_ios_new),
                  ),
                ),
                TextButton.icon(
                  onPressed:onEdit,
                  label: Text(
                    AppLocalization.current.edit,
                    style: AppTextStyle.textButtonEdit,
                  ),
                  icon: SvgPicture.asset("assets/svg/ic_edit.svg"),
                )
              ],
            ),
            AppUtils.kBoxHeight20,
            Text(
              title,
              style: AppTextStyle.eventName,
            ),
            Text(
              location,
              style: AppTextStyle.eventLocation,
            ),
            AppUtils.kBoxHeight12,
            Row(
              children: [
                SvgPicture.asset("assets/svg/ic_time.svg"),
                AppUtils.kBoxWidth4,
                Text(
                  time,
                  style: AppTextStyle.eventTime,
                )
              ],
            ),
            AppUtils.kBoxHeight12,
            Row(
              children: [
                SvgPicture.asset(
                  "assets/svg/ic_location.svg",
                  colorFilter: const ColorFilter.mode(
                    AppColors.white,
                    BlendMode.srcIn,
                  ),
                ),
                AppUtils.kBoxWidth4,
                Text(
                  location,
                  style: AppTextStyle.eventTime,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
