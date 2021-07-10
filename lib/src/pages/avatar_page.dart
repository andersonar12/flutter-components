import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Avatar Page'),
          actions: [
            Container(
              padding: EdgeInsets.all(5.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://miembros.fccworld.network/wp-content/themes/cera/assets/images/avatars/user-avatar.png'),
                radius: 25,
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 10),
              child: CircleAvatar(
                child: Text('SL'),
                backgroundColor: Colors.red,
              ),
            )
          ],
        ),
        body: Center(
          child: FadeInImage(
            image: NetworkImage(
                'https://blog.phonehouse.es/wp-content/uploads/2017/06/android-vs-apple.jpg'),
            placeholder: AssetImage('assets/073 jar-loading.gif'),
          ),
        ));
  }
}
