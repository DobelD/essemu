import 'package:essemu/app/data/categories.dart';
import 'package:essemu/app/themes/decoration/app_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BodySection extends StatelessWidget {
  const BodySection({super.key, this.data});
  final Menu? data;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
        padding: DefaultPadding.all,
        sliver: SliverToBoxAdapter(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${data?.name}',
              style: GoogleFonts.inter(
                  fontSize: 16.sp, fontWeight: FontWeight.w600),
            )
          ],
        )));
  }
}
