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
  String toast = "";
  final Color _color = Colors.black;
  final BorderRadiusGeometry _borderRadius = BorderRadius.circular(25);

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
                offset: const Offset(0, 9),
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
      _width = 20;
      _height = 20;
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
      _width = 20;
      _height = 20;
      toast = "";
      setState(() {

      });
    });
  }
}
