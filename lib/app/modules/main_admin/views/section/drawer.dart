// import 'package:essemu/app/modules/main_admin/controllers/main_admin_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:iconly/iconly.dart';

// import '../../../../themes/colors/colors.dart';
// import '../../../../themes/decoration/app_padding.dart';
// import '../../../../themes/decoration/app_radius.dart';
// import '../../../../themes/typograpy/typo.dart';
// import '../widget/item_main_menu.dart';

// class Drawers extends StatelessWidget {
//   const Drawers({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(MainAdminController());
//     return GetBuilder<MainAdminController>(builder: (c) {
//       return Drawer(
//           backgroundColor: kMain,
//           child: ListView(
//             padding: DefaultPadding.all,
//             children: [
//               SizedBox(height: 16.h),
//               Align(
//                 alignment: Alignment.centerRight,
//                 child: IconButton(
//                     onPressed: () => Get.back(),
//                     icon: Icon(IconlyLight.close_square, color: kWhite)),
//               ),
//               SizedBox(height: 4.h),
//               Row(
//                 children: [
//                   Container(
//                     height: 56.w,
//                     width: 96.w,
//                     decoration: BoxDecoration(
//                         image: DecorationImage(
//                             image: AssetImage('assets/images/logo.png'))),
//                   )
//                 ],
//               ),
//               SizedBox(height: 16.h),
//               Text('Main Menu', style: AppTextTheme.current.bodyTextWhite),
//               SizedBox(height: 8.h),
//               Divider(color: kSoftGrey, height: 0, thickness: 1),
//               SizedBox(height: 16.h),
//               ItemMainMenu(
//                 icon: IconlyLight.home,
//                 label: 'Dashboard',
//                 id: 0,
//                 selected: controller.currentPage == DrawerSections.dashboard
//                     ? true
//                     : false,
//               ),
//               ItemMainMenu(
//                 icon: IconlyLight.plus,
//                 label: 'Tambah Kategori',
//                 id: 1,
//                 selected:
//                     controller.currentPage == DrawerSections.tambah_kategori
//                         ? true
//                         : false,
//               ),
//               ItemMainMenu(
//                 icon: IconlyLight.plus,
//                 label: 'Tambah Menu',
//                 id: 2,
//                 selected: controller.currentPage == DrawerSections.tambah_menu
//                     ? true
//                     : false,
//               ),
//               ItemMainMenu(
//                 icon: IconlyLight.plus,
//                 label: 'Ongkos Kirim',
//                 id: 3,
//                 selected: controller.currentPage == DrawerSections.ongkos_kirim
//                     ? true
//                     : false,
//               ),
//               SizedBox(height: 16.h),
//               Text('Preference', style: AppTextTheme.current.bodyTextWhite),
//               SizedBox(height: 8.h),
//               Divider(color: kSoftGrey, height: 0, thickness: 1),
//               SizedBox(height: 16.h),
//               ItemMainMenu(
//                 icon: IconlyLight.setting,
//                 label: 'Setting',
//                 id: 4,
//                 selected: controller.currentPage == DrawerSections.setting
//                     ? true
//                     : false,
//               ),
//               ItemMainMenu(
//                 icon: IconlyLight.setting,
//                 label: 'About',
//                 id: 5,
//                 selected: controller.currentPage == DrawerSections.about
//                     ? true
//                     : false,
//               ),
//               SizedBox(height: 46.h),
//               SizedBox(height: 16.h),
//               Divider(color: kSoftGrey, height: 0, thickness: 1),
//               SizedBox(height: 16.h),
//               Align(
//                 alignment: Alignment.bottomCenter,
//                 child: SizedBox(
//                     height: 48.h,
//                     child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.transparent,
//                             foregroundColor: kSoftRed,
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: AppRadius.all)),
//                         onPressed: () => controller.logout(),
//                         child: Row(
//                           children: [
//                             Icon(IconlyLight.logout, color: kWhite),
//                             SizedBox(width: 16.w),
//                             Text(
//                               'Logout',
//                               style: AppTextTheme.current.bodyTextWhite,
//                             )
//                           ],
//                         ))),
//               ),
//               SizedBox(height: 16.h),
//               Center(
//                   child: Text('Essemu App V 1.0',
//                       style: AppTextTheme.current.bodyTextWhite)),
//             ],
//           ));
//     });
//   }
// }
