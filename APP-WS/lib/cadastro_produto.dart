import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CadastroProduto extends StatefulWidget {
  final String title;
  const CadastroProduto({Key? key, required this.title}) : super(key: key);

  @override
  _CadastroProdutoState createState() => _CadastroProdutoState();
}

class _CadastroProdutoState extends State<CadastroProduto> {
  final _formKey = GlobalKey<FormState>();
  String nomeProduto = '';
  String codigoProduto = '';
  String descricao = '';
  String precoProduto = '';
  String qntdDisponivel = '';
  bool isLoading = false;

  Future<void> cadastrandoProduto() async {
    final url = Uri.parse(
        'http://localhost/atividade0904/cadastrar/cadastrar_produto.php');
    setState(() {
      isLoading = true;
    });

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'nomeprod': nomeProduto,
          'descprod': descricao,
          'codprod': codigoProduto,
          'precoprod': precoProduto,
          'qntdprod': qntdDisponivel,
        },
      );
    } catch (e) {
      // Tratar erros
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2E1C2),
      appBar: AppBar(
        backgroundColor: const Color(0xffF2E1C2),
        title: Text(widget.title),
      ),
      body: Center(
        child: Card(
          color: const Color(0xff8C6E37),
          margin: const EdgeInsets.all(16),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Nome do Produto',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    onChanged: (value) {
                      nomeProduto = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira o nome do produto';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Código Produto',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    onChanged: (value) {
                      codigoProduto = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira o código do produto';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Preço do Produto',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    onChanged: (value) {
                      precoProduto = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira o preço do produto';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Descrição do Produto',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    onChanged: (value) {
                      descricao = value;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Quantidade disponível',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    onChanged: (value) {
                      qntdDisponivel = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira a quantidade disponível';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  isLoading
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState?.validate() ?? false) {
                              await cadastrandoProduto();
                              Navigator.pop(
                                  context); // Retorna para a tela anterior
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color(0xff252525), // Cor do botão
                          ),
                          child: const Text(
                            'Cadastrar',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
