import 'package:flutter/material.dart';


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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Supporter'),
      ),
      body: Container(
        child: _buildContent(),
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
      Scaffold.of(context).showSnackBar(new SnackBar(
        content: new Text('Hello -> '+contact.name),
        duration: new Duration(seconds: 5),
      ));
      //Navigator.pushNamed(context, contact.name[0]);
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