import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../core/constant/app_constants.dart';
import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> loginWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<UserModel> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String fullName,
  });

  Future<void> signOut();

  Future<UserModel?> getCurrentUser();

  Future<void> resetPassword({required String email});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient supabaseClient;

  AuthRemoteDataSourceImpl({required this.supabaseClient});

  @override
  Future<UserModel> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final response = await supabaseClient.auth.signInWithPassword(
      email: email,
      password: password,
    );

    final user = response.user;
    if (user == null) {
      throw const AuthException('User authentication failed: No user returned');
    }

    Map<String, dynamic>? profileData;
    try {
      profileData = await supabaseClient
          .from(AppConstants.profilesTable)
          .select()
          .eq('id', user.id)
          .maybeSingle();
    } catch (_) {}

    return UserModel.fromSupabaseUser(user, profileData: profileData);
  }

  @override
  Future<UserModel> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String fullName,
  }) async {
    final response = await supabaseClient.auth.signUp(
      email: email,
      password: password,
      data: {'full_name': fullName},
    );

    final user = response.user;
    if (user == null) {
      throw const AuthException('User registration failed: No user returned');
    }

    return UserModel.fromSupabaseUser(user);
  }

  @override
  Future<void> signOut() async {
    await supabaseClient.auth.signOut();
  }

  @override
  Future<UserModel?> getCurrentUser() async {
    final user = supabaseClient.auth.currentUser;
    if (user == null) {
      return null;
    }

    Map<String, dynamic>? profileData;
    try {
      profileData = await supabaseClient
          .from(AppConstants.profilesTable)
          .select()
          .eq('id', user.id)
          .maybeSingle();
    } catch (_) {}

    return UserModel.fromSupabaseUser(user, profileData: profileData);
  }

  @override
  Future<void> resetPassword({required String email}) async {
    await supabaseClient.auth.resetPasswordForEmail(email);
  }
}
