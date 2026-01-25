sealed class PlannedSessionUiEvent {}

class ShowError extends PlannedSessionUiEvent {
  final String message;
  ShowError(this.message);
}

class SaveSuccess extends PlannedSessionUiEvent {
  final String message;
  SaveSuccess(this.message);
}
