import 'dart:math';

class RandomEvrything {
  static String yesOrno() {
    List<String> mylist = ["دارد", "ندارد"];
    String result = mylist[Random().nextInt(mylist.length)];
    return result;
  }
}
