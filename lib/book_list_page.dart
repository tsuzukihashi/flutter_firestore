import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BookList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('test'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('books').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Text('waiting....');
            default:
              return ListView(
                children: snapshot.data.docs.map((DocumentSnapshot document) {
                  return ListTile(
                    title: Text(document.data()['title']),
                  );
                }).toList(),
              );
          }
        },
      ),
    );
  }
}
