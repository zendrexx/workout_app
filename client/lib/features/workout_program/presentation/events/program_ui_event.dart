sealed class ProgramUiEvent {}

class ShowError extends ProgramUiEvent {
  final String message;
  ShowError(this.message);
}

class SaveSuccess extends ProgramUiEvent {
  final String message;
  SaveSuccess(this.message);
}
