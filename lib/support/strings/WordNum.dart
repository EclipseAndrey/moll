
String wordNum(int count, {required wordOne, required wordTwo, required wordFive}){
  var value = count %100;
  var num = value %10;
  if(value > 10 && value < 20) return wordFive;
  if(num > 1 && num < 5) return wordTwo;
  if(num == 1) return wordOne;
  return wordFive;
}