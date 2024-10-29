import 'dart:math';
import 'dart:ui';
import 'package:cred_assignment/data/remote/network/api_endpoints.dart';
import 'package:cred_assignment/data/remote/network/api_network_constants.dart';
import 'package:cred_assignment/data/remote/network/base_api_service.dart';
import 'package:cred_assignment/data/remote/network/network_api_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/bank.dart';

class HomePageVM extends Notifier<Bank> {
  bool isLoading = false;
  bool isFirstBSOpen = false;
  bool isSecondBSOpen = false;
  bool isThirdBSOpen = false;
  BaseApiService repo = NetworkApiService();
  double creditAmount = 500.0;

  List<Color> colors = [
    const Color(0xff44323a),
    const Color(0xff7a6f8d),
    const Color(0xff50698b)
  ];
  Bank bankData = Bank(items: []);
  @override
  Bank build() {
    return bankData;
  }

  void bs1Open() {
    isFirstBSOpen = true;
  }

  void bs1Close() {
    isFirstBSOpen = false;
    creditAmount = 500;
  }

  void bs2Open() {
    print('opened');
    isSecondBSOpen = true;
  }

  void bs2Close() {
    isSecondBSOpen = false;
    print('closed');
  }

  void bs3Open() {
    isThirdBSOpen = true;
  }

  void bs3Close() {
    isThirdBSOpen = false;
  }

  fetchData() async {
    final response = await repo
        .getResponse(APINetworkConstants.baseURL + ApiEndPoints.tempUrl);
    state = Bank.fromJson(response);
  }

  Color getRandomColor() {
    final Random random = Random();
    return Color.fromARGB(
      255, // Alpha value (opacity)
      random.nextInt(256), // Red value
      random.nextInt(256), // Green value
      random.nextInt(256), // Blue value
    );
  }
}
