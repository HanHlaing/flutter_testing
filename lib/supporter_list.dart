import 'package:flutter/material.dart';
import 'chat.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'const.dart';

class Contact {
  Contact({this.name, this.email});
  final String name;
  final String email;
}


class ListPage extends StatefulWidget {

  static String tag = 'list-page';

  @override
  _ListPageState createState() => new _ListPageState();
}


class _ListPageState extends State<ListPage>   {
  final String currentUserId="";

  bool isLoading = false;
  Future<bool> onBackPress() {
    //openDialog();
    return Future.value(true);
  }

  Widget buildItem(BuildContext context, DocumentSnapshot document) {
   /* if (document['id'] == currentUserId) {
      return Container();
    } else {*/
      return Container(
        child: FlatButton(
          child: Row(
            children: <Widget>[
              Material(
                child: CachedNetworkImage(
                  placeholder: Container(
                    child: CircularProgressIndicator(
                      strokeWidth: 1.0,
                      valueColor: AlwaysStoppedAnimation<Color>(themeColor),
                    ),
                    width: 50.0,
                    height: 50.0,
                    padding: EdgeInsets.all(15.0),
                  ),
                  imageUrl:  document['photoUrl'] ?? '',
                  width: 50.0,
                  height: 50.0,
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
              ),
              new Flexible(
                child: Container(
                  child: new Column(
                    children: <Widget>[
                      new Container(
                        child: Text(
                          'Name : ${document['name']}',
                          style: TextStyle(color: primaryColor),
                        ),
                        alignment: Alignment.centerLeft,
                        margin: new EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 5.0),
                      ),
                      new Container(
                        child: Text(
                          'User Type : ${document['type'] ?? 'Not available'}',
                          style: TextStyle(color: primaryColor),
                        ),
                        alignment: Alignment.centerLeft,
                        margin: new EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                      )
                    ],
                  ),
                  margin: EdgeInsets.only(left: 20.0),
                ),
              ),
            ],
          ),
          onPressed: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => new Chat(
                      peerId: document['id'],
                      peerAvatar: document['photoUrl'] ?? '',//document['photoUrl'],
                    )));
          },
          color: greyColor2,
          padding: EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        ),
        margin: EdgeInsets.only(bottom: 10.0, left: 5.0, right: 5.0),
      );
    //}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Supporter'),
      ),
     /* body: Container(
        child: _buildContent(),
      ),*/
      body: WillPopScope(
        child: Stack(
          children: <Widget>[
            // List
            Container(
              child: StreamBuilder(
                stream: Firestore.instance.collection('users').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(themeColor),
                      ),
                    );
                  } else {
                    return ListView.builder(
                      padding: EdgeInsets.all(10.0),
                      itemBuilder: (context, index) => buildItem(context, snapshot.data.documents[index]),
                      itemCount: snapshot.data.documents.length,
                    );
                  }
                },
              ),
            ),

            // Loading
            Positioned(
              child: isLoading
                  ? Container(
                child: Center(
                  child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(themeColor)),
                ),
                color: Colors.transparent,
              )
                  : Container(),
            )
          ],
        ),
       // onWillPop: onBackPress,
      ),
    );
  }

  Widget _buildContent() {
    return ListView.builder(
        itemCount: allContacts.length,

        itemBuilder: (BuildContext content, int index) {
          Contact contact = allContacts[index];
          return ContactListTile(contact,context);
        });
  }


}

class ContactListTile extends ListTile {
  ContactListTile(Contact contact,BuildContext context)
      : super(
    onTap: () {
      Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (context) => new Chat(
                peerId: contact.name,
                peerAvatar: "test",
              )));
    },
    title: Text(contact.name),
    subtitle: Text(contact.email),
    leading: CircleAvatar(child: Text(contact.name[0])),

  );
}

List<Contact> allContacts = [
  Contact(name: 'Han Hlaing Moe', email: 'hanhlaingmoe@gmail.com'),
  Contact(name: 'Aung Aung', email: 'aungaung.com'),
  Contact(name: 'Maung Maung', email: 'maungmaung.com'),
  Contact(name: 'Ko Aung ', email: 'koaung@gmail.com'),
  Contact(name: 'Han Hlaing Moe', email: 'hanhlaingmoe@gmail.com'),
  Contact(name: 'Aung Aung', email: 'aungaung.com'),
  Contact(name: 'Maung Maung', email: 'maungmaung.com'),
  Contact(name: 'Ko Aung ', email: 'koaung@gmail.com'),
  Contact(name: 'Han Hlaing Moe', email: 'hanhlaingmoe@gmail.com'),
  Contact(name: 'Aung Aung', email: 'aungaung.com'),
  Contact(name: 'Maung Maung', email: 'maungmaung.com'),
  Contact(name: 'Ko Aung ', email: 'koaung@gmail.com'),
  Contact(name: 'Han Hlaing Moe', email: 'hanhlaingmoe@gmail.com'),
  Contact(name: 'Aung Aung', email: 'aungaung.com'),
  Contact(name: 'Maung Maung', email: 'maungmaung.com'),
  Contact(name: 'Ko Aung ', email: 'koaung@gmail.com'),
  Contact(name: 'Han Hlaing Moe', email: 'hanhlaingmoe@gmail.com'),
  Contact(name: 'Aung Aung', email: 'aungaung.com'),
  Contact(name: 'Maung Maung', email: 'maungmaung.com'),
  Contact(name: 'Ko Aung ', email: 'koaung@gmail.com'),
];