import 'package:flutter/material.dart';
import 'package:pushfirebase/src/pag/inicio_pag.dart';
import 'package:pushfirebase/src/pag/mensaje_pag.dart';
import 'package:pushfirebase/src/providers/push_notificaciones_proveedor_firebase.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // estado para eso necesito el global key
  final GlobalKey<NavigatorState> navegacionLlave =
      new GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    // implenatacion de proveedor de push
    final pushProveedorFirebase = new PushNotificacionesProveedorFirebase();
    pushProveedorFirebase.initNotificaciones();

    pushProveedorFirebase.mensajesStream.listen((data) {
      print('argumento desde main: $data');
      //Navigator.pushNamed(context, 'mensaje');
      //sin argumento navegacionLlave.currentState.pushNamed('mensaje');
      navegacionLlave.currentState.pushNamed('mensaje',arguments: data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navegacionLlave,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      title: 'Material App',
      initialRoute: 'inicio',
      routes: {
        'inicio': (BuildContext contex) => InicioPag(),
        'mensaje': (BuildContext contex) => MensajePag(),
      },

      //home: InicioPag(),
    );
  }
}
