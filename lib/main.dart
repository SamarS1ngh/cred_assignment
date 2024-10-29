import 'package:cred_assignment/Routes/app_router_config.dart';
import 'package:cred_assignment/core/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'data/local/local_storage_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await LocalStorageService.init();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
        theme: Theme.of(context).copyWith(
            appBarTheme: AppBarTheme(
                actionsIconTheme: const IconThemeData(color: Colors.white),
                iconTheme: const IconThemeData(color: Colors.white),
                backgroundColor: AppColorsTheme.dark().bgColor),
            scaffoldBackgroundColor: AppColorsTheme.dark().bgColor,
            extensions: [
              AppColorsTheme.dark(),
              AppTypography.main(),
              AppDimensionsTheme.main(View.of(context))
            ]),
      );
    });
  }
}
