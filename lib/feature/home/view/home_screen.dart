import 'package:cred_assignment/core/providers.dart';
import 'package:cred_assignment/core/widgets/centred_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import '../../../core/utils/app_constants.dart';
import '../../../core/widgets/app_text.dart';
import 'widgets/credit_amt_bottomsheet.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final colors = Theme.of(context).extension<AppColorsTheme>()!;
    final prov = ref.read(homePageProvider.notifier);
    prov.fetchData();

    return SafeArea(
        child: Scaffold(
      body: Center(
        child: CenteredTextButton.primary(
          context: context,
          label: 'Credit Amount',
          onTap: () {
            ref.read(bs1Provider.notifier).state = true;
            showCreditAmtBottomSheet(context, ref);
          },
        ),
      ),
    ));
  }
}
