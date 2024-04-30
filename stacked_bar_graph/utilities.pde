//calcolo dell'età
String findAge(String birth) {
  return str(2017 - int(birth));
}

//calcolo della parcentuale
int percentage(float val, float tot) {
  return round(val * 100 / tot);
}

//reset a false di tutti gli elementi dell'array 'flag'
void resetFlag() {
  for (int i = 0; i < flag.length; i++) {
    flag[i] = false;
  }
}

//calcola totale delle persone nell'array
int countTotal(int[] set, int start, int end) {
  int count = 0;
  for(int i = start; i <= end; i++) {
    count += set[i];
  }
  return count;
}