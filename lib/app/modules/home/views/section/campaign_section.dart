import 'package:carousel_slider/carousel_slider.dart';
import 'package:essemu/app/modules/home/controllers/home_controller.dart';
import 'package:essemu/app/themes/decoration/app_padding.dart';
import 'package:essemu/app/themes/decoration/app_radius.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/shimmer/campaign.dart';

class CampaignSection extends StatelessWidget {
  const CampaignSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return SliverToBoxAdapter(child: GetBuilder<HomeController>(builder: (c) {
      return c.loading
          ? CampaignLoading()
          : CarouselSlider(
              options: CarouselOptions(
                height: 180,
                aspectRatio: 16 / 9,
                viewportFraction: 1,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 5),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: false,
                enlargeFactor: 0.3,
                scrollDirection: Axis.horizontal,
              ),
              items: controller.campaign.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Padding(
                      padding: DefaultPadding.side,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: AppRadius.all,
                            image: DecorationImage(
                                image: NetworkImage(
                                    "${c.publicUrlCampaign}${i.name}"),
                                fit: BoxFit.cover)),
                      ),
                    );
                  },
                );
              }).toList(),
            );
    }));
  }
}
