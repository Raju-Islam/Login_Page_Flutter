
import 'package:flutter/material.dart';
void main(){
  runApp(new MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new LoginPage(),
      theme: new ThemeData(
        primarySwatch:Colors.blue,
      ),
    );
  }
}
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin{

  // for logo animation
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;
  @override
  void initState(){
    super.initState();
    _iconAnimationController=new AnimationController(
      vsync: this,
      duration: new Duration(milliseconds: 400),
    );
    _iconAnimation=new CurvedAnimation(parent: _iconAnimationController, curve: Curves.easeOut);
    _iconAnimation.addListener(() { this.setState(() {

    });});
    _iconAnimationController.forward();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: new Stack(
        fit: StackFit.expand,
       children: <Widget>[
         new Image(
           image: new AssetImage("assets/flowers.jpg"),
           fit: BoxFit.cover,
           color: Colors.black87,
           colorBlendMode: BlendMode.darken,
         ),
         new Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             new FlutterLogo(
               size: _iconAnimation.value*100,
             ),
             new Form(
               child: Theme(
                 data: new ThemeData(
                   brightness: Brightness.dark,
                   primarySwatch: Colors.teal,
                   inputDecorationTheme: new InputDecorationTheme(
                     labelStyle: new TextStyle(
                       fontSize: 17,
                       color: Colors.teal,
                     )
                   )
                 ),
                 child: Container(
                   padding: const EdgeInsets.all(40.0),
                   child: new Column(
                     crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                    new TextFormField(
                        decoration: new InputDecoration(labelText: "Enter Email"),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    new TextFormField(
                      decoration: new InputDecoration(
                        labelText: "Enter Password",
                      ),
                      keyboardType: TextInputType.text,
                      obscureText: true,
                    ),
                new Padding(
                  padding: const EdgeInsets.only(top: 20),

                ),
                new MaterialButton(
                  color: Colors.teal,
                  child: new Text("Login",style: new TextStyle(color: Colors.black87),),
                  splashColor: Colors.blue,
                  onPressed: () => {},
                )
                ],
                   ),
                 ),
               ),
             )
           ],
         )
       ],
      ),
    );
  }
}

