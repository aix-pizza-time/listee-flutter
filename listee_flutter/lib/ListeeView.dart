import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import 'ListeeModel.dart';

class ListeeView extends StatefulWidget {
  ListeeView() : super();

  @override
  _ListeeState createState() => _ListeeState();
}

class _ListeeState extends State<ListeeView>{

  Future<ShoppingList> items;

  @override
  void initState() {
    super.initState();
    items = ListeeModel.fetch();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: items,
      builder: (context, snapshot) {
        if(snapshot.hasData) {
          List<ShoppingItem> items = snapshot.data;
          if (items.length > 0) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(title: Text(items[index].entry));
              },
              itemCount: snapshot.data.length,
            );
          } else {
            return Center(
              child: Text(
                'Momentan soll nichts gekauft werden 🙄',
                style: GoogleFonts.openSans(fontWeight: FontWeight.bold),
                textScaleFactor: 1,
              ),
            );
          }
        } else if (snapshot.hasError) {
          return Column(children: <Widget>[
            
            Center(
              child: Text(
                'Wir arbeiten so schnell wie möglich an einer Lösung 👨‍💻',
                style: GoogleFonts.openSans(fontWeight: FontWeight.bold),
                textScaleFactor: 0.8,
              ),
            )
          ]);
        }

        // Fallthrough
        return CircularProgressIndicator();
      },
    );
  }
}