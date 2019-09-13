import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calcuator App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        brightness: Brightness.light,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var num1,num2,sum;

  final TextEditingController t1 = TextEditingController(text: "0");
  final TextEditingController t2 = TextEditingController(text: "0");

  void doadd(){
    setState(() {
      num1 = double.parse(t1.text);
      num2 = double.parse(t2.text);
      sum = num1+num2;
    });}

    void dosub(){
      setState(() {
        num1 = double.parse(t1.text);
        num2 = double.parse(t2.text);
        sum = num1-num2;
      });
    }
    void domul(){
      setState(() {
        num1 = double.parse(t1.text);
        num2 = double.parse(t2.text);
        sum = num1*num2;
      });
    }

    void dodiv(){
      setState(() {
        num1 = double.parse(t1.text);
        num2 = double.parse(t2.text);
        sum = (num1*0.1)/num2;
      });
    }

    void Cl(){
    setState(() {
      t1.text = "0";
      t2.text = "0";
      sum = 0;
    });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Calculator App"),
        centerTitle: true,
//        backgroundColor: Colors.purpleAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: "Enter number 1"
              ),
              keyboardType: TextInputType.numberWithOptions(),
              controller: t1,
            ),
            Container(
             margin: EdgeInsets.only(top: 15, bottom: 15),
            ),
        TextField(
          decoration: InputDecoration(
              labelText: "Enter number 2"
          ),
          keyboardType: TextInputType.number,
          controller: t2,
        ),
            Container(
              padding: EdgeInsets.only(top:20, bottom: 20) ,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    child: Icon(Icons.add),
                    onPressed: doadd,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 15),
                ),
                Expanded(child: RaisedButton(
                  child: Icon(Icons.album),
                  onPressed: dosub,
                ),),
                Container(
                  padding: EdgeInsets.only(right: 15),
                ),
                Expanded(child: RaisedButton(
                  child: Icon(Icons.fullscreen_exit),
                  onPressed: domul,
                ),),
                Container(
                  padding: EdgeInsets.only(right: 15),
                ),
                Expanded(child: RaisedButton(
                  child: Icon(Icons.account_balance_wallet),
                  onPressed: dodiv,
                ),),
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 30)
            ),
            Text("Output : $sum",
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.deepOrangeAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
            ),
            RaisedButton(
              child: Icon(Icons.clear),
              onPressed: Cl,
            )


          ],
        )
      )
    );
  }
}

