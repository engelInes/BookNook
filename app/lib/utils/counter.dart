class MyCounter{
  List<String> timeLeft(DateTime due){
    List<String> returnedValue= List<String>.filled(2, "");

    Duration _timeUntilDue=due.difference(DateTime.now());

    int _daysUntil=_timeUntilDue.inDays;
    int _hoursUntil=_timeUntilDue.inHours-(_daysUntil*24);
    int _minUntil=_timeUntilDue.inMinutes-(_daysUntil*24*60)-(_hoursUntil*60);
    int _secondsUntil=_timeUntilDue.inSeconds-
        (_daysUntil*24*60*60)-
        (_hoursUntil*60*60)-
        (_minUntil*60);
    if(_daysUntil>0) {
      returnedValue[0] = _daysUntil.toString() + "days\n" +
          _hoursUntil.toString() + "hours\n" +
          _minUntil.toString() + "minutes\n" +
          _secondsUntil.toString() + "seconds\n";
    }
    else if(_hoursUntil >0){
      returnedValue[0] =
          _hoursUntil.toString() + "hours\n" +
          _minUntil.toString() + "minutes\n" +
          _secondsUntil.toString() + "seconds\n";
    }
    else if(_minUntil >0){
      returnedValue[0] =
          _minUntil.toString() + "minutes\n" +
          _secondsUntil.toString() + "seconds\n";
    }
    else if(_secondsUntil>0){
      returnedValue[0] =
          _secondsUntil.toString() + "seconds\n";
    }
    else{
      returnedValue[0]="error";
    }

    Duration _timeUntilReveal=due.subtract(Duration( days: 7)).difference(DateTime.now());
    int _daysUntilReveal=_timeUntilReveal.inDays;
    int _hoursUntilReveal=_timeUntilReveal.inHours-(_daysUntilReveal*24);
    int _minUntilReveal=_timeUntilReveal.inMinutes-(_daysUntilReveal*24*60)-(_hoursUntilReveal*60);
    int _secondsUntilReveal=_timeUntilReveal.inSeconds-
        (_daysUntilReveal*24*60*60)-
        (_hoursUntilReveal*60*60)-
        (_minUntilReveal*60);
    if(_daysUntilReveal>0) {
      returnedValue[0] = _daysUntilReveal.toString() + "days\n" +
          _hoursUntilReveal.toString() + "hours\n" +
          _minUntilReveal.toString() + "minutes\n" +
          _secondsUntilReveal.toString() + "seconds\n";
    }
    else if(_hoursUntilReveal >0){
      returnedValue[0] =
          _hoursUntilReveal.toString() + "hours\n" +
              _minUntilReveal.toString() + "minutes\n" +
              _secondsUntilReveal.toString() + "seconds\n";
    }
    else if(_minUntilReveal >0){
      returnedValue[0] =
          _minUntilReveal.toString() + "minutes\n" +
              _secondsUntilReveal.toString() + "seconds\n";
    }
    else if(_secondsUntilReveal>0){
      returnedValue[0] =
          _secondsUntilReveal.toString() + "seconds\n";
    }
    else{
      returnedValue[0]="error";
    }
    return returnedValue;
  }
}