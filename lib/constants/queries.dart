

class Queries{
  String fetchCountries(){
    return '''
    query{
      getActiveCountries{
        name
        flag
        callingCode
  }
    }
   ''';
  }
}