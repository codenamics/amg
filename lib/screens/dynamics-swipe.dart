import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ParallaxPageView extends StatefulWidget {
 

  _ParallaxPageViewState createState() => _ParallaxPageViewState();
}

class _ParallaxPageViewState extends State<ParallaxPageView> {
  List<PageInfo> _pageInfoList;

  PageController _pageController;
  double _pageOffset;
  int _currentPageIdx;

  @override
  void initState() {
    super.initState();

    _pageOffset = 0.0;
    _currentPageIdx = 0;

    _pageController = PageController()
      ..addListener(() {
        setState(() {
          _pageOffset = _pageController.page;
        });
      });

    _pageInfoList = [
      PageInfo(
          title: "C63s",
          backgroundColor: Colors.deepOrangeAccent,
          imagepath: "assets/img/gt.png"),
      PageInfo(
          title: "GLC63s",
          backgroundColor: Colors.lightBlueAccent,
          imagepath: "assets/img/gt.png"),
      PageInfo(
          title: "GT63s",
          backgroundColor: Colors.redAccent,
          imagepath: "assets/img/gt.png"),
    ];
  }

  _getBGColor() {
    //print(_pageOffset);

    if (_pageOffset.toInt() + 1 < _pageInfoList.length) {
      Color currentBGColor = _pageInfoList[_pageOffset.toInt()].backgroundColor;
      Color nextBGColor =
          _pageInfoList[_pageOffset.toInt() + 1].backgroundColor;
      return Color.lerp(
          currentBGColor, nextBGColor, _pageOffset - _pageOffset.toInt());
    } else {
      return _pageInfoList.last.backgroundColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _getBGColor(),
      body: Column(
        children: <Widget>[
          _buildNavigationBar(),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _pageInfoList.length,
              itemBuilder: (context, idx) {
                return Container(
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                          top: 10,
                          right: 10,
                          child: Transform.translate(
                              offset: Offset(-(_pageOffset - idx) * 100, 0),
                              child: Text(_pageInfoList[idx].title,
                                  style: TextStyle(
                                      fontSize: 90,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700)))),
                      Positioned(
                          top: 150,
                          left: 30,
                          child: Column(
                            children: <Widget>[
                              _buildOtherInfo(),
                              SizedBox(height: 25),
                              _buildOtherInfo(),
                              SizedBox(height: 25),
                              _buildOtherInfo(),
                              SizedBox(height: 25),
                              _buildOtherInfo(),
                            ],
                          )),
                      Positioned(
                          top: 400,
                          child: Transform.translate(
                              offset: Offset(-(_pageOffset - idx) * 700, 0),
                              child: SizedBox(
                                  child: Image.asset(
                                      _pageInfoList[idx].imagepath))))
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  _buildOtherInfo() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Icon(
          FontAwesomeIcons.exclamationTriangle,
          color: Colors.white,
          size: 40,
        ),
        SizedBox(
          width: 30,
        ),
        Transform.translate(
            offset: Offset(0, 10),
            child: Text("600",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                    color: Colors.white))),
        SizedBox(
          width: 10,
        ),
        Text("KM",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.white)),
      ],
    );
  }

  _buildNavigationBar() {
    return SafeArea(
        bottom: false,
        child: Padding(
            padding: EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Stack(
              overflow: Overflow.visible,
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          FontAwesomeIcons.home,
                          color: Colors.white,
                          size: 36,
                        ))),
                Center(
                    child: Container(
                        padding: EdgeInsets.only(top: 10),
                        child: RichText(
                            text: TextSpan(
                                text: "AMG",
                                style:
                                    TextStyle(fontSize: 20, letterSpacing: 3),
                               )))),
               
           
              ],
            )));
  }
}



class PageInfo {
  String title;
  Color backgroundColor;
  String imagepath;
  PageInfo({this.title, this.backgroundColor, this.imagepath});
}
