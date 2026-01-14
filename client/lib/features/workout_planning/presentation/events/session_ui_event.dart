sealed class SessionUiEvent {}

class ShowError extends SessionUiEvent {
  final String message;
  ShowError(this.message);
}

class SaveSuccess extends SessionUiEvent {}
