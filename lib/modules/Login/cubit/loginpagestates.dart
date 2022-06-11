abstract class LoginStates {}

class InitialeState extends LoginStates {}

class PasswordVisibilityChanged extends LoginStates {}

class LoginDoneSeccufuly extends LoginStates {
  bool status;
  LoginDoneSeccufuly(this.status);
}

class Loginloading extends LoginStates {}

class LoginFailed extends LoginStates {}
