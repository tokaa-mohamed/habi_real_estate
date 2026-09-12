import 'package:bloc/bloc.dart';
import 'package:real_estate/features/profile_page/domain/entites/profle_page_data.dart';
import 'package:real_estate/features/profile_page/domain/usecases/get_profile_data_usecase.dart';

part 'profile_page_state.dart';

class ProfilePageCubit extends Cubit<ProfilePageState> {
  final GetProfileDataUsecase getProfileDataUsecase;
  ProfilePageCubit({required this.getProfileDataUsecase})
    : super(ProfilePageIntialState());

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
}
