import 'package:essemu/app/themes/decoration/app_padding.dart';
import 'package:essemu/app/themes/typograpy/typo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: DefaultPadding.side,
      child: Container(
        padding: DefaultPadding.all,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: Colors.white,
        ),
        child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 600.w, minHeight: 100.w),
            child: SingleChildScrollView(
              child: Material(
                color: Colors.transparent,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 6.w, 0, 6.w),
                  child: Column(
                    children: [
                      Text('About Essemu App',
                          style: AppTextTheme.current.title5),
                      SizedBox(height: 12.w),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                            '''Essemu App is your convenient and user-friendly food and beverage ordering platform. Discover a wide range of cuisines from local restaurants, cafes, and food vendors, all in one place. Order a hearty meal, a quick snack, or a refreshing beverage with ease. Enjoy a seamless ordering experience from the comfort of your home or on the go. Download Essemu App today and indulge in a world of culinary delights!''',
                            overflow: TextOverflow.clip,
                            textAlign: TextAlign.center,
                            style: AppTextTheme.current.bodyText),
                      ),
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
