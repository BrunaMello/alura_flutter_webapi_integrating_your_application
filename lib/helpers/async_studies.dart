import 'dart:math';

asyncStudy(){
  // execucaoNormal();
  // assicronismoBasico();
  // esperandoFuncoesAssincronas();
  usandoFuncoesAssincronas();
}

void execucaoNormal(){
  print('\nExecucao normal\n');
  print('1');
  print('2');
  print('3');
  print('4');
  print('5');
}

//execucao paralela
void assicronismoBasico(){
  print('Assicronismo basico\n');
  print('1');
  print('2');
  Future.delayed(const Duration(seconds: 2), () => {print('3')});
  print('4');
  print('5');
}


//execucao paralela
void usandoFuncoesAssincronas(){
  print('\nUsando funcoes assincronas\n');
  print('1');
  print('2');

  getRandomInt(3).then((value) {
    print('Numero aleatorio: $value');
  });
  print('3');
}

void esperandoFuncoesAssincronas() async {
  print('A');
  print('B');
  int number = await getRandomInt(4);
  print('Numero aleatorio: $number');
  print('C');
  print('D');
}

Future<int> getRandomInt(int time) async {
  await Future.delayed(Duration(seconds: time));

  Random rng = Random();

  return rng.nextInt(10);
}




