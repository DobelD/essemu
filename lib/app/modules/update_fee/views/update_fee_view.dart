import 'package:essemu/app/modules/update_fee/views/section/fee_section.dart';
import 'package:essemu/app/themes/decoration/app_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import 'package:get/get.dart';

import '../../../components/loading_action/loading_action.dart';
import '../../../themes/colors/colors.dart';
import '../../../themes/typograpy/typo.dart';
import '../controllers/update_fee_controller.dart';
import 'section/courier_section.dart';
import 'section/footer_section.dart';

class UpdateFeeView extends GetView<UpdateFeeController> {
  const UpdateFeeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityProvider(
      child: GetBuilder<UpdateFeeController>(builder: (c) {
        return AppLoading(
          isLoading: c.isLoading,
          child: Scaffold(
            backgroundColor: kMainBackground,
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: Text(
                'Update Delivery',
                style: AppTextTheme.current.appBarTitleDark,
              ),
              centerTitle: true,
              backgroundColor: kWhite,
            ),
            body: CustomScrollView(
              slivers: [
                FeeSection(),
                SliverToBoxAdapter(
                    child: Padding(
                  padding: DefaultPadding.side,
                  child: Divider(
                    height: 0,
                    thickness: 6,
                    color: kGrey1,
                  ),
                )),
                CourierSection()
              ],
            ),
            bottomSheet: FooterSection(),
          ),
        );
      }),
    );
  }
}
