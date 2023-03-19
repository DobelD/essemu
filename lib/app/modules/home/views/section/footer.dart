import 'package:essemu/app/themes/decoration/app_padding.dart';
import 'package:flutter/material.dart';

import '../../../../themes/typograpy/typo.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Padding(
            padding: DefaultPadding.all,
            child: Center(
                child: Text(
              'Menu hanya ini',
              style: AppTextTheme.current.bodyText,
            ))));
  }
}
