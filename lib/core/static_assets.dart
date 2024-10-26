class StaticAssets {
  static List<String> get otherOptionButtonName =>["facebook","google","apple"];
  static String getAssetAddr(int index){
    return "assets/icons/${otherOptionButtonName[index]}.svg";
  }

  static String get forgotPassword => 'assets/icons/forgot_password.svg';
  static String get sms => 'assets/icons/sms.svg';
  static String get mail => 'assets/icons/mail.svg';
  static String get verification=> 'assets/icons/verification.svg';


  static String get apple=> 'assets/icons/apple.svg';
  static String get facebook=> 'assets/icons/facebook.svg';
  static String get google=> 'assets/icons/google.svg';
  static String get paypal=> 'assets/icons/paypal.svg';
  static String get masterCard=> 'assets/icons/mastercard.svg';
  static String get visa=> 'assets/icons/visa.svg';
  static String get qrcode=> 'assets/icons/qrcode.svg';
  static String get cancel=> 'assets/icons/cancel.svg';
  static String get wallet=> 'assets/icons/wallet.svg';








}
