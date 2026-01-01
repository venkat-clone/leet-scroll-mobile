import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/core/network/request_status.dart';
import 'package:mobile/features/profile/data/models/preferences/user_preferences_model.dart';
import 'package:mobile/features/profile/data/profile_repository.dart';

part 'edit_preferences_state.dart';

part 'edit_preferences_cubit.g.dart';

part 'edit_preferences_cubit.freezed.dart';

@injectable
class EditPreferencesCubit extends HydratedCubit<EditPreferencesState> {
  final IProfileRepository _repository;

  EditPreferencesCubit(this._repository)
    : super(
        EditPreferencesState.initial(
          initialPreferences: UserPreferencesModel(
            id: "id",
            userId: "userId",
            preferredDifficulties: [],
            preferredTopics: [],
            interestedTopics: [],
            feedSize: 10,
            preferredLanguages: [],
          ),
        ),
      );

  Future<void> getTags(String? search) async {
    emit(state.copyWith(dropdownStatus: RequestStatus.loading));
    try {
      final tags = await _repository.getTags(search: search);
      emit(
        state.copyWith(
          dropdownItems: tags,
          dropdownStatus: RequestStatus.success,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          dropdownStatus: RequestStatus.failure,
          error: e.toString(),
        ),
      );
    }
  }

  void toggleLanguage(String language) {
    final currentLanguages = List<String>.from(
      state.modified.preferredLanguages,
    );
    if (currentLanguages.contains(language)) {
      currentLanguages.remove(language);
    } else {
      if (currentLanguages.length < 10) {
        currentLanguages.add(language);
      }
    }
    emit(
      state.copyWith(
        modified: state.modified.copyWith(preferredLanguages: currentLanguages),
      ),
    );
  }

  void addTag(String tag) {
    final currentTags = List<String>.from(state.modified.preferredTopics);
    if (!currentTags.contains(tag)) {
      currentTags.add(tag);
      emit(
        state.copyWith(
          modified: state.modified.copyWith(preferredTopics: currentTags),
        ),
      );
    }
  }

  void removeTag(String tag) {
    final currentTags = List<String>.from(state.modified.preferredTopics);
    if (currentTags.contains(tag)) {
      currentTags.remove(tag);
      emit(
        state.copyWith(
          modified: state.modified.copyWith(preferredTopics: currentTags),
        ),
      );
    }
  }

  Future<void> savePreferences() async {
    emit(state.copyWith(isLoading: true));
    try {
      await _repository.updatePreferences(state.modified);
      emit(state.copyWith(original: state.modified, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  @override
  EditPreferencesState? fromJson(Map<String, dynamic> json) {
    return EditPreferencesState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(EditPreferencesState state) {
    return state.toJson();
  }
}
