

class Queries{
  String fetchCountries(){
    return '''
    query{
      getActiveCountries{
        name
        flag
        callingCode
        currencyDetails{
        name
        code
        symbol
        
        }
  }
    }
   ''';
  }



  String register(String email, String username, String password, String referralCode, String country,

      String phonenumber, String currency,  String callingCode,  flag  ) {

    return '''
mutation {
  register( data: {email:"$email" username:"$username" password:"$password" referralCode:"" country: "$country" phonenumber: "$phonenumber" currency: "$currency" phoneNumberDetails: {phoneNumber: "$phonenumber"  callingCode: "$callingCode" flag: "$flag"}}){
    user {
      email
      _id
      phonenumber
      emailVerified
        username
      profile {
        country
      }
    }
    token
  }
}
    ''';
  }



  String login(String input, String password,  ) {
    // print(email);

    return '''
mutation {
  login( data: {input:"$input" password:"$password"}){
    user {
      email
      _id
      phonenumber
      emailVerified
       username
      profile {
        country
      }
    }
    token
  }
}
    ''';
  }


   otpVerification(int otp) {
    return '''
mutation {
  verifyUser( data: {code:$otp }){
    user {
      email
      _id
      phonenumber
    }
    token
  }
}
    ''';
  }



  String resendOtp(String email){
    return '''
    query{
      resendVerificationCode(data: {email: "$email"})

    }
   ''';
  }


}