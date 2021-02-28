import 'package:flutter/material.dart';

class MensajePag extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Mensaje Pag'),
      ),
      body: Center(
        child: Text(arg),
      ),
    );
  }
}
