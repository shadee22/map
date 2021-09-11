import 'package:flutter/material.dart';
import 'package:web_scraper/web_scraper.dart';

class Scrap extends StatefulWidget {
  @override
  _ScrapState createState() => _ScrapState();
}

class _ScrapState extends State<Scrap> {
  @override
  Widget build(BuildContext context) {
    final webScraper = WebScraper('https://www.instagram.com/_lazy_unicxrn_/');
    print(webScraper);
    // if (await webScraper.loadWebPage('/test-sites/e-commerce/allinone')) {
    //     List<Map<String, dynamic>> elements = webScraper.getElement('h3.title > a.caption', ['href']);
    //     print(elements);
    // }
    return Container(
      child: Text('scrapper'),
    );
  }
}
