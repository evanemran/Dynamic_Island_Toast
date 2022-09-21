import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dynamic Toast',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: ''),
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
  double _width = 20;
  double _height = 20;
  double savedWidth = 20;
  double savedHeight = 20;
  double _vPosition = 0;
  double _hPosition = 0;
  String toast = "";
  final Color _color = Colors.black;

  final BorderRadiusGeometry _borderRadius = BorderRadius.circular(100);

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark
    ));
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[

          Padding(
            padding: const EdgeInsets.fromLTRB(10,0,10,0),
            child: Transform.translate(
                offset: Offset(_hPosition, _vPosition),
            child: AnimatedContainer(
              width: _width,
              height: _height,
              decoration: BoxDecoration(
                color: _color,
                borderRadius: _borderRadius,
              ),
              // Define how long the animation should take.
              duration: const Duration(seconds: 1),
              // Provide an optional curve to make the animation feel smoother.
              curve: Curves.fastOutSlowIn,
              child: Row(children: [Expanded(child: Text(toast, style: const TextStyle(color: Colors.white), textAlign: TextAlign.center,))],),
            ),),
          ),

          Expanded(child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [

                Row(children: [Expanded(child: Text("Size: ${_height.toStringAsFixed(1)}", style: TextStyle(color: Colors.black, fontSize: 18), textAlign: TextAlign.start,))],),
                Slider(
                  value: _height,
                  max: 100,
                  divisions: 100,
                  label: _height.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      savedWidth = value;
                      savedHeight = value;
                      _height = value;
                      _width = value;
                    });
                  },
                ),
                Row(children: [Expanded(child: Text("Position (Vertical): ${_vPosition.toStringAsFixed(1)}", style: TextStyle(color: Colors.black, fontSize: 18), textAlign: TextAlign.start,))],),
                Slider(
                  value: _vPosition,
                  max: (MediaQuery.of(context).size.width) / 4,
                  min: -(MediaQuery.of(context).size.width) / 4,
                  divisions: 100,
                  label: _vPosition.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _vPosition = value;
                    });
                  },
                ),
                Row(children: [Expanded(child: Text("Position (Horizontal) ${_hPosition.toStringAsFixed(1)}", style: TextStyle(color: Colors.black, fontSize: 18), textAlign: TextAlign.start,))],),
                Slider(
                  value: _hPosition,
                  min: -(MediaQuery.of(context).size.width) / 2,
                  max: (MediaQuery.of(context).size.width) / 2,
                  divisions: 100,
                  label: _hPosition.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _hPosition = value;
                    });
                  },
                ),
                
                Row(children: [Expanded(child: ElevatedButton(
                    onPressed: () {
                      showShortToast();
                    },
                    child: const Text("Short Toast", style: TextStyle(color: Colors.white),)))],),
                Row(children: [Expanded(child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Large Toast", style: TextStyle(color: Colors.white),)))],),
                Row(children: [Expanded(child: ElevatedButton(
                    onPressed: () {
                      showLargeToast();
                    },
                    child: const Text("Popup Toast", style: TextStyle(color: Colors.white),)))],),
              ],
            ),
          ))
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void showLargeToast() {

    _width = MediaQuery.of(context).size.width;
    _height = 60;

    Future.delayed(const Duration(milliseconds: 500), () {
      toast = "This is a test message from dynamic island!";
      setState(() {

      });
    });
    setState(() {

    });

    Future.delayed(const Duration(seconds: 5), () {
      _width = savedWidth;
      _height = savedHeight;
      toast = "";
      setState(() {

      });
    });
  }

  void showShortToast() {
    _width = 200;
    _height = 40;

    Future.delayed(const Duration(milliseconds: 500), () {
      toast = "Short  Toast!";
      setState(() {

      });
    });
    setState(() {

    });

    Future.delayed(const Duration(seconds: 5), () {
      _width = _width;
      _height = _height;
      toast = "";
      setState(() {

      });
    });
  }
}
