import 'package:scoped_model/scoped_model.dart';

import 'package:messenger_app/models/messaage.dart';
import 'package:messenger_app/models/user.dart';

class MessageModel extends Model{
  List<Message> _messages;
  
   get getMessages => _messages;
   
   get getVirtualMessages {
    return [
      Message(
        user: User(name: 'Ahmed' , picture: 'assets/boy.jpg'),
        message: 'this anything for testing nothing else and this for the maxline testing for last time',
        time: DateTime(2019,5, 14,12,28)
      ),Message(
        user: User(name: 'Malek' , picture: 'assets/eyes.jpg'),
        message: 'hope you are good...'
      ),Message(
        user: User(name: 'Abdallah' , picture: 'assets/adult.jpg'),
        message: 'Do you know that this app for testing skills only ??'
      ),Message(
        user: User(name: 'Mohamed' , picture: 'assets/black.jpg'),
        message: 'Hi'
      ),Message(
        user: User(name: 'Kilany' , picture: 'assets/eyes.jpg'),
        message: 'Hi'
      ),
    ];
  }

}