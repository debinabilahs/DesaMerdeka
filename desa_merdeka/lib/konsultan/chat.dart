import 'package:desa_merdeka/konsultan/message.dart';
import 'package:desa_merdeka/konsultan/grouped_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Konsultasi',
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Message> messages = [
    Message(
        text: 'Hi',
        date: DateTime.now().subtract(Duration(minutes: 1)),
        isSentByMe: true),
    Message(
        text: 'Hello',
        date: DateTime.now().subtract(Duration(minutes: 1)),
        isSentByMe: false),
  ].reversed.toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DESA MERDEKA"),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          Expanded(
              child: GroupedListView<Message, DateTime>(
                  padding: EdgeInsets.all(8),
                  elements: messages,
                  groupBy: (Message) => DateTime(2023),
                  groupHeaderBuilder: (Message message) => SizedBox(),
                  itemBuilder: (context, Message message) => Align(
                        alignment: message.isSentByMe
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Card(
                          elevation: 8,
                          child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Text(message.text),
                          ),
                        ),
                      ))),
          Container(
            color: Colors.grey[500],
            child: TextField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(20), hintText: 'Isi Pesan...'),
              onSubmitted: (text) {
                final message = Message(
                  text: text,
                  date: DateTime.now(),
                  isSentByMe: true,
                );
                setState(() => messages.add(message));
              },
            ),
          )
        ],
      ),
    );
  }
}
