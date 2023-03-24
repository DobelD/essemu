import 'package:essemu/app/components/loading_action/loading_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../components/textfield/form.dart';
import '../../../themes/colors/colors.dart';
import '../../../themes/decoration/app_padding.dart';
import '../../../themes/decoration/app_radius.dart';
import '../../../themes/typograpy/typo.dart';
import '../controllers/add_category_controller.dart';
import 'widget/image_pick.dart';

class AddCategoryView extends GetView<AddCategoryController> {
  const AddCategoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddCategoryController());
    return GetBuilder<AddCategoryController>(builder: (c) {
      return AppLoading(
        isLoading: c.isLoading,
        child: Scaffold(
            body: ListView(
          padding: DefaultPadding.all,
          children: [
            FormTxt(
              controller: controller.nama,
              title: 'Kategori',
              hint: 'nama kategori',
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
                      shape:
                          RoundedRectangleBorder(borderRadius: AppRadius.icon)),
                  onPressed: () => controller.addCategory(),
                  child: Text(
                    'Tambah Menu',
                    style: AppTextTheme.current.bodyTextWhite,
                  )),
            ),
          ],
        )),
      );
    });
  }
}
