import 'package:flutter/material.dart';
import 'nova_pagina.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
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

class PaginaComFaixaVermelha extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: NovaPagina(),
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
          MaterialPageRoute(
              builder: (context) =>
                  OutraPagina()), // Navegue para a outra página
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: Column(
          children: [
            Container(
              color: Colors.red,
              height: 60,
              // Altura da faixa vermelha
              width: double.infinity,
              // Largura da faixa igual à largura da tela
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
                color: Colors.red, // Cor de fundo da página
                child: Center(
                  child: Image.network(
                    'https://www.catolicasc.org.br/wp-content/uploads/2020/06/ilustracaoes_800x800px_la02-19.png',
                    width: 300, // Largura da imagem
                    height: 900, // Altura da imagem
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
    'https://icons.iconarchive.com/icons/paomedia/small-n-flat/256/calendar-icon.png',
    'https://cdn-icons-png.flaticon.com/512/6193/6193108.png',
    'https://i.pinimg.com/originals/06/d2/cf/06d2cfa5cd7f8fbe8e94ef5d75496a75.png',
    'https://static.vecteezy.com/system/resources/previews/009/826/879/non_2x/one-o-clock-time-sign-design-icon-free-png.png',
    'https://cdn-icons-png.flaticon.com/512/8224/8224599.png',
    'https://cdn-icons-png.flaticon.com/512/5220/5220627.png',
  ];

  final List<String> imageNames = [
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
        title: Text('Menu'),
      ),
      body: Container(
        color: Colors.redAccent,
        child: GridView.builder(
          itemCount: imageUrls.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Define o número de colunas
          ),
          itemBuilder: (BuildContext context, int index) {
            return GridTile(
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
                  SizedBox(height: 8), // Espaço entre a imagem e o texto
                  Text(
                    imageNames[index],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
