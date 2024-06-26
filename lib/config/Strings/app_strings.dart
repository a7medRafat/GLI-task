class AppStrings {
  static String loginHint =
      'Hello, you must login first to be able to use the application and enjoy all the features in GLA';
  static String validateName = 'name required';
  static String validateEmail = 'email required';
  static String validatePhone = 'phone required';
  static String validatePassword = 'password required';
  static String name = 'Name';
  static String email = 'Email';
  static String emailAddress = 'Email address';
  static String phone = 'Phone';
  static String password = 'Password';
  static String signUp = 'Sign up';
  static String login = 'LOGIN';
  static String register = 'Register Now';
  static String loginPhrase = 'browse our hot offers';
  static String appName = 'Valux';
  static String dontHaveAcc = 'Don\'t have an account?';
  static String categories = 'Categories';

  static String passwordPattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  static String passwordReturn =
      '''Password must be at least 8 characters,include an uppercase letter, number and symbol.''';

  static String emailPattern = r'\w+@\w+\.\w+';
  static String emailReturn = 'Invalid E-mail Address format';

  static String newUser =
      'https://i.pinimg.com/736x/01/4b/32/014b32b806bace5c59cfee1c4e2b466c.jpg';

  static String newBio = 'write ur bio ..';
  String profileSuccessUpdate = 'profile updated successfully';
  String profileImageSuccessUpdate = 'profile Image updated successfully';
  String successStory = 'story added successfully';
  String successComment = 'comment added successfully';
  String successSaved = 'post saved successfully';
  String deletePost = 'post deleted successfully';
  String addPost = 'your post has been added successfully';
}
