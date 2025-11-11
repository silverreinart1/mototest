import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseDatabase _database = FirebaseDatabase.instance;

  // Get current user
  static User? get currentUser => _auth.currentUser;

  // Sign up with email and password
  static Future<UserCredential?> signUpWithEmail({
    required String email,
    required String password,
    required String fullName,
  }) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Store user profile data
      await _database.ref('users/${userCredential.user?.uid}').set({
        'uid': userCredential.user?.uid,
        'email': email,
        'fullName': fullName,
        'createdAt': DateTime.now().toIso8601String(),
        'totalRides': 0,
        'totalDistance': 0,
        'rating': 5.0,
        'level': 1,
      });

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw _handleAuthError(e);
    }
  }

  // Sign in with email and password
  static Future<UserCredential?> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw _handleAuthError(e);
    }
  }

  // Sign out
  static Future<void> signOut() async {
    await _auth.signOut();
  }

  // Get user profile data
  static Future<Map<String, dynamic>> getUserProfile(String uid) async {
    try {
      final snapshot = await _database.ref('users/$uid').get();
      if (snapshot.exists) {
        return Map<String, dynamic>.from(snapshot.value as Map);
      }
      return {};
    } catch (e) {
      throw 'Failed to fetch user profile: $e';
    }
  }

  // Save ride data
  static Future<void> saveRide({
    required String userId,
    required Map<String, dynamic> rideData,
  }) async {
    try {
      String rideId = _database.ref('rides').push().key ?? '';
      await _database.ref('rides/$rideId').set({
        ...rideData,
        'userId': userId,
        'createdAt': DateTime.now().toIso8601String(),
      });

      // Update user stats
      final userRef = _database.ref('users/$userId');
      final userSnapshot = await userRef.get();
      if (userSnapshot.exists) {
        final user = Map<String, dynamic>.from(userSnapshot.value as Map);
        await userRef.update({
          'totalRides': (user['totalRides'] ?? 0) + 1,
          'totalDistance': (user['totalDistance'] ?? 0) + (rideData['distance'] ?? 0),
        });
      }
    } catch (e) {
      throw 'Failed to save ride: $e';
    }
  }

  // Get all rides
  static Future<List<Map<String, dynamic>>> getAllRides() async {
    try {
      final snapshot = await _database.ref('rides').get();
      if (snapshot.exists) {
        final rides = <Map<String, dynamic>>[];
        for (final child in (snapshot.value as Map).entries) {
          rides.add(Map<String, dynamic>.from(child.value as Map));
        }
        return rides;
      }
      return [];
    } catch (e) {
      throw 'Failed to fetch rides: $e';
    }
  }

  // Update user rating
  static Future<void> updateUserRating(String userId, double rating) async {
    try {
      await _database.ref('users/$userId').update({'rating': rating});
    } catch (e) {
      throw 'Failed to update rating: $e';
    }
  }

  // Handle auth errors
  static String _handleAuthError(FirebaseAuthException e) {
    switch (e.code) {
      case 'weak-password':
        return 'The password provided is too weak.';
      case 'email-already-in-use':
        return 'An account already exists for that email.';
      case 'invalid-email':
        return 'The email address is invalid.';
      case 'user-disabled':
        return 'This user account has been disabled.';
      case 'user-not-found':
        return 'No user found for that email.';
      case 'wrong-password':
        return 'Wrong password provided.';
      case 'too-many-requests':
        return 'Too many login attempts. Try again later.';
      default:
        return 'An error occurred: ${e.message}';
    }
  }
}
