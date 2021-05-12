import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:haggle/GraphQlConfig.dart';
import 'package:haggle/screen/Homepage.dart';
import 'package:haggle/screen/home.dart';
import 'package:haggle/screen/login.dart';
import 'package:haggle/utils/sizeConfig/dev_utils.dart';
import 'package:haggle/utils/sizeConfig/sizeConfig.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import 'Provider/appState.dart';
import 'model/user.dart';

import 'package:path_provider/path_provider.dart' as path_provider;

GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();

  Hive.init(appDocumentDirectory.path);

  Hive.registerAdapter(UserAdapter());

  await Hive.openBox("user");
  final box = Hive.box("user");
  User user = box.get('user', defaultValue: null);
  runApp(DevicePreview(
      enabled: false,
      builder: (context) => MultiProvider(providers: [
            ChangeNotifierProvider(create: (_) => AppState()),
          ], child: MyApp(user: user,))));
}

class MyApp extends StatelessWidget {
  final User user;
  MyApp({this.user});
  @override
  Widget build(BuildContext context) {
    setStatusBarColor(color: BarColor.black);
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return GestureDetector(
              onTap: () {
                FocusScopeNode currentFocus = FocusScope.of(context);

                if (!currentFocus.hasPrimaryFocus &&
                    currentFocus.focusedChild != null) {
                  currentFocus.focusedChild.unfocus();
                }
              },
              child: GraphQLProvider(
                client: graphQLConfiguration.client,
                child: CacheProvider(
                  child: MaterialApp(
                      debugShowCheckedModeBanner: false,
                      title: 'Haggle',
                      theme: ThemeData(
                          primarySwatch: Colors.deepPurple,
                          fontFamily: 'BasisGrotesquePro'
                          // primarySwatch: Colors.blue,
                          ),
                      home: Login()),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
