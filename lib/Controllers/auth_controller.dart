import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../Constants/firebase_constants.dart';
import '../Screens/initial.dart';
import '../Screens/auth/login.dart';

class AuthController extends GetxController {
  static AuthController authInstance = Get.find();
  late Rx<User?> firebaseUser;
  Rx<bool> isloading=false.obs;

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());

    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user != null) {
      // user is logged in
      Get.offAll(() =>  const MyApp());
    } else {
      // user is null as in user is not available or not logged in
      Get.offAll(() => const MyLogin());
    }
  }

   void register(String email, password,name) async {
    isloading=true.obs;
    update();
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);  
          FirebaseFirestore.instance
            .collection('user')
            .doc(auth.currentUser!.uid)
            .set({
          'name': name,
          'email': email,
          'password': password,
          'id': auth.currentUser!.uid,
          'image': "https://www.woolha.com/media/2020/03/eevee.png",
          

        });    
    } on FirebaseAuthException catch (e) {
      // this is solely for the Firebase Auth Exception
      // for example : password did not match
      print(e.message);
      Get.snackbar("Something went wrong", e.message.toString());
      isloading=false.obs;
      update();
    update();
    } catch (e) {
      print(e.toString());
      Get.snackbar("Something went wrong", e.toString());
      isloading=false.obs;
    update();
    }
  }

  void login(String email, String password) async {
    isloading=true.obs;
  update();
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password).whenComplete(()  {isloading=false.obs;
    update();});
    } on FirebaseAuthException catch (e) {
      // this is solely for the Firebase Auth Exception
      // for example : password did not match
      print(e.message);
      Get.snackbar("Something went wrong", e.message.toString());
      isloading=false.obs;
    update();
    } catch (e) {
      print(e.toString());
      Get.snackbar("Something went wrong", e.toString());
      isloading=false.obs;
    update();
    }
    
  }

  void signOut() {
   
    try {
      auth.signOut();
    } catch (e) {
      print(e.toString());
    }
    
  }
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final UserCredential userCredential =
        await _auth.signInWithCredential(credential);

    // Save user data to Firestore
    if (userCredential.user != null) {
      await _firestore
          .collection('user')
          .doc(userCredential.user!.uid)
          .set({
        'name': userCredential.user!.displayName,
        'email': userCredential.user!.email,
        'id': auth.currentUser!.uid,
          'image': "https://www.woolha.com/media/2020/03/eevee.png",

        // Add any other user data you want to save
      });
    }

    
  }
}

 