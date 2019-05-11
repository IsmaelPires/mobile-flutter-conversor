import 'package:flutter/material.dart';

void main() =>
    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Home()));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      title: Text("Conversor de Temperatura"),
      centerTitle: true,
      backgroundColor: Colors.blue,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.refresh),
          onPressed: () {},
        )
      ],
    );

    Icon icon = Icon(Icons.wb_sunny, size: 70, color: Colors.yellow);

    TextStyle styleDecoration =
        TextStyle(color: Colors.blueAccent, fontSize: 16);
    TextStyle styleField = TextStyle(color: Colors.blueAccent);

    RaisedButton raisedButton = RaisedButton(
      onPressed: () {},
      child: Text('Calcular'),
      color: Colors.blueAccent,
    );

    TextField tempCelsius = TextField(
      decoration: InputDecoration(
          labelText: 'Graus Celsius', labelStyle: styleDecoration),
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      style: styleField,
    );

    TextField tempFahrenheit = TextField(
      decoration: InputDecoration(
          labelText: 'Graus Fahrenheit', labelStyle: styleDecoration),
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      style: styleField,
    );

    Container containerPaddingBtn = Container(
      padding: EdgeInsets.all(8.0),
      child: raisedButton,
    );

    Container containerPaddingFields = Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[tempCelsius, tempFahrenheit],
      ),
    );

    Column column = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[icon, containerPaddingFields, containerPaddingBtn],
    );

    SingleChildScrollView singleChildScrollView = SingleChildScrollView(
      child: column,
    );

    Scaffold scaffold = Scaffold(
      appBar: appBar,
      backgroundColor: Colors.white,
      body: singleChildScrollView,
    );

    return scaffold;
  }
}
