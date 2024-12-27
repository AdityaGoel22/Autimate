class SignupWithEmailPasswordFailure{
  final String message;

  const SignupWithEmailPasswordFailure({this.message = 'An unexpected error occurred. Please try again later.'});

  factory SignupWithEmailPasswordFailure.code(String code){
    switch(code){
      case 'email-already-in-use':
        return const SignupWithEmailPasswordFailure(message: 'The email is already in use.');
      case 'invalid-email':
        return const SignupWithEmailPasswordFailure(message: 'The email is invalid.');
      case 'operation-not-allowed':
        return const SignupWithEmailPasswordFailure(message: 'Email/password accounts are not enabled.');
      case 'weak-password':
        return const SignupWithEmailPasswordFailure(message: 'The password is too weak.');
      default:
        return const SignupWithEmailPasswordFailure();
    }
  }
}