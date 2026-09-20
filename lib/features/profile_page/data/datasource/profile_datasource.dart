import 'package:real_estate/features/profile_page/data/model/profile_data_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileDatasource {
  final SupabaseClient supabase;

  ProfileDatasource({required this.supabase});
  Future<ProfileDataModel> readProfileData() async {
    final user = supabase.auth.currentUser;
    if (user == null) {
      throw Exception('User session not found. Please log in again.');
    }
    final response = await supabase
        .from("profiles")
        .select()
        .eq("id", user.id)
        .single();
    return ProfileDataModel.fromJson(response);
  }

  Future<ProfileDataModel> updateProfile(
    String? full_name,
    String? location,
    String? avatar_url,
  ) async {
    final user = supabase.auth.currentUser;
    if (user == null) {
      throw Exception('User session not found. Please log in again.');
    }
    final response = await supabase.from("profiles").update({"full_name":full_name,"location":location,"avatar_url":avatar_url}).eq("id", user.id);

    return ProfileDataModel.fromJson(response);
  }
}
