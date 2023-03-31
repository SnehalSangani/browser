import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';


class Homeprovider extends ChangeNotifier
{
  InAppWebViewController? inAppWebViewController;
  double changedprogress=0;

  void onprogresschnaged(double progress)
  {
    changedprogress=progress;
    notifyListeners();
  }
}