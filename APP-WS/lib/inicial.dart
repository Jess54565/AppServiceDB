import 'package:GlamourApp/cadastro_pessoa.dart';
import 'package:GlamourApp/cadastro_produto.dart';
import 'package:flutter/material.dart';

class TelaInicial extends StatelessWidget {
  final String title;
  const TelaInicial({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2E1C2),
      appBar: AppBar(
        backgroundColor: Color(0xffF2E1C2),
        title: Text(title),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Alinha o texto no topo
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                'Bem-vindo ao Glamour!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff000000),
                ),
              ),
            ),
          ),
          const SizedBox(height: 50),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Botão para Cadastrar Pessoa
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CadastroPessoa(
                              title: title,
                            ),
                          ),
                        );
                      },
                      icon: Icon(Icons.person_add,
                          color: Colors.white), // Ícone com cor branca
                      label: Text(
                        'Cadastrar Pessoa',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color:
                              Colors.white, // Cor do texto definida para branco
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(200, 200),
                        backgroundColor: Color(0xff8C6E37),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),

// Botão para Cadastrar Produto
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CadastroProduto(
                              title: title,
                            ),
                          ),
                        );
                      },
                      icon: Icon(Icons.add_shopping_cart,
                          color: Colors.white), // Ícone com cor branca
                      label: Text(
                        'Cadastrar Produto',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color:
                              Colors.white, // Cor do texto definida para branco
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(200, 200),
                        backgroundColor: Color(0xff8C6E37),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
