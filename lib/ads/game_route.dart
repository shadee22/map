import 'package:flutter/material.dart';
import 'package:meowing/ads/helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class Gamer extends StatefulWidget {
  @override
  _GamerState createState() => _GamerState();
}

class _GamerState extends State<Gamer>  {
   late BannerAd _bannerAd;
     bool _isBannerAdReady = false;

  @override
  void initState() {

  // TODO: Initialize _bannerAd
  _bannerAd = BannerAd(
    adUnitId: AdHelper.bannerAdUnitId,
    request: AdRequest(),
    size: AdSize.banner,
    listener: BannerAdListener(
      onAdLoaded: (_) {
        setState(() {
          _isBannerAdReady = true;
        });
      },
      onAdFailedToLoad: (ad, err) {
        print('Failed to load a banner ad: ${err.message}');
        _isBannerAdReady = false;
        ad.dispose();
      },
    ),
  );

  _bannerAd.load();
}
  Widget build(BuildContext context) {
    return Container(
      child : Column(children: [
        if (_isBannerAdReady)
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: _bannerAd.size.width.toDouble(),
                height: _bannerAd.size.height.toDouble(),
                child: AdWidget(ad: _bannerAd),
              ),
            ),
      ],)
      
    );
  }
}