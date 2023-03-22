import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class HomeProvider extends ChangeNotifier{
  double ProgressWeb = 0;

  InAppWebViewController? inAppWebViewController;
  TextEditingController txtSearch = TextEditingController();

  void ChangeProgress(double progress){
    ProgressWeb = progress;
    notifyListeners();
  }
}