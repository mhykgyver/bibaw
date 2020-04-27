import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/util/constants.dart';
import 'core/util/simple_bloc_delegate.dart';
import 'features/app/presentation/pages/app_page.dart';
import 'injection_container.dart' as di;

void main() async {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        accentColor: kAccentColor,
        ),
      home: AppPage(),
    );
  }
}
