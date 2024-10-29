import 'package:cred_assignment/feature/home/model/bank.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../feature/home/view_model/provider_1.dart';

final homePageProvider = NotifierProvider<HomePageVM, Bank>(() {
  return HomePageVM();
});

final bs1Provider = StateProvider<bool>((ref) {
  return false;
});
final bs2Provider = StateProvider<bool>((ref) {
  return false;
});
final bs3Provider = StateProvider<bool>((ref) {
  return false;
});

final emiOptionsProvider = StateProvider<int?>((ref) {
  return null;
});

final bankOptionProvider = StateProvider<int?>((ref) {
  return null;
});
