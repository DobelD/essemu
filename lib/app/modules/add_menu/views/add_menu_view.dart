import 'package:essemu/app/components/loading_action/loading_action.dart';
import 'package:essemu/app/routes/app_pages.dart';
import 'package:essemu/app/themes/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../components/dropdown/drop_kategori.dart';
import '../../../components/textfield/desk_form.dart';
import '../../../components/textfield/form.dart';
import '../../../themes/decoration/app_padding.dart';
import '../../../themes/decoration/app_radius.dart';
import '../../../themes/typograpy/typo.dart';
import '../controllers/add_menu_controller.dart';
import 'widget/image_pick.dart';

class AddMenuView extends GetView<AddMenuController> {
  const AddMenuView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddMenuController());
    return GetBuilder<AddMenuController>(builder: (c) {
      return AppLoading(
        isLoading: c.isLoading,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: kWhite,
            surfaceTintColor: kWhite,
            centerTitle: true,
            title: Text(
              'Add Menu',
              style: AppTextTheme.current.appBarTitleDark,
            ),
          ),
          body: ListView(
            padding: DefaultPadding.all,
            children: [
              FormTxt(
                controller: controller.namaC,
                title: 'Nama',
                hint: 'Menu',
              ),
              SizedBox(height: 12.h),
              DeskForm(
                controller: controller.deskC,
                title: 'Deskripsi',
                hint: 'Deskripsi',
              ),
              SizedBox(height: 12.h),
              FormTxt(
                controller: controller.hargaC,
                title: 'Harga',
                hint: 'Harga',
              ),
              SizedBox(height: 12.h),
              DropKategori(
                trailling: true,
                textTrailling: 'Add Category',
                onTap: () => Get.toNamed(Routes.ADD_CATEGORY),
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
                    onPressed: () => controller.addMenu(),
                    child: Text(
                      'Tambah Menu',
                      style: AppTextTheme.current.bodyTextWhite,
                    )),
              ),
            ],
          ),
        ),
      );
    });
  }
}
