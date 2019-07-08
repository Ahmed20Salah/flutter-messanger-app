import 'package:flutter/material.dart';
import 'ui/home.dart';


main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App> {

  @override
  Widget build(BuildContext context) {

    return Home();
  }
}
// class Chat extends StatefulWidget {
//   Message _message;

//   Chat(_message);

//   @override
//   State<StatefulWidget> createState() {
//     return ChatState();
//   }
// }

// class ChatState extends State<Chat> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Color.fromRGBO(242, 14, 7, 1),
//         appBar: AppBar(
//           title: Text('${widget._message.user.name}'),
//           backgroundColor: Color.fromRGBO(242, 14, 7, 1),
//           actions: <Widget>[
//             IconButton(
//                 icon: Icon(
//                   Icons.more_horiz,
//                   size: 32,
//                 ),
//                 onPressed: null)
//           ],
//           elevation: 0.0,
//         ),
//         body: Container(
//           decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(20.0),
//                   topRight: Radius.circular(20.0))),
//           child: ScopedModelDescendant(
//             builder: (context, _, MessageModel model) {
//               // write fun that fetch specific user messages
//             },
//           ),
//         ));
//   }
