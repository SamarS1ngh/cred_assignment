import 'package:cred_assignment/feature/home/view/widgets/set_bank_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/providers.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../../core/widgets/centred_text_button.dart';

void showRepayOptionsBottomSheet(BuildContext context, WidgetRef ref) {
  ref.read(bs2Provider.notifier).state = true;
  final colors = Theme.of(context).extension<AppColorsTheme>()!;
  final homePageState = ref.read(homePageProvider);
  showModalBottomSheet(
    useRootNavigator: true,
    anchorPoint: const Offset(0, 150),
    enableDrag: true,
    isDismissible: true,
    isScrollControlled: true,
    useSafeArea: true,
    context: context,
    builder: (context) {
      return Container(
        width: double.infinity,
        height: 70.h,
        color: colors.secondBS,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.h),
              child: Consumer(builder: (context, ref, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText.defaultTextBold(
                        ref.watch(bs3Provider)
                            ? homePageState.items[1].closedState.body.key1
                            : homePageState.items[1].openState.body.title,
                        size: 16.sp,
                        context: context),
                    SizedBox(
                      height: 2.h,
                    ),
                    AppText.subtitleDefault(
                        ref.watch(bs3Provider)
                            ? homePageState.items[1].closedState.body.key2
                            : homePageState.items[1].openState.body.subtitle,
                        size: 15.sp,
                        color: Colors.grey,
                        context: context),
                    SizedBox(
                      height: 3.h,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 25.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            homePageState.items[1].openState.body.items.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                ref.read(emiOptionsProvider.notifier).state =
                                    index;
                              },
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Container(
                                    height: 20.h,
                                    width: 35.w,
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: ref
                                            .read(homePageProvider.notifier)
                                            .colors[index]),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        const SizedBox(),
                                        Container(
                                          height: 3.h,
                                          width: 6.w,
                                          decoration: BoxDecoration(
                                              color: ref.watch(
                                                          emiOptionsProvider) ==
                                                      index
                                                  ? Colors.green
                                                  : Colors.transparent,
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  width: 1,
                                                  color: Colors.white)),
                                        ),
                                        AppText.defaultTextBold(
                                            homePageState.items[1].openState
                                                .body.items[index].emi,
                                            size: 17.sp,
                                            context: context),
                                        AppText.defaultText(
                                            homePageState.items[1].openState
                                                .body.items[index].duration,
                                            size: 15.sp,
                                            context: context),
                                        AppText.defaultText(
                                            homePageState.items[1].openState
                                                .body.items[index].subtitle,
                                            size: 13.sp,
                                            context: context)
                                      ],
                                    ),
                                  ),
                                  Visibility(
                                    visible: homePageState.items[1].openState
                                            .body.items[index].tag !=
                                        "",
                                    child: Positioned(
                                      top: -1.h,
                                      right: 6.w,
                                      child: Material(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        elevation: 8,
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: 3.h,
                                          width: 25.w,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: AppText.defaultTextBold(
                                            homePageState.items[1].openState
                                                .body.items[index].tag,
                                            context: context,
                                            size: 13.sp,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        alignment: Alignment.center,
                        width: 40.w,
                        // height: 4.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(width: 1, color: Colors.white)),
                        child: Text(
                          'Create your own plan',
                          style:
                              TextStyle(color: Colors.white, fontSize: 14.sp),
                        ),
                      ),
                    )
                  ],
                );
              }),
            ),
            const Expanded(child: SizedBox()),
            CenteredTextButton.primary(
                width: double.infinity,
                label: homePageState.items[1].ctaText,
                onTap: () {
                  setBankAccountBottomsheet(context, ref);
                },
                topLeftradius: 25,
                topRightradius: 25,
                bottomLeftradius: 0,
                bottomRightradius: 0,
                context: context)
          ],
        ),
      );
    },
  ).whenComplete(
    () => ref.watch(bs2Provider.notifier).state = false,
  );
}
