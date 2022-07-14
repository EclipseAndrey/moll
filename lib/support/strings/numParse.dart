import 'package:intl/intl.dart';

String parseNum(dynamic num){
  if(num == 0){
    return "0";
  }else
  if(num is int) {
    NumberFormat _currencyFormat = NumberFormat("###,###", "ru_RU");
    return _currencyFormat.format(num);
  }else if(num is double){
    NumberFormat _currencyFormat = NumberFormat("###,###.00", "ru_RU");
    return _currencyFormat.format(num);
  }else {
    return "";
  }
}