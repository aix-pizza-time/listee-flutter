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

  Future<List<ShoppingItem>> items;

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
            return Container(
              padding: EdgeInsets.all(32),
              child: Text(
                'Momentan soll nichts gekauft werden 🙄',
                style: Theme.of(context).textTheme.title,
                textScaleFactor: 2,
              ),
            );
          }
        } else if (snapshot.hasError) {
          return Container(
            padding: EdgeInsets.all(32),
            child: Column(
              children: <Widget>[
                Center(
                  child: Text(
                    'Something went wrong... 😤',
                    style: Theme.of(context).textTheme.title,
                    softWrap: true,
                    textAlign: TextAlign.center,
                  ),
                ),
                Center(
                  heightFactor: 2,
                  child: Text(
                    'We are working on a solution as fast as possible 👨‍💻',
                    style: Theme.of(context).textTheme.subtitle,
                    softWrap: true,
                    textAlign: TextAlign.center,
                  ),
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            )
          );
        }

        // Fallthrough
        return CircularProgressIndicator();
      },
    );
  }
}