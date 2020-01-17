import 'package:amg/widgets/PageInfo.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CarInfo extends StatefulWidget {
 final PageController pageController;
 final List<PageInfo> pageInfoList;
  final double pageOffset;
final double fontSizeTitle;
final double imgHeight;
final double imgPos;
final double fontSize;
  CarInfo({this.fontSize,this.fontSizeTitle, this.imgHeight, this.imgPos,this.pageController, this.pageInfoList, this.pageOffset});

  @override
  _CarInfoState createState() => _CarInfoState();
}

class _CarInfoState extends State<CarInfo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildNavigationBar(),
        Expanded(
          child: PageView.builder(
            controller: widget.pageController,
            itemCount: widget.pageInfoList.length,
            itemBuilder: (context, idx) {
              return Container(
                child: Stack(
                  children: <Widget>[
                    Positioned(
                        top: 10,
                        right: 10,
                        child: Transform.translate(
                            offset: Offset(-(widget.pageOffset - idx) * 100, 0),
                            child: Text(widget.pageInfoList[idx].title,
                                style: TextStyle(
                                    fontSize: widget.fontSizeTitle,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700)))),
                    Positioned(
                        top: 150,
                        left: 30,
                        child: Column(
                          children: <Widget>[
                            _buildOtherInfo(widget.fontSize),
                            SizedBox(height: 25,),
                            _buildOtherInfo(widget.fontSize),
                            SizedBox(height: 25,),
                            _buildOtherInfo(widget.fontSize),
                            SizedBox(height: 25,),
                            
                          ],
                        )),
                    Positioned(
                        top: widget.imgPos,
                        child: Transform.translate(
                            offset: Offset(-(widget.pageOffset - idx) * 700, 0),
                            child: SizedBox(
                              height: widget.imgHeight,
                                child: Image.asset(
                                    widget.pageInfoList[idx].imagepath))))
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
  _buildOtherInfo(fontSize) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Icon(
          FontAwesomeIcons.exclamationTriangle,
          color: Colors.black,
          size: 55,
        ),
        SizedBox(
          width: 30,
        ),
        Transform.translate(
            offset: Offset(0, 10),
            child: Text("600",
                style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.w700,
                    color: Colors.black))),
        SizedBox(
          width: 10,
        ),
        Text("KM",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Colors.black)),
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
                          color: Colors.black,
                          size: 36,
                        ))),
                Center(
                    child: Container(
                        padding: EdgeInsets.only(top: 10),
                        child: RichText(
                            text: TextSpan(
                          text: "AMG",
                          style: TextStyle(fontSize: 20, letterSpacing: 3),
                        )))),
              ],
            )));
  }
}
