import 'package:firebase_auth/firebase_auth.dart';
import 'package:blog2/models/User.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
class AuthService{
  final FirebaseAuth _auth =FirebaseAuth.instance;
  
  final GoogleSignIn  _google = new GoogleSignIn();
  static User getUserFromFirebase(FirebaseUser u){
        return u!=null? new User(uid:(u.uid).toString(),email:u.email,username: u.displayName): null;
  }
  Stream<User>get user{
      return _auth.onAuthStateChanged.map((FirebaseUser u){
          return getUserFromFirebase(u);
      } );
  }
  Future<User> createUserWithEmailAndPassword(String email,String password) async{
    try{
       AuthResult result=await _auth.createUserWithEmailAndPassword(email: email, password:password);
      return getUserFromFirebase(result.user);
    }catch(e){
      return null;
    }
  }
  Future<User> signInWithEmailAndPassword(String email,String password) async{
      try{
           AuthResult result= await _auth.signInWithEmailAndPassword(email: email, password: password);
           return getUserFromFirebase(result.user);
      }catch(e){
        return null;
      }
  }
  Future<User> signinAnon() async{
     try{
         AuthResult result= await _auth.signInAnonymously();
         FirebaseUser user=result.user;
         return getUserFromFirebase(user);
     }catch(e){
        print(e.toString());
        return null;
     }
  }
  Future<User> signInWithGoogle() async{
     try{
        GoogleSignInAccount googleSignInAccount= await _google.signIn();
        GoogleSignInAuthentication gSA= await googleSignInAccount.authentication;
        AuthCredential credential= await GoogleAuthProvider.getCredential(idToken: gSA.idToken, accessToken:gSA.accessToken);
        AuthResult result=await _auth.signInWithCredential(credential);
        User u=getUserFromFirebase(result.user);
        print("Fuck itt");
        return u;
       }catch(e){
         print(e);
         return null;
       }
    }
    Future<User>signInWithFacebook() async{
      FirebaseUser currentUser;  
        FacebookLogin facebookLogin= new FacebookLogin();
        // if you remove above comment then facebook login will take username and pasword for login in Webview  
        try {  
            final FacebookLoginResult facebookLoginResult = await facebookLogin.logIn(['email', 'public_profile']);  
            if (facebookLoginResult.status == FacebookLoginStatus.loggedIn) {  
                FacebookAccessToken facebookAccessToken = facebookLoginResult.accessToken;  
                final AuthCredential credential = FacebookAuthProvider.getCredential(accessToken: facebookAccessToken.token);  
                final AuthResult result = await _auth.signInWithCredential(credential);  
                print(result.user);
                return getUserFromFirebase(result.user);
            }
            } catch (e) {  
                print(e);  
                return null;  
            }  
        }  
}
   
