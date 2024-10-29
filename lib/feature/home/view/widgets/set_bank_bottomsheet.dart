import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/providers.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../../core/widgets/centred_text_button.dart';

void setBankAccountBottomsheet(BuildContext context, WidgetRef ref) {
  final colors = Theme.of(context).extension<AppColorsTheme>()!;
  final homePageState = ref.read(homePageProvider);
  ref.read(bs3Provider.notifier).state = true;
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
        height: 60.h,
        color: colors.thirdBS,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.defaultTextBold(
                      homePageState.items[2].openState.body.title,
                      size: 16.sp,
                      context: context),
                  SizedBox(
                    height: 2.h,
                  ),
                  AppText.subtitleDefault(
                      homePageState.items[2].openState.body.subtitle,
                      size: 15.sp,
                      color: Colors.grey,
                      context: context),
                  SizedBox(
                    height: 3.h,
                  ),
                  Consumer(builder: (context, ref, child) {
                    return SizedBox(
                      width: double.infinity,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount:
                            homePageState.items[2].openState.body.items.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: () {
                              ref.read(bankOptionProvider.notifier).state =
                                  index;
                            },
                            leading: homePageState.items[2].openState.body
                                        .items[index].icon ==
                                    ""
                                ? Container(
                                    height: 6.h,
                                    width: 12.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.white),
                                  )
                                : Image.network(homePageState
                                    .items[2].openState.body.items[index].icon),
                            title: AppText.defaultTextBold(
                              context: context,
                              homePageState
                                  .items[2].openState.body.items[index].title,
                              size: 16.sp,
                              color: Colors.white,
                            ),
                            subtitle: AppText.subtitleDefault(
                                homePageState.items[2].openState.body
                                    .items[index].subtitle
                                    .toString(),
                                color: Colors.grey,
                                size: 15.sp,
                                context: context),
                            trailing: Container(
                              height: 3.h,
                              width: 6.w,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.white),
                                shape: BoxShape.circle,
                                color: ref.watch(bankOptionProvider) == index
                                    ? Colors.green
                                    : Colors.transparent,
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }),
                  SizedBox(
                    height: 1.h,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      alignment: Alignment.center,
                      width: 40.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(width: 1, color: Colors.white)),
                      child: Text(
                        homePageState.items[2].openState.body.footer,
                        style: TextStyle(color: Colors.white, fontSize: 14.sp),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const Expanded(child: SizedBox()),
            CenteredTextButton.primary(
                width: double.infinity,
                label: homePageState.items[2].ctaText,
                onTap: () {},
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
    () => ref.watch(bs3Provider.notifier).state = false,
  );
}
