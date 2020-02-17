import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:listee_flutter/AddElementForm.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ListeeView.dart';
import 'ListeeModel.dart';

void main() => runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ListeeModel()),
    ],
    child: MyApp()
  )
);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Listee',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primaryColor: Colors.blue[900],
        accentColor: Colors.white,
        textTheme: TextTheme(
          title: GoogleFonts.roboto(fontSize: 42, fontWeight: FontWeight.w900),
          subtitle: GoogleFonts.roboto(fontSize: 32, fontWeight: FontWeight.w200),
        ),
        brightness: Brightness.light,
        backgroundColor: Colors.blue,
      ),
      home: ListeeWrapper(title: 'Listee 🍕🍷'),
    );
  }
}

class ListeeWrapper extends StatefulWidget {
  ListeeWrapper({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ListeeWrapperState createState() => _ListeeWrapperState();
}

class _ListeeWrapperState extends State<ListeeWrapper> {

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Container(
        child: ListeeView(),
        color: Theme.of(context).backgroundColor,
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Neue Zutat hinzufügen',
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddElementForm()),
          );
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

