enum FirebaseExceptionUtils {
  USER_NOT_FOUND,
  WRONG_PASSWORD,
  INVALID_EMAIL,
  WEAK_PASSWORD,
  EMAIL_IN_USE,
}

const Map<FirebaseExceptionUtils, String> FirebaseExceptionUtilsSelection = {
  FirebaseExceptionUtils.USER_NOT_FOUND: 'user-not-found',
  FirebaseExceptionUtils.WRONG_PASSWORD: 'wrong-password',
  FirebaseExceptionUtils.INVALID_EMAIL: 'invalid-email',
  FirebaseExceptionUtils.EMAIL_IN_USE: 'email-already-in-use',
  FirebaseExceptionUtils.WEAK_PASSWORD: 'weak-password',
};