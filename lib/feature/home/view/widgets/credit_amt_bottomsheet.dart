import 'package:cred_assignment/core/widgets/app_text.dart';
import 'package:cred_assignment/feature/home/view/widgets/repay_options_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/providers.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/widgets/centred_text_button.dart';
import '../circular_slider_widgets/circular_slider.dart';

void showCreditAmtBottomSheet(BuildContext context, WidgetRef ref) {
  final colors = Theme.of(context).extension<AppColorsTheme>()!;
  final prov = ref.read(homePageProvider.notifier);
  showModalBottomSheet(
    useRootNavigator: true,
    anchorPoint: const Offset(0, 150),
    enableDrag: true,
    isDismissible: true,
    isScrollControlled: true,
    useSafeArea: true,
    context: context,
    builder: (ctx) {
      return Consumer(builder: (context, ref, child) {
        ref.read(bs1Provider.notifier).state = true;
        final homePageState = ref.watch(homePageProvider);
        return Container(
          width: double.infinity,
          height: 80.h,
          color: colors.firstBS,
          child: homePageState.items.isEmpty
              ? (const Center(child: CircularProgressIndicator()))
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText.defaultTextBold(
                              ref.watch(bs2Provider)
                                  ? homePageState.items[0].closedState.body.key1
                                  : homePageState.items[0].openState.body.title,
                              size: 16.sp,
                              context: context),
                          SizedBox(
                            height: 1.h,
                          ),
                          AppText.subtitleDefaultBold(
                              ref.watch(bs2Provider)
                                  ? '₹${prov.creditAmount.toStringAsFixed(0)}'
                                  : homePageState
                                      .items[0].openState.body.subtitle,
                              size: ref.watch(bs2Provider.notifier).state
                                  ? 17.sp
                                  : 15.sp,
                              color: Colors.grey,
                              context: context),
                          SizedBox(
                            height: 3.h,
                          ),
                          Container(
                            height: 50.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                  height: 0.5.h,
                                ),
                                RadialSliderScreen(
                                    cardData: homePageState
                                        .items[0].openState.body.card),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: AppText.subtitleDefault(
                                      textAlign: TextAlign.center,
                                      size: 14.sp,
                                      color: Colors.grey,
                                      homePageState
                                          .items[0].openState.body.footer,
                                      context: context),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    CenteredTextButton.primary(
                        width: double.infinity,
                        label: homePageState.items[0].ctaText,
                        onTap: () {
                          ref.read(bs2Provider.notifier).state = true;
                          showRepayOptionsBottomSheet(context, ref);
                        },
                        topLeftradius: 25,
                        topRightradius: 25,
                        bottomLeftradius: 0,
                        bottomRightradius: 0,
                        context: context)
                  ],
                ),
        );
      });
    },
  ).whenComplete(
    () => ref.read(bs1Provider.notifier).state = false,
  );
}
