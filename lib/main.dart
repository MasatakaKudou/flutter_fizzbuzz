import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FizzBuzz',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: FizzBuzz(title: 'FizzBuzz'),
    );
  }
}

class FizzBuzz extends StatefulWidget {
  FizzBuzz({Key key, this.title}) : super(key: key);
  final String title;
  @override
  FizzBuzzState createState() => FizzBuzzState();
}

class FizzBuzzState extends State<FizzBuzz> {

  int a = 0;
  String b = "FizzBuzz";

  final formKey = GlobalKey<FormState>();

  void newA(int _a){
    setState(() {
      a = _a;
    });
  }

  void newB(String _b){
    setState(() {
      b = _b;
    });
  }

  void judge(int _a, String _b){
    if(_a%3 == 0 && _a%5 == 0){
      _b = "FizzBuzz";
    }else{
      if(_a%3 == 0){
        _b = "Fizz";
      }else if (_a%5 == 0){
        _b = "Buzz";
      }else{
        _b = "No FizzBuzz";
      }
    }
    newA(_a);
    newB(_b);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '私はFizzBuzz判定しますよ！',
              style: TextStyle(fontSize: 25),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Text(""),
                ),
                Expanded(
                  flex: 3,
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(labelText: "整数を記入"),
                          autofocus: true,
                          onSaved: (value){
                            newA(int.parse(value));
                          },  
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                          child: RaisedButton(
                              onPressed: (){
                                if(formKey.currentState.validate()){
                                  formKey.currentState.save();
                                }
                                judge(a,b);
                              },
                              child: Text('judge'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(""),
                ),
              ],
            ),
            Text(
              a.toString() + ' : ' + b,
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
    );
  }
}
