import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //TODO: Look for an error image on the internet in your free time.
            Text(
              'Navigation Error ((',
              style: Theme.of(context).textTheme.title,
            ),
            SizedBox(height: 10,),
            Text(
              'Please return to previous page!',
              style: Theme.of(context).textTheme.body2,
            ),
          ],
        ),
      ),
    );
  }
}
