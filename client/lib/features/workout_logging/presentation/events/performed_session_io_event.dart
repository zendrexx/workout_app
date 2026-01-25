sealed class PerformedSessionUiEvent {}

class ShowError extends PerformedSessionUiEvent {
  final String message;
  ShowError(this.message);
}

class SaveSuccess extends PerformedSessionUiEvent {
  final String message;
  SaveSuccess(this.message);
}
