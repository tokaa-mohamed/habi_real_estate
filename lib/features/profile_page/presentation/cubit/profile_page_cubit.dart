import 'package:bloc/bloc.dart';
import 'package:real_estate/features/profile_page/domain/entites/profle_page_data.dart';
import 'package:real_estate/features/profile_page/domain/usecases/get_profile_data_usecase.dart';
import 'package:real_estate/features/profile_page/domain/usecases/update_profile_data_usecase.dart';

part 'profile_page_state.dart';

class ProfilePageCubit extends Cubit<ProfilePageState> {
  final GetProfileDataUsecase getProfileDataUsecase;
  final UpdateProfileUseCase updateProfileUseCase;
  ProfilePageCubit({
    required this.getProfileDataUsecase,
    required this.updateProfileUseCase,
  }) : super(ProfilePageIntialState());

  Future<void> getDataOfUser() async {
    emit(ProfilePageLoadingState());
    try {
      final result = await getProfileDataUsecase.readProfileData();
      result.fold(
        (Failure) {
          emit(FailGetDataState(errorMessege: Failure.message));
        },
        (dataOfUser) {
          emit(GetDataSuccessfulyState(dataOfUser: dataOfUser));
        },
      );
    } catch (e) {
      emit(FailGetDataState(errorMessege: e.toString()));
    }
  }

  Future<void> updateDataOfUser({
    String? full_name,
    String? location,
    String? avatar_url,
  }) async {
    emit(ProfilePageLoadingState());
    try {
      final result = await updateProfileUseCase.updateDataOfUser(
        full_name,
        location,
        avatar_url,
      );
      result.fold(
        (failure) => emit(FailGetDataState(errorMessege: failure.message)),
        // On success, emit the new data so the UI updates instantly
        (updatedData) =>
            emit(ProfilePageUpdateState(updatesDataOfUser: updatedData)),
      );
    } catch (e) {
      emit(FailGetDataState(errorMessege: e.toString()));
    }
  }
}
