// ignore_for_file: use_key_in_widget_constructors, avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class Ads extends StatefulWidget {

  @override
  _AdsState createState() => _AdsState();
}

class _AdsState extends State<Ads> {

  BannerAd? myBanner;
  @override
  void initState() {
    super.initState();
    myBanner = BannerAd(
      adUnitId: 'ca-app-pub-6506859987853518/8844554031',
      // adUnitId: 'ca-app-pub-6506859987853518/8159185997', // firstAdd
      // adUnitId: 'ca-app-pub-3940256099942544/6300978111', //test Add
      size: AdSize.banner,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          print('$BannerAd loaded.');
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          print('$BannerAd failedToLoad da : $error');
        },
        onAdOpened: (Ad ad) => print('$BannerAd onAdOpened.'),
        onAdClosed: (Ad ad) => print('$BannerAd onAdClosed.'),
        onAdWillDismissScreen: (Ad ad) => print('$BannerAd onApplicationExit.'),
      ),
    );
    myBanner?.load();
  }

  @override
  void dispose() {
    super.dispose();
    myBanner?.dispose();
    // myBanner = null;
  }
  
  @override
  Widget build(BuildContext context) {
   final AdWidget adWidget = AdWidget(ad: myBanner!);
    return Center(
      child: adWidget,
    );
  }
}
