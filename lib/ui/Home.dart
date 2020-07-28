import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
    throw UnimplementedError();
  }

}

class HomeState extends State<Home> {

  TextEditingController _weight= new TextEditingController();
  TextEditingController _height= new TextEditingController();
  double _bmi =0.0  ;
  String _bmiString = "";
  String _bmiStringFa = "";
  TextStyle _input= new TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w600,fontStyle: FontStyle.italic);
  TextStyle _button= new TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.w600,fontStyle: FontStyle.italic);
  InputDecoration _inputWeightDecoration = new InputDecoration(hintText: "Weight",labelText: "Weight(kg)", icon: new Icon(Icons.line_weight),);
  InputDecoration _inputHeightDecoration = new InputDecoration(hintText: "Height",labelText: "Height(cm)", icon: new Icon(Icons.gesture));
  BoxDecoration _radiusField = new BoxDecoration(color: Colors.blueAccent, border: new Border.all(color: Colors.white, width: 1.0), borderRadius: new BorderRadius.circular(30.0));
  var _aValueNotifier;
  void _cal() {
    setState(() {
      if (_weight.text.isNotEmpty && _height.text.isNotEmpty) {
        _bmi = (double.parse(_weight.text)/((double.parse(_height.text)/100)*(double.parse(_height.text)/100)));
        if(_bmi>35) {_bmiString= "Extremely Obese"; _bmiStringFa = "شما چاقی مفرط دارید";}
        if(_bmi<34.9 && _bmi > 30) {_bmiString= "Obese";_bmiStringFa = "شما چاقی دارید";}
        if(_bmi<29.9 && _bmi > 25) {_bmiString= "OverWeight";_bmiStringFa = "شما اضافه وزن دارید";}
        if(_bmi<24.9 && _bmi > 18.5) {_bmiString= "Normal";_bmiStringFa = "قد و وزن شما طبیعی است";}
        if(_bmi < 18.5) {_bmiString= "UnderWeight";_bmiStringFa = "شما کمبود وزن دارید";}
      }
    });
  }

  void _clear() {
    setState(() {
      _bmiStringFa="";
      _bmi=0;
      _bmiString="";
    });
  }
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      //backgroundColor: Colors.black,
      appBar: new AppBar(
        title: new Text("BMI Indicator",style: new TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.green.shade400,
      ),
      body: new Container(
        color: Colors.orange.shade300,
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(15),
          children: <Widget>[
            new Image.asset("images/logo.png",height: 130,color: Colors.deepOrange,),
            new Container(
              margin: EdgeInsets.all(15),
              alignment: Alignment.topCenter,
              child: new Column(
                children: <Widget>[
                  new Container(
                    margin: EdgeInsets.only(top: 8.3,bottom: 8.3,left: 25,right: 25),
                    padding: EdgeInsets.all(2),
                    //decoration: _radiusField,
                    child: new TextField(onTap: _clear,controller: _height , keyboardType: TextInputType.number, style: _input,decoration: _inputHeightDecoration,),
                  ),
                  new Container(
                    margin: EdgeInsets.only(top: 8.3,bottom: 8.3,left: 25,right: 25),
                    padding: EdgeInsets.all(2),
                   //decoration: _radiusField,
                    child: new TextField(onTap: _clear,controller: _weight , keyboardType: TextInputType.number, style: _input,decoration: _inputWeightDecoration,),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: RaisedButton(
                      color: Colors.green.shade400,
                      child: Text("Calculate!", style: _button,),
                      onPressed: _cal,
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                   new Container(
                       margin: EdgeInsets.all(15),
                       child: new Text("Your BMI is "+_bmi.toStringAsFixed(1),style: _input,),
                   ),
                   new Container(
                     margin: EdgeInsets.all(7),
                       child: new Text("$_bmiString",style: _input, )
                   ),
                  new Container(
                      margin: EdgeInsets.all(7),
                      child: new Text("$_bmiStringFa",style: _input, )
                  )
                ],
              ),
            )
          ],
        ),
      ),

    );
    throw UnimplementedError();
  }




}