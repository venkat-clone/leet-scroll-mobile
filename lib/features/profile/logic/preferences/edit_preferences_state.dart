part of 'edit_preferences_cubit.dart';

@freezed
class EditPreferencesState with _$EditPreferencesState {
  const factory EditPreferencesState({
    // Original saved state from database
    required UserPreferencesModel original,

    // Current form state (being modified)
    required UserPreferencesModel modified,

    // Dropdown data
    required List<String> dropdownItems,
    required RequestStatus dropdownStatus,

    // Overall state
    required bool isLoading,
    required String? error,
  }) = _EditPreferencesState;

  const EditPreferencesState._();

  /// Check if form has unsaved changes
  bool get hasChanges => original != modified;

  /// Get error message if any
  String? get errorMessage => error;

  /// Check if dropdown is loading
  bool get isDropdownLoading => dropdownStatus.isLoading;

  factory EditPreferencesState.initial({
    required UserPreferencesModel initialPreferences,
  }) {
    return EditPreferencesState(
      original: initialPreferences,
      modified: initialPreferences,
      dropdownItems: [],
      dropdownStatus: RequestStatus.initial,
      isLoading: false,
      error: null,
    );
  }

  factory EditPreferencesState.fromJson(Map<String, dynamic> json) =>
      _$EditPreferencesStateFromJson(json);
}
