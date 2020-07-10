import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:blog2/services/auth.dart';
class SignIn extends StatefulWidget {
  Function signInOrRegister;
  SignIn({this.signInOrRegister });
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _email =new TextEditingController();

  final TextEditingController _pass =new TextEditingController();
  final  AuthService _auth = new AuthService();
  bool isEmail(String em) {

  String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = new RegExp(p);

  return regExp.hasMatch(em);
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         body: Container(
           padding:EdgeInsets.fromLTRB(50, 30, 50, 0),
           decoration:BoxDecoration(image: DecorationImage(image:AssetImage("lib/assets/background.jpg"),
                fit:BoxFit.fill
           )),
           child:Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
             Center(child:Text("SignIn",style:TextStyle(color:Colors.white,fontSize: 40.0))),
             SizedBox(height:20),
             Form(child: Container(child:Column(children: <Widget>[
                 Center(child:Text("Using facebook or Google",style:TextStyle(color:Colors.tealAccent,fontSize:20.0))),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: <Widget>[
                    FlatButton.icon(onPressed: ()async{
                                    dynamic res=await _auth.signInWithFacebook();
                                    print(res);
                                   }, 
                                   icon: Icon(FontAwesomeIcons.facebookMessenger,color:Colors.blue), label: Text("Facebook",style:TextStyle(color:Colors.white,fontSize:20))),
                    FlatButton.icon(onPressed: () async{ 
                                   dynamic res=await _auth.signInWithGoogle();
                                   print(res);
                                    }, 
                                icon: Icon(FontAwesomeIcons.google,color:Colors.yellow), label: Text("Google",style:TextStyle(color:Colors.white,fontSize:20)))

                 ],)
             ],),),),
             Text("OR",style:TextStyle(color:Colors.red,fontSize:30)),
              SizedBox(height:20),
              Padding(
              padding:EdgeInsets.symmetric(horizontal:10.0),
              child:Container(
              height:1.0,
              width:350.0,
              color:Colors.black,),),
              SizedBox(height:20),
             Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                                      

                  TextFormField(
                     controller:_email,
                      style:TextStyle(color:Colors.white),
                      decoration:InputDecoration(
                         focusColor: Colors.white,
                         hintText:"Enter your email",
                         hintStyle:TextStyle(color:Colors.white,fontSize: 18),
                         filled: true,
                         fillColor: Color.fromRGBO(255, 255, 255, 0.1),
                         enabledBorder: OutlineInputBorder(
                           borderSide:BorderSide(
                               color:Colors.white,
                               style:BorderStyle.solid,
                               width:1
                           )
                         ),
                         errorBorder: OutlineInputBorder(
                           borderSide:BorderSide(
                               color:Colors.red,
                               style:BorderStyle.solid,
                               width:1
                           )
                         ),
                         focusedBorder: OutlineInputBorder(
                           borderSide:BorderSide(
                               color:Colors.white,
                               style:BorderStyle.solid,
                               width:1
                           )
                         ),
                      ),
                      validator: (value){
                          if(!isEmail(value))
                             return "Enter a valid email";
                          return null;
                      },
                  ),
                  SizedBox(height:20),
                  TextFormField(
                    controller:_pass,
                      style:TextStyle(color:Colors.white),
                      decoration:InputDecoration(
                         focusColor: Colors.white,
                         hintText:"Enter your password",
                         hintStyle:TextStyle(color:Colors.white,fontSize: 18),
                         filled: true,
                         fillColor: Color.fromRGBO(255, 255, 255, 0.1),
                         enabledBorder: OutlineInputBorder(
                           borderSide:BorderSide(
                               color:Colors.white,
                               style:BorderStyle.solid,
                               width:1
                           )
                         ),
                         errorBorder: OutlineInputBorder(
                           borderSide:BorderSide(
                               color:Colors.red,
                               style:BorderStyle.solid,
                               width:1
                           )
                         ),
                         focusedBorder: OutlineInputBorder(
                           borderSide:BorderSide(
                               color:Colors.white,
                               style:BorderStyle.solid,
                               width:1
                           )
                         ),
                      ),
                     
                  ),
                  SizedBox(height:20),

                
                   SizedBox(height:20),

                  RaisedButton(
                    color: Colors.blueAccent,
                    onPressed:(){
                       if(_formKey.currentState.validate())
                            _auth.signInWithEmailAndPassword(_email.text.toString(), _pass.text.toString());
                    },
                    child:Center(child:Text("SUBMIT",
                          style:TextStyle(color:Colors.white,
                          fontSize:20)
                      )),
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                  )
                  
             ],)),
             SizedBox(height:20),
              Padding(
              padding:EdgeInsets.symmetric(horizontal:10.0),
              child:Container(
              height:1.0,
              width:350.0,
              color:Colors.black,),),
              SizedBox(height:100),
               FlatButton(
                    color: Colors.red,
                    onPressed:() async {
                       dynamic res=await _auth.signinAnon();
                       print(res);
                    },
                    child:Center(child:Text("SIGNIN ANONYMOUSLY",
                          style:TextStyle(color:Colors.white,
                          fontSize:20)
                      )),
                    padding: EdgeInsets.fromLTRB(0, 1, 0, 1),
                  ),
                  SizedBox(height:10),
                  InkWell(onTap:(){
                         print("Fuck");
                         setState((){

                         widget.signInOrRegister();
                         });
                  },
                  child:Text("Register Now!",
                        style:TextStyle(fontSize:20,
                              color: Colors.tealAccent))
                  )
           ],)
         )
    
    );
  }
}