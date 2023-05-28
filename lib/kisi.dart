import 'dart:convert';

import 'package:flutter/foundation.dart';

class kisiler {
  String kisi_ad;
  int kisi_yas;

  kisiler(this.kisi_ad, this.kisi_yas);
  factory kisiler.fromJson(Map<dynamic, dynamic> json) {
    return kisiler(json["kisi_ad"] as String, json["kisi_yas"] as int);
  }
}
