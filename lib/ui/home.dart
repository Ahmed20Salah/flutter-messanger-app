import 'package:scoped_model/scoped_model.dart';
import '../data/message.dart';
import 'package:messenger_app/models/messaage.dart';
import 'package:flutter/material.dart';
class Home  extends StatelessWidget {

  List<Message> _messages;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Color.fromRGBO(242, 14, 7, 1),
          actions: <Widget>[
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                height: 40.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(width: 300.0, child: TextField()),
                    IconButton(
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      onPressed: null,
                      color: Colors.white,
                    ),
                  ],
                ))
          ],
        ),
        body: ScopedModel<MessageModel>(
          model: MessageModel(),
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
                color: Color.fromRGBO(242, 14, 7, 1),
                height: 200.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    InkWell(
                      child: Text(
                        'Messages',
                        style: _mainStyle(),
                      ),
                    ),
                    SizedBox(
                      width: 50.0,
                    ),
                    InkWell(
                      child: Text(
                        'Online',
                        style: _mainStyle(),
                      ),
                    ),
                    SizedBox(
                      width: 50.0,
                    ),
                    InkWell(
                      child: Text(
                        'Group',
                        style: _mainStyle(),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 90.0),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(244, 232, 217, 1),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50.0),
                        topRight: Radius.circular(50.0))),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(
                          top: 20.0, bottom: 15.0, left: 30.0, right: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Favorite contacts',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                              icon: Icon(
                                Icons.more_horiz,
                                size: 32,
                              ),
                              onPressed: null)
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10.0),
                      height: 100.0,
                      child: ScopedModelDescendant(
                        builder: (context, _, MessageModel model) {
                          _messages = model.getVirtualMessages;
                          return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: _messages.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 15.0),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        width: 50.0,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    '${_messages[index].user.picture}'),
                                                fit: BoxFit.cover),
                                            shape: BoxShape.circle),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Text('${_messages[index].user.name}')
                                    ],
                                  ),
                                );
                              });
                        },
                      ),
                    )
                  ],
                ),
              ),
              Container(
                constraints: BoxConstraints.expand(),
                margin: EdgeInsets.only(top: 260.0),
                padding: EdgeInsets.only(top: 10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30.0),
                      topLeft: Radius.circular(30.0)),
                ),
                child: ScopedModelDescendant(
                    builder: (context, _, MessageModel model) {
                  _messages = model.getVirtualMessages;
                  return ListView.builder(
                    itemCount: _messages.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 60.0,
                        margin: EdgeInsets.symmetric(vertical: 10.0),
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 5.0),
                        child: InkWell(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                    height: 50.0,
                                    width: 50.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: AssetImage(
                                            '${_messages[index].user.picture}',
                                          ),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Text(
                                          '${_messages[index].user.name}',
                                          style:
                                              TextStyle(color: Colors.black54),
                                          textAlign: TextAlign.left,
                                        ),
                                        SizedBox(height: 1.0),
                                        Container(
                                          constraints:
                                              BoxConstraints(maxWidth: 250.0),
                                          child: Text(
                                            '${_messages[index].message}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                            overflow: TextOverflow.ellipsis,
                                            softWrap: true,
                                            maxLines: 2,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                  '${_messages[0].time.hour}:${_messages[0].time.minute}')
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }),
              )
            ],
          ),
        ));
  }

  TextStyle _mainStyle() {
    return TextStyle(
        color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold);
  }


}