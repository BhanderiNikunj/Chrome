import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/Screen/Home/HomePageProvider/HomePageProvider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeProvider? homeProvidertrue;
  HomeProvider? homeProviderfalse;

  @override
  Widget build(BuildContext context) {
    homeProviderfalse = Provider.of<HomeProvider>(context, listen: false);
    homeProvidertrue = Provider.of<HomeProvider>(context, listen: true);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          homeProviderfalse!.inAppWebViewController!.goBack();
                        },
                        icon: Icon(Icons.arrow_back),
                      ),
                      IconButton(
                        onPressed: () {
                          homeProviderfalse!.inAppWebViewController!.reload();
                        },
                        icon: Icon(Icons.refresh),
                      ),
                      IconButton(
                        onPressed: () {
                          homeProviderfalse!.inAppWebViewController!
                              .goForward();
                        },
                        icon: Icon(Icons.arrow_forward),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      height: 70,
                      width: 250,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black26,
                              blurRadius: 2,
                              spreadRadius: 2),
                        ],
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: TextField(
                        controller: homeProviderfalse!.txtSearch,
                        decoration: InputDecoration(
                          prefixIcon: IconButton(
                            onPressed: () {
                              var NewLink = homeProvidertrue!.txtSearch.text;
                              homeProvidertrue!.inAppWebViewController!.loadUrl(
                                urlRequest: URLRequest(
                                  url: Uri.parse(
                                      "https://www.google.com/search?q=$NewLink"),
                                ),
                              );
                            },
                            icon: Icon(Icons.search),
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            LinearProgressIndicator(
              color: Colors.black,
              value: homeProvidertrue!.ProgressWeb,
            ),
            SizedBox(height: 2),
            Expanded(
              child: InAppWebView(
                initialUrlRequest: URLRequest(
                  url: Uri.parse("https://www.google.com/"),
                ),
                onWebViewCreated: (controller) {
                  homeProvidertrue!.inAppWebViewController = controller;
                },
                onLoadError: (controller, url, code, message) {
                  homeProvidertrue!.inAppWebViewController = controller;
                },
                onLoadStart: (controller, url) {
                  homeProvidertrue!.inAppWebViewController = controller;
                },
                onLoadStop: (controller, url) {
                  homeProvidertrue!.inAppWebViewController = controller;
                },
                onProgressChanged: (controller, progress) {
                  homeProviderfalse!.ChangeProgress(progress / 100);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
