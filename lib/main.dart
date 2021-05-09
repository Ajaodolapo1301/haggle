import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:haggle/screen/login.dart';
import 'package:haggle/utils/sizeConfig/sizeConfig.dart';
import 'package:provider/provider.dart';

import 'Provider/appState.dart';

void main() {
  runApp(
      DevicePreview(
          enabled: true,
          builder: (context) =>
              MultiProvider(
                  providers: [
                    ChangeNotifierProvider(create: (_) => AppState()),


                  ],
                  child: MyApp(
                    // hasUserUsedApp: hasUserUsedApp,
                  )))

  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    final HttpLink httpLink = HttpLink(
      uri: 'https://hagglex-backend-staging.herokuapp.com/graphql',
      // headers: {
      //   'X-Parse-Application-Id': kParseApplicationId,
      //   'X-Parse-Client-Key': kParseClientKey,
      //   'X-Parse-Master-Key': kParseMasterKey,
      //   //'X-Parse-REST-API-Key' : kParseRestApiKey,
      // }, //getheaders()
    );

    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
        link: httpLink,
      ),
    );

    return LayoutBuilder(
        builder: (context, constraints){
          return OrientationBuilder(
            builder: (context, orientation){
              SizeConfig().init(constraints, orientation);
              return GestureDetector(
                onTap: (){
                  FocusScopeNode currentFocus = FocusScope.of(context);

                  if (!currentFocus.hasPrimaryFocus &&
                      currentFocus.focusedChild != null) {
                    currentFocus.focusedChild.unfocus();
                  }

                },
                child: GraphQLProvider(
                  client: client,
                  child: CacheProvider(
                    child: MaterialApp(
                        debugShowCheckedModeBanner: false,
                        title: 'Haggle',
                        theme: ThemeData(
                            primarySwatch: Colors.deepPurple,
                            fontFamily: 'BasisGrotesquePro'
                          // primarySwatch: Colors.blue,
                        ),
                        home: Login()
                    ),
                  ),
                ),
              );
            },

          );
        },
    );
  }
}


