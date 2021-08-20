import 'package:flutter/material.dart';

class NoteDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NoteDetailsState();
  }
}

class NoteDetailsState extends State<NoteDetails> {
  static var _priorities = ["High", "Low"];
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.subtitle1;

    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Note"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [

            ListTile(
              title: DropdownButton(
                items: _priorities
                    .map(
                      (String e) => DropdownMenuItem<String>(
                        value: e,
                        child: Text(e),
                      ),
                    )
                    .toList(),
                value: "Low",
                style: textStyle,
                onChanged: (valueSelected) {
                  setState(() {
                    debugPrint("User selected $valueSelected");
                  });
                },
              ),
            ),

            //Second element
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                style: textStyle,
                controller: titleController,
                decoration: InputDecoration(
                  labelText: "Title",
                  labelStyle: textStyle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4.0))
                  )
                ),
              ),  
            ),

            //Third Element
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                style: textStyle,
                controller: titleController,
                decoration: InputDecoration(
                  labelText: "Title",
                  labelStyle: textStyle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4.0))
                  )
                ),
              ),  
            )

          ],
        ),
      ),
    );
  }
}
