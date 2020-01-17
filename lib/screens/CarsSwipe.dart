import 'package:amg/widgets/CarInfo.dart';
import 'package:amg/widgets/PageInfo.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CarsSwipe extends StatefulWidget {
  _CarsSwipeState createState() => _CarsSwipeState();
}

class _CarsSwipeState extends State<CarsSwipe> {
  List<PageInfo> pageInfoList;
  PageController pageController;
  double pageOffset;

  @override
  void initState() {
    super.initState();

    pageOffset = 0.0;

    pageController = PageController()
      ..addListener(() {
        setState(() {
          pageOffset = pageController.page;
        });
      });

    pageInfoList = [
      PageInfo(
          title: "C63s",
          backgroundColor: Colors.limeAccent,
          imagepath: "assets/img/a45.png"),
      PageInfo(
          title: "C63s",
          backgroundColor: Colors.deepOrangeAccent,
          imagepath: "assets/img/gt.png"),
      PageInfo(
          title: "GLC63s",
          backgroundColor: Colors.lightBlueAccent,
          imagepath: "assets/img/glc63.png"),
      PageInfo(
          title: "GT63s",
          backgroundColor: Colors.redAccent,
          imagepath: "assets/img/gt.png"),
      PageInfo(
          title: "GLC63s",
          backgroundColor: Colors.lightBlue,
          imagepath: "assets/img/c63.png"),
    ];
  }

  _getBGColor() {
    if (pageOffset.toInt() + 1 < pageInfoList.length) {
      Color currentBGColor = pageInfoList[pageOffset.toInt()].backgroundColor;
      Color nextBGColor = pageInfoList[pageOffset.toInt() + 1].backgroundColor;
      return Color.lerp(
          currentBGColor, nextBGColor, pageOffset - pageOffset.toInt());
    } else {
      return pageInfoList.last.backgroundColor;
    }
  }

  Widget _buildResponsiveView(height) {
    if (height <= 667) {
      return CarInfo(
        fontSize: 30,
        fontSizeTitle: 55,
        imgHeight: 200,
        imgPos: 450,
        pageController: pageController,
        pageInfoList: pageInfoList,
        pageOffset: pageOffset,
      );
    } else if(height > 667) {
     return CarInfo(
        fontSize: 40,
        fontSizeTitle: 90,
        imgHeight: null,
        imgPos: 400,
        pageController: pageController,
        pageInfoList: pageInfoList,
        pageOffset: pageOffset,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    print(height);
    return Scaffold(backgroundColor: _getBGColor(), body: _buildResponsiveView(height));
  }
}
