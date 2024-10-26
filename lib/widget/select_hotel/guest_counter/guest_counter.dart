import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/extentions/extentions.dart';

import '../../../core/color.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({
    super.key,
    required this.title,
    required this.counterSize,
    required this.incrementFunc,
   required this.decrementFunc,
  });

  final String title;
  final RxInt counterSize;
  final void Function()? incrementFunc;
  final void Function()? decrementFunc;

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: Get.textTheme.labelMedium!.copyWith(
              color: ColorConstants.black, fontWeight: FontWeight.bold),
        ),
        2.yh,
        Container(
          padding: 16.pH,
          height: 8.h,
          width: 44.w,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1.0),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(ColorConstants.grey),
                ),
                onPressed: widget.decrementFunc,
                icon: Icon(
                  Icons.remove,
                  color: ColorConstants.black,
                ),
              ),
              2.xw,
                Obx(() => Text(
                '${widget.counterSize.value}',
                style: Get.textTheme.labelLarge!.copyWith(
                    color: ColorConstants.black, fontWeight: FontWeight.bold),
              ),),
              2.xw,
              IconButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(ColorConstants.grey),
                ),
                onPressed: widget.incrementFunc,
                icon: Icon(
                  Icons.add,
                  color: ColorConstants.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
