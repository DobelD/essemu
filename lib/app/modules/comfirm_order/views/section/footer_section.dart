import 'package:essemu/app/components/button/app_button_primary.dart';
import 'package:essemu/app/data/order_rest.dart';
import 'package:essemu/app/modules/comfirm_order/controllers/comfirm_order_controller.dart';
import 'package:essemu/app/modules/comfirm_order/views/widget/send_notes.dart';
import 'package:essemu/app/themes/colors/colors.dart';
import 'package:essemu/app/themes/decoration/app_padding.dart';
import 'package:essemu/app/utils/extension/currency_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class FooterSection extends StatelessWidget {
  const FooterSection(
      {super.key,
      required this.id,
      required this.data,
      required this.address,
      required this.fee,
      required this.total});
  final int id;
  final Users data;
  final String address;
  final int fee;
  final int total;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ComfirmOrderController());
    return GetBuilder<ComfirmOrderController>(builder: (c) {
      String menu = '';
      String feeCurrency = fee.toCurrencyFormat();
      String totalCurrency = total.toCurrencyFormat();
      for (var item in controller.items) {
        menu += "${item.menu.name} - ${item.quantity}.\n";
      }
      return Container(
          height: 72.w,
          width: Get.height,
          color: kWhite,
          padding: DefaultPadding.all,
          child: Row(
            children: [
              Expanded(
                child: AppButtonPrimary(
                    label: 'Send Order',
                    onPressed: () => controller.toSend(id)),
              ),
              SizedBox(width: 10.w),
              SizedBox(
                  width: 38.w,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: kAlert1,
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.r))),
                      onPressed: () async {
                        SendNotes.direct("""

* Data Pesanan :
- Nama : ${data.name}
- No Hp : ${data.phone}
- Alamat : ${address}
*------------------------*
* Menu :
$menu
*------------------------*
* Delivery Fee : $feeCurrency
* Total : $totalCurrency

""");
                      },
                      child: Center(
                          child: Icon(IconlyLight.document, color: kWhite))))
            ],
          ));
    });
  }
}
