import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transition_design/page.dart';

class PageContent extends StatefulWidget {
  final Page page;
  final bool current;

  PageContent({Key key, @required this.page, @required this.current})
      : super(key: key);

  @override
  PageContentState createState() => PageContentState();
}

class PageContentState extends State<PageContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(571.61),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
//        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(306.22),
            child: Stack(
              overflow: Overflow.clip,
              children: <Widget>[
                Positioned(
                  child: Image.asset(
                    "assets/images/${widget.page.photo}",
                    width: ScreenUtil().setWidth(306.22),
                  ),
                ),
                AnimatedPositioned(
                  duration: Duration(milliseconds: 300),
                  top: widget.current ? 50 : -ScreenUtil().setHeight(400),
                  right: 0,
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: Text(
                      "${widget.page.photoDescription}",
                      style: TextStyle(
                        color: Color(widget.page.colors[1]),
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.bold,
                        fontSize: ScreenUtil().setHeight(75),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Text(
              widget.page.title,
              style: TextStyle(
                color: Color(0xffFDFDFD),
                fontSize: ScreenUtil().setHeight(61),
                fontWeight: FontWeight.bold,
                fontFamily: "Montserrat",
              ),
            ),
          ),
          Container(
            child: Text(
              widget.page.description,
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Montserrat",
                fontSize: ScreenUtil().setHeight(18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
