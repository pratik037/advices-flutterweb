class Advice{
  String aid;
  String advice;
  String date;

  Advice(this.aid, this.advice, this.date);

  Advice.fromMap(Map advicesMap){
    this.aid = advicesMap['id'].toString();
    this.advice = advicesMap['advice'];
    this.date = advicesMap['date'];
  }

  Advice.hasError(String error){
    this.aid = "0";
    this.advice = error;
    this.date = "NA";
  }

  @override
  String toString() {
    // TODO: implement toString
    return (advice.toString());
  }

}