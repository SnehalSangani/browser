import 'package:browser/screen/browser/provider/browser_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screen/browser/view/browser_screen.dart';
void main()
{
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Homeprovider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context) => home(),
        },
      ),
    )
  );
}