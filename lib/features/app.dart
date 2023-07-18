import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olinio_test/features/bloc/contacts_bloc.dart';
import 'package:olinio_test/features/home/home_page.dart';
import 'package:olinio_test/main.dart';
import 'package:olinio_test/models/country.dart';
import 'package:olinio_test/repository/contact_service.dart';
import 'package:olinio_test/utils/helpers.dart';

List<Country> countries = [];

class App extends StatelessWidget {
  const App({super.key});

  void getCountries() async {
    countries = await getIt<ContactService>().getAllCountries();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return BlocProvider(
      create: (_) => ContactsBloc(),
      child: ScreenUtilInit(
          designSize: appDefaultDesignSize,
          builder: (context, child) {
            getCountries();
            return const MaterialApp(
              title: 'Olinio',
              home: HomePage(),
            );
          }),
    );
  }
}
