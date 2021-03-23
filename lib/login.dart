import 'dart:ffi';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
// import './main.dart';
// import 'package:flutter_task4/menu.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:apedolan/home.dart';





class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool signin = true;
  final GlobalKey<FormState>_formKey = GlobalKey<FormState>();
  TextEditingController namectrl,alamatctrl,usernamectrl,passwordctrl;
bool processing = false;
  @override
  void initState(){
    super.initState();
    namectrl = new TextEditingController();
    usernamectrl = new TextEditingController();
    passwordctrl = new TextEditingController();
    alamatctrl = new TextEditingController();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.white,
        title: Text("Wisata Kabupaten Pati",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.blue,
          fontFamily: 'Akaya',
          fontWeight: FontWeight.bold,
          fontSize: 30
        ),
        ),
      ),

      body: Container(
        height: 670,
         decoration:  BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/view.jpg'),
            fit: BoxFit.cover,
            ),
        ),
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              new Image.asset('images/apedolan.png',
              width: 200,
              ),
              boxUi(),
            ],
          ),
        ),
      ),
    );
  }

  void changeState(){
    if (signin) {
      setState(() {
      signin = false;
      });
    } else 
     setState(() {
      signin = true;
      });
  }
  void registerUser() async{
    if(_formKey.currentState.validate()){
        setState(() {
      processing = true;
    });
    var url = "http://azdev.my.id/user/daftar.php";
    var data = {
      "nama": namectrl.text,
      "alamat": alamatctrl.text,
      "username": usernamectrl.text,
      "password": passwordctrl.text,
    };
    var result = await http.post(url,body:data);

    if (jsonDecode(result.body) == "Terdapat akun yang sama" ) {
      Fluttertoast.showToast(msg: "Akun sudah terdaftar,Silahkan login",toastLength: Toast.LENGTH_SHORT);
    } else {
      if (jsonDecode(result.body) == "true" ) {
         Fluttertoast.showToast(msg: "Akun berhasil dibuat",toastLength: Toast.LENGTH_SHORT);
      }else {
        Fluttertoast.showToast(msg: "Terjadi Kesalahan",toastLength: Toast.LENGTH_SHORT);
      }
    }
    setState(() {
      processing = false;
    });
      
    } else {
       setState(() {
      processing = false;
    });
    }
  }

  void loginUser() async{
     if(_formKey.currentState.validate()){  
      setState(() {
        processing = true;
      });
     
    var url ="http://azdev.my.id/user/login.php";
    var data = {
      "nama": namectrl.text,
      "username": usernamectrl.text,
      "password": passwordctrl.text,
    };
    var result = await http.post(url,body:data);
    if (jsonDecode(result.body) == 1) {
       Fluttertoast.showToast(msg: "Login Success",toastLength: Toast.LENGTH_SHORT);
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder:  (context) => MenuPage()  
      ));
    }
    else if (jsonDecode(result.body) == "don't have an account") {
       Fluttertoast.showToast(msg: "don't have an account,Create an account",toastLength: Toast.LENGTH_SHORT);
    } else {
      if(jsonDecode(result.body) == "false"){
         Fluttertoast.showToast(msg: "Incorrect Password",toastLength: Toast.LENGTH_SHORT);
      } 
      else {
        print(jsonDecode(result.body));
      }
    }
    setState(() {
      processing = false;
    });
    }else {
      setState(() {
      processing = false;
    });
    }
  }

  Widget boxUi(){
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton(
                  onPressed: ()=> changeState(),
                  child: Text(
                    "SIGN IN",
                    style: GoogleFonts.varelaRound(
                      color: signin == true ? Colors.blue : Colors.grey,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),


                FlatButton(
                  onPressed: ()=> changeState(),
                  child: Text(
                    "SIGN UP",
                    style: GoogleFonts.varelaRound(
                      color: signin != true ? Colors.blue : Colors.grey,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            signin == true ? signInUi():  signUpUi(),        

          ],
        ),
      ),
    );
  }

  Widget signInUi(){
    return Form(
      key: _formKey,
          child: Column(
        children: <Widget>[
          TextFormField(
             validator: (text){
              if(text.isEmpty){
                return "Username harus di isi";
              }
                 return null;
              },
            controller: usernamectrl,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.account_box),
              hintText: 'Username'
            ),
          ),   
         
          TextFormField(
            obscureText: true,
             validator: (text){
              if(text.isEmpty){
                return "Password Harus diisi";
              }
                 return null;
              },
            controller: passwordctrl,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock),
              hintText: 'Password'
            ),
          ),  
          SizedBox(height: 10,),
          MaterialButton(
            onPressed: () => loginUser(),
            child: processing == false ? Text("Sign in",
            style: GoogleFonts.varelaRound(
              fontSize: 18,
              color: Colors.blue,
            ),
            ): CircularProgressIndicator(backgroundColor: Colors.indigo[200],)
          ),         
        ],
      ),
    );
  }

  Widget signUpUi(){
    return Form(
        key: _formKey,
          child: Column(
        children: <Widget>[

           TextFormField(
              validator: (text){
              if(text.isEmpty){
                return "Nama harus diisi";
                }
                  return null;
              },
            controller: namectrl,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.person),
              hintText: 'Name'
            ),
          ),
            SizedBox(height : 10),
           TextFormField(
             validator: (text){
              if(text.isEmpty){
                return "Alamat harus di isi";
              }
                 return null;
              },
            controller: alamatctrl,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.pin_drop),
              hintText: 'Alamat'
            ),
          ),   
          SizedBox(height : 10),
          TextFormField(
            validator: (text){
              if(text.isEmpty){
                return "Username harus di isi";
              }
                 return null;
              },
            controller: usernamectrl,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.account_box),
              hintText: 'Username'
            ),
          ),   
          TextFormField(
            validator: (text){
              if(text.isEmpty){
                return "Password harus diisi";
                }
                  return null;
              },
              obscureText: true,
            controller: passwordctrl,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock),
              hintText: 'Password'
            ),
          ),  
          SizedBox(height: 10,),
          MaterialButton(
            onPressed: ()=> registerUser(),
            child: processing == false ? Text("Sign up",
            style: GoogleFonts.varelaRound(
              fontSize: 18,
              color: Colors.blue,
            ),
            ) : CircularProgressIndicator(backgroundColor: Colors.indigo[200],)
          ),         
        ],
      ),
    );
  }

}