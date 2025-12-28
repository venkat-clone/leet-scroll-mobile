import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import '../data/profile_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../data/profile_model.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';
part 'profile_cubit.g.dart';

@injectable
@singleton
class ProfileCubit extends HydratedCubit<ProfileState> {
  final IProfileRepository _repository;

  ProfileCubit(this._repository) : super(const ProfileState.initial());

  Future<void> loadProfile() async {
    if (state is _Loading) return;
    if (state is! _Loaded) {
      emit(const ProfileState.loading());
    }

    try {
      final profile = await _repository.getProfile();
      emit(ProfileState.loaded(profile));
    } catch (e) {
      emit(ProfileState.error(e.toString()));
    }
  }

  @override
  ProfileState? fromJson(Map<String, dynamic> json) {
    return ProfileState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(ProfileState state) {
    if (state is _Loaded) {
      return state.toJson();
    }
    return null;
  }
}
