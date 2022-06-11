abstract class RegistrationpageState {}

class RegistrationpageInitial extends RegistrationpageState {}

class RegistrationLoading extends RegistrationpageState {}

class RegistrationSuccess extends RegistrationpageState {
  String message;
  bool status;
  RegistrationSuccess(this.message, this.status);
}

class RegistrationFailed extends RegistrationpageState {}
