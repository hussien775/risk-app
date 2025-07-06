import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk/core/app_theme_widget.dart';
import 'core/remote_helper/remote_request.dart';
import 'features/shares/presntation/page/appbar.dart';
import 'features/user/presntaion/page/examine_the_registration_stage_page.dart';
import 'generated/l10n.dart';
import 'package:risk/injection.dart' as di;

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark
    ),
  );
  RemoteRequest.initDio();
  await di.init();

  runApp(ProviderScope(child:const MyApp()));

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (_, __){
        return  MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: Locale("ar"),
          localizationsDelegates:const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          theme: lightTheme,
          //home: x(),
          home:    CheckTheStateSignOfUser(userLocalDataSource:di.sl() ,),
        );
      },
    );
  }
}
