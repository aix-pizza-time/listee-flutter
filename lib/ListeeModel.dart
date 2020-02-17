import 'package:flutter/foundation.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'dart:collection';

import 'package:http/http.dart' as http;

class ShoppingItem {
  String id;
  String entry;
  String creator;

  ShoppingItem(String entry, String creator) {
    var idBytes = utf8.encode(this.entry);
    var hash = sha256.convert(idBytes);
    this.id = hash.toString().substring(0, 8);
    this.creator = creator;
    this.entry = entry;
  }

  ShoppingItem.full(this.id, this.entry, this.creator);

  ShoppingItem.minimal(String entry) : this(entry, "Anonymous");
  
  ShoppingItem.withName(String entry, String creator) : this(entry, creator);

  factory ShoppingItem.fromJson(Map<String, dynamic> json) {
    return ShoppingItem.full(
      json['id'] as String, 
      json['entry'] as String, 
      json['creator'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': this.id,
    'entry': this.entry,
    'creator': this.creator
  };
}

class ListeeModel extends ChangeNotifier {

  static _parseFetchResult(String respBody){
    final parsed = json.decode(respBody).cast<Map<String, dynamic>>();
    return parsed.map<ShoppingItem>((json) => ShoppingItem.fromJson(json)).toList();
  }

  static Future<List<ShoppingItem>> fetch() async {
    try {
      final response = await http.get('https://pizza.bartolomey.me/api/v2/list');
      if (response.statusCode == 200) {
        return _parseFetchResult(response.body);
      } else {
        return Future.error(response.body);
      }
    } catch(e) {
      return Future.error(''); 
    }
  }

  static Future push() {

  }

  // void delete(ShoppingItem item) {
  //   _items.removeAt(_items.indexOf(item));
  //   notifyListeners();
  // }

  // void add(ShoppingItem item) {
  //   _items.add(item);
  //   notifyListeners();
  // }

  // void rename(ShoppingItem oldItem, ShoppingItem newItem) {
  //   _items[_items.indexOf(oldItem)] = newItem;
  //   notifyListeners();
  // }
}