import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  AppLifecycleState _appLifecycleState;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      _appLifecycleState = state;
      print("My app State: $_appLifecycleState");
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        appBar: AppBar(
          title: Text("Life Cycle"),
        ),
        body: new OrientationBuilder(builder: (context, orientation) {
          return new Center(
            child: new Text(
              _appLifecycleState.toString(),
              style: TextStyle(
                fontSize: 30.0,
                color: orientation == Orientation.portrait
                    ? Colors.blue
                    : Colors.red,
              ),
            ),
          );
        }),
      ),
    );
  }
}
