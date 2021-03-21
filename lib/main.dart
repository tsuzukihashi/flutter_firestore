import 'package:flutter/material.dart';
import 'package:flutter_firestore_demo/main_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<MainModel>(
        create: (_) => MainModel(),
        child: Scaffold(
          appBar: AppBar(
            title: Text('Firestore Daisuki'),
          ),
          body: Consumer<MainModel>(
            builder: (context, model, child) {
              return Center(
                  child: Column(
                children: [
                  Text(model.value, style: TextStyle(fontSize: 44)),
                  RaisedButton(
                    onPressed: () {
                      model.changeValueText();
                    },
                    child: Text('Change Notifier'),
                  )
                ],
              ));
            },
          ),
        ),
      ),
    );
  }
}
