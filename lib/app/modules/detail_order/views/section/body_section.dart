import 'package:essemu/app/modules/detail_order/controllers/detail_order_controller.dart';
import 'package:essemu/app/modules/detail_order/views/section/status_seection.dart';
import 'package:essemu/app/themes/decoration/app_padding.dart';
import 'package:essemu/app/themes/decoration/app_radius.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/button/app_button_primary.dart';
import '../../../../themes/colors/colors.dart';
import 'item_section.dart';

class BodySection extends StatelessWidget {
  const BodySection(
      {super.key, required this.id, required this.fee, required this.idRest});
  final int id;
  final int fee;
  final int idRest;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
          minHeight: Get.height * 0.2, maxHeight: Get.height * 0.9),
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(color: kBlack, borderRadius: AppRadius.top),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              SizedBox(
                child: Column(
                  children: [
                    StatusSection(
                      fee: fee,
                    ),
                    ItemSection(
                      id: id,
                      fee: fee,
                    ),
                    SizedBox(
                      height: 60,
                    )
                  ],
                ),
              ),
              Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: GetBuilder<DetailOrderController>(builder: (c) {
                    return Container(
                      width: Get.width,
                      padding: DefaultPadding.all,
                      color: kWhite,
                      child: AppButtonPrimary(
                        label: c.status == 'tolak'
                            ? 'Batalkan Pesanan'
                            : 'Terima Pesanan',
                        onPressed: () => c.onOrderSuccess(idRest),
                      ),
                    );
                  }))
            ],
          ),
        ),
      ),
    );
  }
}
