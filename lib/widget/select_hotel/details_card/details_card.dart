import 'package:flutter/material.dart';
import 'package:hotel/extentions/extentions.dart';

class DetailsCard extends StatelessWidget {
  const DetailsCard({
    super.key,
    required this.childrenList,
  });

  final List<Widget> childrenList;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        primary: false,
        padding: 16.pH,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
        crossAxisCount: 4,
        children: childrenList);
  }
}
