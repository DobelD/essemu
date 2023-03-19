import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors/colors.dart';

class AppTextTheme {
  AppTextTheme(BuildContext context) : _localContext = context;

  final BuildContext _localContext;

  static AppTextTheme? _current;

  static AppTextTheme get current => _current!;

  static void init(BuildContext context) {
    AppTextTheme._current ??= AppTextTheme(context);
  }

  TextStyle get mainCounter => GoogleFonts.poppins(
      textStyle: Theme.of(_localContext)
          .textTheme
          .displayLarge!
          .copyWith(leadingDistribution: TextLeadingDistribution.even),
      fontWeight: FontWeight.bold,
      color: kBlack,
      fontSize: 48.sp,
      height: 58 / 48,
      letterSpacing: 48.sp * 0.01);

  TextStyle get secondaryCounter => GoogleFonts.poppins(
      textStyle: Theme.of(_localContext)
          .textTheme
          .displayMedium!
          .copyWith(leadingDistribution: TextLeadingDistribution.even),
      fontWeight: FontWeight.bold,
      color: kBlack,
      fontSize: 32.sp,
      height: 38 / 32,
      letterSpacing: 32.sp * 0.01);

  TextStyle get totalTarget => GoogleFonts.poppins(
      textStyle: Theme.of(_localContext)
          .textTheme
          .displayMedium!
          .copyWith(leadingDistribution: TextLeadingDistribution.even),
      fontWeight: FontWeight.bold,
      color: kBlack,
      fontSize: 32.sp,
      height: 41.66 / 32,
      letterSpacing: 32.sp * 0.01);

  TextStyle get title1 => GoogleFonts.poppins(
      textStyle: Theme.of(_localContext)
          .textTheme
          .titleLarge!
          .copyWith(leadingDistribution: TextLeadingDistribution.even),
      fontWeight: FontWeight.bold,
      color: kBlack,
      fontSize: 24.sp,
      height: 32 / 24,
      letterSpacing: 24.sp * 0.01);

  TextStyle get summaryQuantity => GoogleFonts.poppins(
      textStyle: Theme.of(_localContext)
          .textTheme
          .titleLarge!
          .copyWith(leadingDistribution: TextLeadingDistribution.even),
      fontWeight: FontWeight.bold,
      color: kBlack,
      fontSize: 24.sp,
      height: 31.25 / 24,
      letterSpacing: 0);

  TextStyle get title2 => GoogleFonts.poppins(
      textStyle: Theme.of(_localContext)
          .textTheme
          .titleMedium!
          .copyWith(leadingDistribution: TextLeadingDistribution.even),
      fontWeight: FontWeight.bold,
      color: kBlack,
      fontSize: 18.sp,
      height: 24 / 18,
      letterSpacing: 18.sp * 0.01);

  TextStyle get profileName => GoogleFonts.poppins(
      textStyle: Theme.of(_localContext)
          .textTheme
          .titleMedium!
          .copyWith(leadingDistribution: TextLeadingDistribution.even),
      fontWeight: FontWeight.bold,
      color: kSoftBlack,
      fontSize: 18.sp,
      height: 23.44 / 18,
      letterSpacing: 0);

  TextStyle get title3 => GoogleFonts.poppins(
      textStyle: Theme.of(_localContext)
          .textTheme
          .titleSmall!
          .copyWith(leadingDistribution: TextLeadingDistribution.even),
      fontWeight: FontWeight.bold,
      color: kBlack,
      fontSize: 16.sp,
      height: 22 / 16,
      letterSpacing: 16.sp * 0.01);

  TextStyle get appBarTitle => GoogleFonts.poppins(
      textStyle: Theme.of(_localContext)
          .textTheme
          .titleSmall!
          .copyWith(leadingDistribution: TextLeadingDistribution.even),
      fontWeight: FontWeight.bold,
      color: kWhite,
      fontSize: 16.sp,
      height: 1,
      letterSpacing: 16 * 0.01);

  TextStyle get buttonText => GoogleFonts.poppins(
      textStyle: Theme.of(_localContext)
          .textTheme
          .labelLarge!
          .copyWith(leadingDistribution: TextLeadingDistribution.even),
      fontWeight: FontWeight.bold,
      color: kBlack,
      fontSize: 16.sp,
      height: 22 / 16,
      letterSpacing: 16.sp * 0.01);

  TextStyle get buttonTextNormal => GoogleFonts.poppins(
      textStyle: Theme.of(_localContext)
          .textTheme
          .labelLarge!
          .copyWith(leadingDistribution: TextLeadingDistribution.even),
      fontWeight: FontWeight.w500,
      color: kWhite,
      fontSize: 16.sp,
      height: 20.83 / 16,
      letterSpacing: 0);

  TextStyle get dashboardSectionTitle => GoogleFonts.poppins(
      textStyle: Theme.of(_localContext)
          .textTheme
          .titleSmall!
          .copyWith(leadingDistribution: TextLeadingDistribution.even),
      fontWeight: FontWeight.bold,
      color: kSofterBlack,
      fontSize: 16.sp,
      height: 24 / 16,
      letterSpacing: 0);

  TextStyle get dialogTitle => GoogleFonts.poppins(
      textStyle: Theme.of(_localContext)
          .textTheme
          .titleSmall!
          .copyWith(leadingDistribution: TextLeadingDistribution.even),
      fontWeight: FontWeight.bold,
      color: kBlack,
      fontSize: 16.sp,
      height: 24 / 16,
      letterSpacing: 16.sp * 0.01);

  TextStyle get buttonTextSmall => GoogleFonts.poppins(
      textStyle: Theme.of(_localContext)
          .textTheme
          .labelLarge!
          .copyWith(leadingDistribution: TextLeadingDistribution.even),
      fontWeight: FontWeight.bold,
      color: kWhite,
      fontSize: 14.sp,
      height: 18.23 / 14,
      letterSpacing: 0);

  TextStyle get labelStatusText => GoogleFonts.poppins(
      textStyle: Theme.of(_localContext)
          .textTheme
          .labelLarge!
          .copyWith(leadingDistribution: TextLeadingDistribution.even),
      fontWeight: FontWeight.w600,
      color: kBlack,
      fontSize: 16.sp,
      height: 18.23 / 14,
      letterSpacing: 14.sp * 0.01);
  TextStyle get labelTextAction => GoogleFonts.poppins(
      textStyle: Theme.of(_localContext)
          .textTheme
          .labelLarge!
          .copyWith(leadingDistribution: TextLeadingDistribution.even),
      fontWeight: FontWeight.w600,
      color: kMain,
      fontSize: 14.sp,
      height: 18.23 / 14,
      letterSpacing: 14.sp * 0.01);

  TextStyle get dateEditedLeadsText => GoogleFonts.poppins(
      textStyle: Theme.of(_localContext)
          .textTheme
          .labelLarge!
          .copyWith(leadingDistribution: TextLeadingDistribution.even),
      fontWeight: FontWeight.normal,
      color: kSoftBlack,
      fontSize: 14.sp,
      height: 18.23 / 14,
      letterSpacing: 14.sp * 0.01);

  TextStyle get title4 => GoogleFonts.poppins(
      textStyle: Theme.of(_localContext)
          .textTheme
          .bodyLarge!
          .copyWith(leadingDistribution: TextLeadingDistribution.even),
      fontWeight: FontWeight.bold,
      color: kBlack,
      fontSize: 14.sp,
      height: 20 / 14,
      letterSpacing: 14.sp * 0.01);
  TextStyle get title5 => GoogleFonts.poppins(
      textStyle: Theme.of(_localContext)
          .textTheme
          .bodyMedium!
          .copyWith(leadingDistribution: TextLeadingDistribution.even),
      fontWeight: FontWeight.w600,
      color: kMain,
      fontSize: 12.sp,
      height: 20 / 14,
      letterSpacing: 14.sp * 0.01);
  TextStyle get title6 => GoogleFonts.poppins(
      textStyle: Theme.of(_localContext)
          .textTheme
          .bodyMedium!
          .copyWith(leadingDistribution: TextLeadingDistribution.even),
      fontWeight: FontWeight.w500,
      color: kBlack,
      fontSize: 12.sp,
      height: 20 / 14,
      letterSpacing: 14.sp * 0.01);

  TextStyle get link => GoogleFonts.poppins(
      textStyle: Theme.of(_localContext)
          .textTheme
          .bodyLarge!
          .copyWith(leadingDistribution: TextLeadingDistribution.even),
      fontWeight: FontWeight.bold,
      color: kMain,
      fontSize: 14.sp,
      height: 18 / 14,
      letterSpacing: 14.sp * 0.01);

  TextStyle get linkSummaryHeadTail => GoogleFonts.poppins(
      textStyle: Theme.of(_localContext)
          .textTheme
          .bodySmall!
          .copyWith(leadingDistribution: TextLeadingDistribution.even),
      fontWeight: FontWeight.bold,
      color: kMain,
      fontSize: 12.sp,
      height: 15.62 / 12,
      letterSpacing: 0);

  TextStyle get dashboardStatisticItem => GoogleFonts.poppins(
      textStyle: Theme.of(_localContext)
          .textTheme
          .bodySmall!
          .copyWith(leadingDistribution: TextLeadingDistribution.even),
      fontWeight: FontWeight.normal,
      color: kSoftBlack,
      fontSize: 12.sp,
      height: 15.62 / 12,
      letterSpacing: 0);

  TextStyle get highlightsBody => GoogleFonts.poppins(
      textStyle: Theme.of(_localContext)
          .textTheme
          .bodyMedium!
          .copyWith(leadingDistribution: TextLeadingDistribution.even),
      fontWeight: FontWeight.normal,
      color: kBlack,
      fontSize: 12.sp,
      height: 19.6 / 14,
      letterSpacing: 14.sp * 0.01);

  TextStyle get bodyText => GoogleFonts.poppins(
      textStyle: Theme.of(_localContext)
          .textTheme
          .bodyMedium!
          .copyWith(leadingDistribution: TextLeadingDistribution.even),
      fontWeight: FontWeight.normal,
      color: kBlack,
      fontSize: 14.sp,
      height: 19.6 / 14,
      letterSpacing: 14.sp * 0.01);
  TextStyle get bodyTextWhite => GoogleFonts.poppins(
      textStyle: Theme.of(_localContext)
          .textTheme
          .bodyMedium!
          .copyWith(leadingDistribution: TextLeadingDistribution.even),
      fontWeight: FontWeight.normal,
      color: kWhite,
      fontSize: 14.sp,
      height: 19.6 / 14,
      letterSpacing: 14.sp * 0.01);

  TextStyle get dashboardLabel => GoogleFonts.poppins(
      textStyle: Theme.of(_localContext)
          .textTheme
          .bodyMedium!
          .copyWith(leadingDistribution: TextLeadingDistribution.even),
      fontWeight: FontWeight.w500,
      color: kSoftBlack,
      fontSize: 14.sp,
      height: 18.23 / 14,
      letterSpacing: 0);

  TextStyle get filter => GoogleFonts.poppins(
      textStyle: Theme.of(_localContext)
          .textTheme
          .bodyMedium!
          .copyWith(leadingDistribution: TextLeadingDistribution.even),
      fontWeight: FontWeight.normal,
      color: kBlack,
      fontSize: 14.sp,
      height: 16.8 / 14,
      letterSpacing: 0);

  TextStyle get leadsText => GoogleFonts.poppins(
      textStyle: Theme.of(_localContext)
          .textTheme
          .bodyMedium!
          .copyWith(leadingDistribution: TextLeadingDistribution.even),
      fontWeight: FontWeight.normal,
      color: kBlack,
      fontSize: 14.sp,
      height: 16.8 / 14,
      letterSpacing: 14.sp * 0.01);

  TextStyle get leadsAchieved => GoogleFonts.poppins(
      textStyle: Theme.of(_localContext)
          .textTheme
          .bodyMedium!
          .copyWith(leadingDistribution: TextLeadingDistribution.even),
      fontWeight: FontWeight.bold,
      color: kBlack,
      fontSize: 14.sp,
      height: 16.8 / 14,
      letterSpacing: 14.sp * 0.01);

  TextStyle get paginationLabel => GoogleFonts.poppins(
      textStyle: Theme.of(_localContext)
          .textTheme
          .bodyMedium!
          .copyWith(leadingDistribution: TextLeadingDistribution.even),
      fontWeight: FontWeight.bold,
      color: kSoftBlack,
      fontSize: 14.sp,
      height: 16.8 / 14,
      letterSpacing: 0);

  TextStyle get tagLabel => GoogleFonts.poppins(
      textStyle: Theme.of(_localContext)
          .textTheme
          .bodySmall!
          .copyWith(leadingDistribution: TextLeadingDistribution.even),
      fontWeight: FontWeight.normal,
      color: kBlack,
      fontSize: 12.sp,
      height: 16.8 / 12,
      letterSpacing: 12.sp * 0.01);

  TextStyle get targetRemainingTime => GoogleFonts.poppins(
      textStyle: Theme.of(_localContext)
          .textTheme
          .bodySmall!
          .copyWith(leadingDistribution: TextLeadingDistribution.even),
      fontWeight: FontWeight.bold,
      color: kWhite,
      fontSize: 12.sp,
      height: 15.62 / 12,
      letterSpacing: 12.sp * 0.01);

  TextStyle get seeMoreData => GoogleFonts.poppins(
      textStyle: Theme.of(_localContext)
          .textTheme
          .bodySmall!
          .copyWith(leadingDistribution: TextLeadingDistribution.even),
      fontWeight: FontWeight.normal,
      color: kSoftBlack,
      fontSize: 12.sp,
      height: 14.4 / 12,
      letterSpacing: 0,
      fontStyle: FontStyle.italic);

  TextStyle get selectedBottomNavigation => GoogleFonts.poppins(
      textStyle: Theme.of(_localContext)
          .textTheme
          .labelSmall!
          .copyWith(leadingDistribution: TextLeadingDistribution.even),
      fontWeight: FontWeight.bold,
      color: kMain,
      fontSize: 10.sp,
      height: 13.02 / 10,
      letterSpacing: 10.sp * 0.01);

  TextStyle get unselectedBottomNavigation => GoogleFonts.poppins(
      textStyle: Theme.of(_localContext)
          .textTheme
          .labelSmall!
          .copyWith(leadingDistribution: TextLeadingDistribution.even),
      fontWeight: FontWeight.normal,
      color: kWhite.withOpacity(0.64),
      fontSize: 10.sp,
      height: 12 / 10,
      letterSpacing: 10.sp * 0.01);

  TextStyle get hintText => GoogleFonts.poppins(
      textStyle: Theme.of(_localContext)
          .textTheme
          .bodyMedium!
          .copyWith(leadingDistribution: TextLeadingDistribution.even),
      fontWeight: FontWeight.normal,
      color: kSofterBlack,
      fontSize: 14.sp,
      height: 24 / 14,
      letterSpacing: 14.sp * 0.01);
}
