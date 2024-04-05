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
    'https://cdn-icons-png.flaticon.com/256/10809/10809407.png',
    'https://cdn-icons-png.flaticon.com/512/6193/6193108.png',
    'https://i.pinimg.com/originals/06/d2/cf/06d2cfa5cd7f8fbe8e94ef5d75496a75.png',
    'https://cdn-icons-png.flaticon.com/512/2038/2038759.png',
    'https://cdn-icons-png.flaticon.com/512/8224/8224599.png',
    'https://images.vexels.com/media/users/3/144050/isolated/preview/4c16ceb88c59a498d6539ef5e60f1fe1-sorteio-de-anthena.png',
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
            return GestureDetector(
              onTap: () {
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
  // Lista de nomes de turmas
  final List<String> turmas = [
    '202411 - ENGENHARIA DE SOFTWARE',
    '202323 - ENGENHARIA DE SOFTWARE',
    '202311 - ENGENHARIA DE SOFTWARE',
    // Adicione mais turmas conforme necessário
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Escolha seu Período'),
      ),
      body: Container(
        color: Colors.red, // Fundo branco
        padding: EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: turmas.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, // Define o número de colunas
            crossAxisSpacing: 10.0, // Espaçamento entre colunas
            mainAxisSpacing: 10.0, // Espaçamento entre linhas
            childAspectRatio: 2.5, // Proporção entre largura e altura dos itens
          ),
          itemBuilder: (BuildContext context, int index) {
            return ElevatedButton(
              onPressed: () {
                // Ação ao pressionar o botão (pode ser personalizado)
                print(turmas[index]);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // Cor de fundo do botão
              ),
              child: Text(
                turmas[index],
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.red), // Cor do texto do botão
              ),
            );
          },
        ),
      ),
    );
  }
}
