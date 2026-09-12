import 'package:dartz/dartz.dart';
import 'package:real_estate/core/errors/failure.dart';
import 'package:real_estate/features/profile_page/data/model/profile_data_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileDatasource {
  Future<Either<Failure, ProfileDataModel>> readProfileData() async {
    final supabase = Supabase.instance.client;
    String uid = supabase.auth.currentUser!.id;
    final response = await supabase
        .from("profiles")
        .select()
        .eq("id", uid)
        .select()
        .single();
    return Right(ProfileDataModel.fromJson(response));
  }
}
