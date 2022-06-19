import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:chuck_norris_io/pages/home.dart';

void main() => runApp(MaterialApp(
  theme: ThemeData(
    primaryColor: Colors.blue,
  ),
  home: Home(),
));