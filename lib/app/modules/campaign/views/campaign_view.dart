import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../components/loading_action/loading_action.dart';
import '../../../components/textfield/form.dart';
import '../../../themes/colors/colors.dart';
import '../../../themes/decoration/app_padding.dart';
import '../../../themes/decoration/app_radius.dart';
import '../../../themes/typograpy/typo.dart';
import '../controllers/campaign_controller.dart';
import 'widget/image_pick.dart';

class CampaignView extends GetView<CampaignController> {
  const CampaignView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CampaignController>(builder: (c) {
      final controller = Get.put(CampaignController());
      return AppLoading(
        isLoading: c.isLoading,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: kWhite,
              surfaceTintColor: kWhite,
              centerTitle: true,
              title: Text(
                'Add Campaign',
                style: AppTextTheme.current.appBarTitleDark,
              ),
            ),
            body: ListView(
              padding: DefaultPadding.all,
              children: [
                FormTxt(
                  controller: controller.nama,
                  title: 'Campaign',
                  hint: 'nama campaign',
                ),
                SizedBox(height: 12.h),
                ImagePick(),
                SizedBox(height: 16.h),
                SizedBox(
                  height: 54.h,
                  width: Get.width,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: kMain,
                          shape: RoundedRectangleBorder(
                              borderRadius: AppRadius.icon)),
                      onPressed: () => controller.addCategory(),
                      child: Text(
                        'Add Campaign',
                        style: AppTextTheme.current.bodyTextWhite,
                      )),
                ),
              ],
            )),
      );
    });
  }
}
