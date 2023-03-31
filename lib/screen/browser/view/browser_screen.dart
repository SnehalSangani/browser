import 'package:browser/screen/browser/provider/browser_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  Homeprovider? homeprovidertrue;
  Homeprovider? homeproviderfalse;
  TextEditingController search=TextEditingController();
  PullToRefreshController? pullToRefreshController;
  @override
  void initState() {
    pullToRefreshController=PullToRefreshController(
      onRefresh: () {
        homeprovidertrue!.inAppWebViewController!.reload();
      },
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    homeprovidertrue=Provider.of<Homeprovider>(context,listen: true);
    homeproviderfalse=Provider.of<Homeprovider>(context,listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.topCenter,
                    child: TextField(
                      controller: search,
                      decoration: InputDecoration(
                        border: InputBorder.none,

                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.search,color: Colors.white,
                  ),
                  onPressed: () {
                    String newLink = search.text;
                    homeprovidertrue!.inAppWebViewController?.loadUrl(
                      urlRequest: URLRequest(
                        url: Uri.parse(
                          "https://www.google.com/search?q=$newLink",
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            LinearProgressIndicator(value: homeprovidertrue!.changedprogress ),

            Expanded(
              child: InAppWebView(
                initialUrlRequest:
                URLRequest(url: Uri.parse("https://www.google.com/")),
                onWebViewCreated: (controller) {
                  homeprovidertrue!.inAppWebViewController = controller;
                },
                onLoadError: (controller, url, code, message) {
                  homeprovidertrue!.inAppWebViewController = controller;
                },
                onLoadStart: (controller, url) {
                  homeprovidertrue!.inAppWebViewController = controller;
                },
                onLoadStop: (controller, url) {
                  homeprovidertrue!.inAppWebViewController = controller;
                },
                onProgressChanged: (controller, progress) {
                  homeproviderfalse!.onprogresschnaged(progress/100);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                        onTap: () {
                          homeprovidertrue!.inAppWebViewController!.goBack();
                        },
                        child: Icon(Icons.arrow_back,color: Colors.white,)),
                    SizedBox(
                      width: 50,
                    ),
                    InkWell(
                        onTap: () {
                          homeprovidertrue!.inAppWebViewController!.reload();
                        },
                        child: Icon(Icons.refresh,color: Colors.white,)),
                    SizedBox(
                      width: 50,
                    ),
                    InkWell(
                        onTap: () {
                          homeprovidertrue!.inAppWebViewController!.goForward();
                        },
                        child: Icon(Icons.arrow_forward_outlined,color: Colors.white,)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}