import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../data/profile_repository.dart';
import 'profile_state.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final IProfileRepository _repository;

  ProfileCubit(this._repository) : super(const ProfileState.initial());

  Future<void> loadProfile() async {
    emit(const ProfileState.loading());
    try {
      final profile = await _repository.getProfile();
      emit(ProfileState.loaded(profile));
    } catch (e) {
      emit(ProfileState.error(e.toString()));
    }
  }
}
