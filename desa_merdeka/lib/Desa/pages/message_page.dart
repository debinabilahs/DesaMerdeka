import 'package:flutter/material.dart';

// class MessagePage extends StatefulWidget {
//   const MessagePage({super.key});

//   @override
//   State<MessagePage> createState() => _MessagePageState();
// }

// class _MessagePageState extends State<MessagePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Container(
//               margin: EdgeInsets.only(top: 20),
//               width: 360,
//               height: 70,
//               decoration: BoxDecoration(
//                 color: Colors.grey.shade700,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(15),
//                   topRight: Radius.circular(15),
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(
//                   vertical: 24,
//                   horizontal: 10,
//                 ),
//                 child: Center(
//                   child: Text(
//                     "Chat messages",
//                     style: TextStyle(
//                       fontSize: 20,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class MessagePage extends StatelessWidget {
  final List<ChatMessage> messages = [
    ChatMessage('John', 'Hi there!'),
    ChatMessage('Jane', 'Hello! How are you?'),
    ChatMessage('John', 'I\'m doing well, thanks.'),
    ChatMessage('Jane', 'That\'s great to hear!'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (BuildContext context, int index) {
          return ChatBubble(
            sender: messages[index].sender,
            message: messages[index].message,
          );
        },
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String sender;
  final String message;

  ChatBubble({required this.sender, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4.0),
          Text(message),
        ],
      ),
    );
  }
}

class ChatMessage {
  final String sender;
  final String message;

  ChatMessage(this.sender, this.message);
}
