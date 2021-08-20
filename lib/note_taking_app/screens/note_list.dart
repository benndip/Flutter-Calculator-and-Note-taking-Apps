import 'package:flutter/material.dart';

class NoteList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NoteListState();
  }
}

class NoteListState extends State<NoteList> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: getNoteListView(),
      floatingActionButton: FloatingActionButton(
        tooltip: "Add Note",
        child: Icon(
          Icons.add,
        ),
        onPressed: () {
          debugPrint("FAB Tapped");
        },
      ),
    );
  }

  ListView getNoteListView() {
    TextStyle textStyle = Theme.of(context).textTheme.subtitle1;

    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, itemCount) {
        return Card(
          elevation: 2.0,
          color: Colors.white,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.amber,
              child: Icon(
                Icons.keyboard_arrow_right,
              ),
            ),
            title: Text(
              'Amanda Cruis',
              style: textStyle,
            ),
            subtitle: Text('Listening to music'),
            trailing: Icon(
              Icons.delete,
              color: Colors.redAccent,
            ),
            onTap: () {
              debugPrint("ListTile Tapped");
            },
          ),
        );
      },
    );
  }
}
