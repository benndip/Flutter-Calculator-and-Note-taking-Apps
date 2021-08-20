import 'package:flutter/material.dart';

import './calculator.dart'; ///This is the calculator App
import './note_taking_app/screens/note_list.dart';

void main() => runApp(
      MaterialApp(
        title: "Simple Interest Calculator",
        home: NoteList(),
        theme: ThemeData(
          brightness: Brightness.light,
          accentColor: Colors.indigoAccent,
          primaryColor: Colors.indigo,
        ),
      ),
    );
