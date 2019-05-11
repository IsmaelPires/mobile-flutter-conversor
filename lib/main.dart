import 'package:flutter/material.dart';

void main() =>
    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Home()));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController celsiusController = TextEditingController();
  TextEditingController fahrenheitController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _resetFields() {
    celsiusController.text = "";
    fahrenheitController.text = "";
  }

  void _converter() {
    double celsius = double.parse(celsiusController.text);
    double fahrenheit = celsius * 1.8 + 32.0;
    fahrenheitController.text = fahrenheit.toStringAsFixed(4);
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Atenção"),
          content: new Text("Informe um valor!"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Fechar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      title: Text("Conversor de Temperatura"),
      centerTitle: true,
      backgroundColor: Colors.blue,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.refresh),
          onPressed: _resetFields,
        )
      ],
    );

    Icon icon = Icon(Icons.wb_sunny, size: 70, color: Colors.yellow);

    TextStyle styleDecoration =
        TextStyle(color: Colors.blueAccent, fontSize: 16);
    TextStyle styleField = TextStyle(color: Colors.blueAccent);

    RaisedButton raisedButton = RaisedButton(
      onPressed: () {
        if (_formKey.currentState.validate()){
          _converter();
        }
      },
      child: Text('Calcular'),
      color: Colors.blueAccent,
    );

    TextFormField tempCelsius = TextFormField(
        decoration: InputDecoration(
            labelText: 'Graus Celsius', labelStyle: styleDecoration),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: styleField,
        controller: celsiusController,
        validator: (value) {
          if (value.isEmpty) {
            _showDialog();
          }
        });

    TextFormField tempFahrenheit = TextFormField(
      decoration: InputDecoration(
          labelText: 'Graus Fahrenheit', labelStyle: styleDecoration),
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      style: styleField,
      controller: fahrenheitController,
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

    Form form = Form(
      child: column,
      key: _formKey,
    );

    SingleChildScrollView singleChildScrollView = SingleChildScrollView(
      child: form,
    );

    Scaffold scaffold = Scaffold(
      appBar: appBar,
      backgroundColor: Colors.white,
      body: singleChildScrollView,
    );

    return scaffold;
  }
}
