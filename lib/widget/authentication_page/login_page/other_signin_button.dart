import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

import '../../../core/static_assets.dart';

class OtherSignButtons extends StatelessWidget {
  const OtherSignButtons({
    super.key, required this.index,
  });


  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.black)),
      child: Image(
        image: Svg(StaticAssets.getAssetAddr(index)),
      ),
    );
  }
}
