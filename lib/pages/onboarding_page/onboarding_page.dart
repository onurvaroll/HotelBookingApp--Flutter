import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/extentions/extentions.dart';
import '../../core/color.dart';
import '../../widget/onboarding_page/custom_clipper.dart';
import '../../widget/onboarding_page/page_list_controller.dart';
import '../authentication/authentication_page.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentIndex = 0;
  PageController _controller=PageController();

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _controller,
        itemCount: OnboardingList().onboardingList.length,
        onPageChanged: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemBuilder: (context, index) => Stack(
            children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: ClipPath(
              clipper: CustomShapeClipper(),
              child: SizedBox(
                width: 100.w,
                height: 100.w,
                child: Image.asset(
                  OnboardingList().onboardingList[currentIndex].imageAsset,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: 100.w * 0.6,
            left: 16,
            child: Text(
              OnboardingList().onboardingList[currentIndex].trailerText,
              style: Get.textTheme.titleMedium!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                height:
                    1.1,
              ),
            ),
          ),
          Positioned(
            bottom: 4,
            right: 16,
            left: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  OnboardingList().onboardingList[currentIndex].contentText,
                  style: Get.textTheme.labelSmall!
                      .copyWith(color: ColorConstants.black),
                  softWrap: true,
                  maxLines: null,
                ),
                2.yh,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    OnboardingList().onboardingList.length,
                    (index) => pageRange(index, context),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                   if(currentIndex==OnboardingList().onboardingList.length-1){
                     Navigator.push(context, MaterialPageRoute(builder: (context) => const AuthenticationPage() ));
                   }
                   _controller.nextPage(
                     duration: const Duration(milliseconds: 100),
                     curve: Curves.bounceIn,
                   );
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(ColorConstants.black),
                  ),
                  child: Text(
                      "Next",
                      style: Get.textTheme.labelMedium),
                ),
                2.yh,
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const AuthenticationPage() ));
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(ColorConstants.grey),
                  ),
                  child: Text(
                    "Skip",
                    style: Get.textTheme.labelMedium,
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  pageRange(int index, BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          currentIndex=index;
        });
      },
      child: Container(
        height: 10,
        width: currentIndex == index ? 25 : 10,
        margin: 5.pAll,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: ColorConstants.black),
      ),
    );
  }
}
