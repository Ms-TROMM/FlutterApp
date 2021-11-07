import 'package:flutter/material.dart';
import 'package:ms_tromm/api_service.dart';
import 'package:ms_tromm/models/album.dart';
import 'package:ms_tromm/ui/theme/colors.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blue,
        primarySwatch: Colors.blue,

        fontFamily: 'Georgia',

        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline3: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          bodyText1: TextStyle(fontSize: 14.0),
          bodyText2: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold)
        )
      ),
      home: const TutorialPage(),
    );
  }
}

class TutorialPage extends StatefulWidget {
  const TutorialPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TutorialPageState();
  }

}

class _TutorialPageState extends State<TutorialPage>{
  int currentPageIndex = 0;

  final _items = [
    Colors.blue,
    Colors.orange,
    Colors.green,
    Colors.pink,
    Colors.red,
    Colors.amber,
    Colors.brown,
    Colors.yellow,
    Colors.blue,
  ];
  final _pageController = PageController();
  final _currentPageNotifier = ValueNotifier<int>(0);
  final _boxHeight = 150.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tutorial")),
      body: _buildBody()
    );
  }

  _buildBody() {
    return Flex(
      direction: Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Stack(
          children: <Widget>[_buildPageView(), _buildCircleIndicator()],
        ),
        TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyHomePage(title: "Home Page")));
          },
          child: const Text('skip'),
        )
      ],
    );
  }

  _buildPageView() {
    return Container(
      color: Colors.black87,
      height: _boxHeight,
      child: PageView.builder(
          itemCount: _items.length,
          controller: _pageController,
          itemBuilder: (BuildContext context, int index) {
            return const Center(
              child: FlutterLogo(
                size: 50.0,
              ),
            );
          },
          onPageChanged: (int index) {
            _currentPageNotifier.value = index;
          }),
    );
  }

  _buildCircleIndicator() {
    return Positioned(
      left: 0.0,
      right: 0.0,
      bottom: 0.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CirclePageIndicator(
          itemCount: _items.length,
          currentPageNotifier: _currentPageNotifier,
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: FutureBuilder<Album>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if(snapshot.hasData) {
                return Text(snapshot.data!.title);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
        ),
    ),
    );
  }
}