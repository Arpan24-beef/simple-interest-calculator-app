import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TheHomePage(),
    );
  }
}

class TheHomePage extends StatefulWidget {
  @override
  _TheHomePageState createState() => _TheHomePageState();
}

class _TheHomePageState extends State<TheHomePage> {
  var _currencies = ['Dollers','Rupees','Pounds'];
  var _currentItemSelected = 'Rupees';
  TextEditingController principlecon = TextEditingController();
  TextEditingController roicon = TextEditingController();
  TextEditingController timecon = TextEditingController();
  var totalin;
  String result;
  double principle,roi,time;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(onTap: (){
        FocusScope.of(context).requestFocus(FocusNode());
      },
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWQzjN1wE8bcY2LrSSf-YLwgbC77vHh5GlLxRWuvlVMlRLe6crWQ&s'))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              TextFormField(controller: principlecon,
                decoration: InputDecoration(
                    labelText: 'Principle',
                    labelStyle: TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.bold),
                    hintText: 'Principle',
                    hintStyle: TextStyle(color: Colors.white, fontSize: 24,fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                        gapPadding: 4.0, borderSide: BorderSide())),
              ),
              TextFormField(controller: roicon,
                decoration: InputDecoration(
                    labelText: 'Rate Of Interest',
                    labelStyle: TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.bold),
                    hintText: 'Rate Of Interest',
                    hintStyle: TextStyle(color: Colors.white, fontSize: 24,fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                        gapPadding: 4.0, borderSide: BorderSide())),
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: 180,
                    child: TextFormField(controller: timecon,
                      decoration: InputDecoration(
                          labelText: 'Time',
                          labelStyle:
                              TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.bold),
                          hintText: 'Time',
                          hintStyle: TextStyle(color: Colors.white, fontSize: 24,fontWeight: FontWeight.bold),
                          border: OutlineInputBorder(
                              gapPadding: 4.0, borderSide: BorderSide())),
                    ),
                  ),
                  SizedBox(width: 50,),
                  Container(width: 150,
                    color: Colors.blueGrey,
                    child: DropdownButton<String>(items: _currencies.map((String value){
                      return DropdownMenuItem<String>(value: value,child:Text(value) );
                    }).toList(),
                                value: _currentItemSelected,
                        onChanged: (String newvaluwSelected){
                       _onDropDownSelect(newvaluwSelected);


                    })
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(child: RaisedButton(onPressed: () {
                    setState(() {
                      _caltotalinterest();
                    });
                  },child: Text('Calculate',style: TextStyle(fontSize: 20,color: Colors.white),),elevation: 8.0,color: Colors.blue,)),
                  Expanded(child:RaisedButton(onPressed: () {
                    setState(() {
                      principlecon.text= '';
                      timecon.text= '';
                      roicon.text= '';
                      result = '';


                    });
                  },child: Text('Reset',style: TextStyle(fontSize: 20,color: Colors.white),),elevation: 8.0,color: Colors.black,),)
                ],
              ),
              Text('$result',style: TextStyle(fontSize: 24,color: Colors.white),)

            ],
          ),
        ),
      ),
    );
  }
  void _onDropDownSelect(newvaluwSelected)
  {
    setState(() {
      this._currentItemSelected = newvaluwSelected;
    });
  }
  String _caltotalinterest()
  {
    principle = double.parse(principlecon.text);
    roi = double.parse(roicon.text);
    time = double.parse(timecon.text);
     double totalresult = principle + (principle*time*roi)/100;
     result = 'After $time years you have to pay $totalresult';
     return result;


  }
}
