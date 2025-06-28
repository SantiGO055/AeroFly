import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();

  FirebaseAuth? _auth;
  GoogleSignIn? _googleSignIn;

  FirebaseAuth get _firebaseAuth {
    _auth ??= FirebaseAuth.instance;
    return _auth!;
  }

  GoogleSignIn get _googleSignInInstance {
    _googleSignIn ??= GoogleSignIn(
      clientId: '533192187427-nldcembmijgr21jhc0sj8h5f4v2sdpcs.apps.googleusercontent.com',
    );
    return _googleSignIn!;
  }

  // Stream para escuchar cambios en el estado de autenticación
  Stream<User?> get authStateChanges {
    try {
      return _firebaseAuth.authStateChanges();
    } catch (e) {
      print('Error getting auth state changes: $e');
      return Stream.value(null);
    }
  }

  // Obtener usuario actual
  User? get currentUser {
    try {
      return _firebaseAuth.currentUser;
    } catch (e) {
      print('Error getting current user: $e');
      return null;
    }
  }

  // Login con Google
  Future<UserCredential?> signInWithGoogle() async {
    try {
      print('Starting Google Sign-In...');
      // Iniciar el proceso de sign in con Google
      final GoogleSignInAccount? googleUser = await _googleSignInInstance.signIn();
      
      if (googleUser == null) {
        print('User cancelled Google Sign-In');
        // El usuario canceló el proceso
        return null;
      }

      print('Google user selected: ${googleUser.email}');
      // Obtener los detalles de autenticación de la solicitud
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Crear una nueva credencial para Firebase
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      print('Signing in to Firebase...');
      // Sign in con Firebase usando la credencial
      final result = await _firebaseAuth.signInWithCredential(credential);
      print('Firebase sign-in successful: ${result.user?.email}');
      return result;
    } catch (e) {
      print('Error en signInWithGoogle: $e');
      rethrow;
    }
  }

  // Cerrar sesión
  Future<void> signOut() async {
    try {
      print('Signing out...');
      await Future.wait([
        _firebaseAuth.signOut(),
        _googleSignInInstance.signOut(),
      ]);
      print('Sign out successful');
    } catch (e) {
      print('Error en signOut: $e');
      rethrow;
    }
  }

  // Verificar si el usuario está autenticado
  bool get isAuthenticated {
    try {
      return _firebaseAuth.currentUser != null;
    } catch (e) {
      print('Error checking authentication: $e');
      return false;
    }
  }
} 