import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transition_design/page.dart';
import 'package:transition_design/page_content.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  int _pageIndex = 0;
  List<Page> pages = Page.pages;
  AnimationController _controller;
  PageController _pageController = PageController();
  var currentPageValue = 0.0;
  Animation<Color> _firstColor;
  Animation<Color> _secondColor;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
  }

  @override
  dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 375, height: 812)..init(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: _firstColor != null && _secondColor != null
              ? LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [_firstColor.value, _secondColor.value])
              : LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                      Color(pages[0].colors[0]),
                      Color(pages[0].colors[1]),
                    ]),
        ),
        child: Column(
          children: <Widget>[
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Image.asset("assets/images/Menu.png"),
                  Container(
                    width: ScreenUtil().setWidth(200),
                  ),
                  Image.asset("assets/images/search.png"),
                ],
              ),
            ),
            Expanded(
              child: PageView.builder(
                onPageChanged: (_index) {
                  animate(_index);
                },
                itemCount: pages.length,
                itemBuilder: (context, position) {
                  Widget pageContent = PageContent(
                    page: pages[position],
                    current: _pageController.page.round() == position,
                  );
                  return pageContent;
                },
                controller: _pageController,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> get pagesWidgets {
    List<Widget> response = [];
    pages.asMap().forEach((int index, Page page) {
      response.add(PageContent(
        page: page,
        current: index == _pageIndex,
      ));
    });
    return response;
  }

  void animate(int _animateTo) {
    _controller.reset();
    int _current = _pageIndex;
    _pageIndex = _animateTo;
    setState(() {});

    _firstColor = ColorTween(
            begin: Color(pages[_current].colors[0]),
            end: Color(pages[_pageIndex].colors[0]))
        .animate(_controller);
    _firstColor.addListener(() {
      setState(() {});
    });
    _secondColor = ColorTween(
            begin: Color(pages[_current].colors[1]),
            end: Color(pages[_pageIndex].colors[1]))
        .animate(_controller);
    _secondColor.addListener(() {
      setState(() {});
    });
    setState(() {
      _controller.forward();
    });
  }
}
