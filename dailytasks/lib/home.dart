import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'nova_pagina.dart';
import 'proxima_pagina.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NovaPagina()),
            );
          },
          child: Image.network(
            'https://files.engaged.com.br/5db06876d1965b00074402c2/account/5db06876d1965b00074402c2/QJ1pjmKUQJGQZRO8UOPV_logos-final-14.png',
            width: 300, // Largura da imagem
            height: 300, // Altura da imagem
          ),
        ),
      ),
    );
  }
}
class NovaPagina extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OutraPagina()),
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Home',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color(0xff6b0d0f),
          iconTheme: IconThemeData(color: Colors.white), // Definindo a cor do ícone de voltar
        ),
        body: Column(
          children: [
            Container(
              color: Color(0xff6b0d0f),
              height: 60,
              width: double.infinity,
              child: Center(
                child: Text(
                  'Catolica SC',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Color(0xff6b0d0f),
                child: Center(
                  child: Image.network(
                    'https://www.catolicasc.org.br/wp-content/uploads/2020/06/ilustracaoes_800x800px_la02-19.png',
                    width: 300,
                    height: 900,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class OutraPagina extends StatelessWidget {
  final List<String> imageUrls = [
    // URLs das imagens
    'https://cdn-icons-png.flaticon.com/256/10809/10809407.png',
    'https://cdn-icons-png.flaticon.com/512/6193/6193108.png',
    'https://i.pinimg.com/originals/06/d2/cf/06d2cfa5cd7f8fbe8e94ef5d75496a75.png',
    'https://cdn-icons-png.flaticon.com/512/2038/2038759.png',
    'https://cdn-icons-png.flaticon.com/512/8224/8224599.png',
    'https://images.vexels.com/media/users/3/144050/isolated/preview/4c16ceb88c59a498d6539ef5e60f1fe1-sorteio-de-anthena.png',
  ];

  final List<String> imageNames = [
    // Nomes dos itens do menu
    'Agenda',
    'Disciplina',
    'Históricos',
    'Horários',
    'Notas/Faltas',
    'Solicitações',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Menu',
          style: TextStyle(color: Colors.white), // Cor do texto
        ),
        backgroundColor: Color(0xff6b0d0f),
        iconTheme: IconThemeData(color: Colors.white), // Definindo a cor do ícone de voltar
      ),
      body: Container(
        color: Color(0xff6b0d0f),
        child: GridView.builder(
          itemCount: imageUrls.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Define o número de colunas
          ),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                // Ação a ser realizada quando um item do menu for clicado
                // Neste exemplo, navega para uma nova página
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProximaPagina()),
                );
              },
              child: GridTile(
                child: Column(
                  children: [
                    Expanded(
                      child: Image.network(
                        imageUrls[index],
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 12), // Espaço entre a imagem e o texto
                    Text(
                      imageNames[index],
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ProximaPagina extends StatelessWidget {
  final List<String> turmas = [
    '202411 - ENGENHARIA DE SOFTWARE',
    '202323 - ENGENHARIA DE SOFTWARE',
    '202311 - ENGENHARIA DE SOFTWARE',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Escolha um Período',
          style: TextStyle(color: Colors.white), // Cor do texto
        ),
        backgroundColor: Color(0xff6b0d0f),
        iconTheme: IconThemeData(color: Colors.white), // Definindo a cor do ícone de voltar
      ),
      body: Container(
        color: Color(0xff6b0d0f),
        padding: EdgeInsets.all(30.0),
        child: GridView.builder(
          itemCount: turmas.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 2.5,
          ),
          itemBuilder: (BuildContext context, int index) {
            return ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetalhesTurma(
                      nomeTurma: turmas[index],
                      notas: [8.5, 8.0, 9.0], // Substitua com as notas reais
                      faltas: 5, // Substitua com as faltas reais
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
              ),
              child: Text(
                turmas[index],
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff6b0d0f),
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class DetalhesTurma extends StatelessWidget {
  final String nomeTurma;
  final List<double> notas;
  final int faltas;

  DetalhesTurma({required this.nomeTurma, required this.notas, required this.faltas});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detalhes da Turma',
          style: TextStyle(color: Colors.white), // Cor do texto
        ),
          backgroundColor: Color(0xff6b0d0f),
          iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        color: Color(0xff6b0d0f),
        padding: EdgeInsets.all(30.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                nomeTurma,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Notas:',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  for (var i = 0; i < notas.length; i++)
                    Text(
                      'Nota ${i + 1}: ${notas[i]}',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                'Faltas: $faltas',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}