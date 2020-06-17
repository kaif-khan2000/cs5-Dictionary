import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cs5_dictionary/models/user.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class Chat extends StatefulWidget {
  User user;
  Chat({this.user});
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  TextEditingController messageController = TextEditingController();
  ScrollController scrollController = ScrollController();
  final Firestore firestore = Firestore.instance;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  Future uploadMytoken(String token) async {
    return await firestore.collection('pushtokens').document(widget.user.email).setData({
      'devtoken': token,
    });
  }

  @override
  void initState() {
    super.initState();
    _firebaseMessaging.getToken().then((val){
      print(val);
      uploadMytoken(val);
    });
  }


  @override
  Widget build(BuildContext context) {
    print('hello:${widget.user.email}');
    return Scaffold(
      appBar: AppBar(
        title: Text('KASE'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: firestore.collection('messages').orderBy('time',descending: true).snapshots(),
                builder: (context,snapshot){
                  if(!snapshot.hasData){
                    return Center(child:CircularProgressIndicator());
                  }
                  List<DocumentSnapshot> docs = snapshot.data.documents;
                  List<Widget> messages = docs.map((e) => Message(
                    from: e.data['from'],
                    message: e.data['message'],
                    me: e.data['from'] == widget.user.email,

                  ) ).toList();
                  
                  return ListView.builder(
                    reverse: true,
                    shrinkWrap: true,
                    controller: scrollController,
                    itemCount: messages.length,
                    itemBuilder: (context, index) => messages[index],
                    
                  );
                  
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter a message',
                      fillColor: Colors.black,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white,width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white,width: 2),
                      ),
                    ),
                    controller: messageController,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () async {
                    if(messageController.text.length > 0){
                      await firestore.collection('messages').add({
                        'from':widget.user.email,
                        'message': messageController.text,
                        'time': new DateTime.now(),
                      });
                      
                    }
                    messageController.clear();
                    scrollController.animateTo(
                      0.0, 
                      duration: Duration(milliseconds: 300), 
                      curve: Curves.easeOut,
                    );
                    
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Message extends StatelessWidget {
  final String from;
  final String message;
  final bool me;
  Message({this.from,this.message,this.me});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      padding: EdgeInsets.fromLTRB(5, 10,5, 15),
      child: Column(
        crossAxisAlignment: me ? CrossAxisAlignment.end  : CrossAxisAlignment.start,
        children: [
          Text(from),
          Material(
            color: Colors.blueGrey[900],
            borderRadius: BorderRadius.circular(10.0),
            elevation: 6,
            child: Container(
              width: 300,
              padding: EdgeInsets.symmetric(vertical:10,horizontal:20),
              child: Text(message,style: TextStyle(fontSize: 30),),
            ),
          ),
        ],
      ),
    );
  }
}