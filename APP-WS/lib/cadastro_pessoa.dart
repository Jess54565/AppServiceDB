import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; //incluímos a biblioteca http

class CadastroPessoa extends StatefulWidget {
  final String title;
  const CadastroPessoa({Key? key, required this.title}) : super(key: key);

  @override
  _CadastroPessoaState createState() => _CadastroPessoaState();
}

class _CadastroPessoaState extends State<CadastroPessoa> {
  final _formKey = GlobalKey<FormState>();
  String nome = '';
  String email = '';
  String senha = '';
  bool isLoading = false;

  Future<void> cadastrandoPessoa() async {
    final url = Uri.parse(
        'http://localhost/atividade0904/cadastrar/cadastrar_usuario.php');
    //criamos a variável que vai conter a url para onde os dados serão enviados

    setState(() {
      isLoading = true; // Inicia o indicador de carregamento.
    });

    try {
      final response = await http.post(
        url,
        headers: {
          // Informa ao servidor que os dados envidos estão no formato de um formulário.
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'nome': nome,
          'email': email,
          'senha': senha,
        },
      );
    } catch (e) {
      print(
          "Erro ao cadastrar: $e"); // Caso tenha algum erro, será imprimido no terminal
    } finally {
      setState(() {
        isLoading = false; // Finaliza o indicador de carregamento
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
                      labelText: 'Nome',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    onChanged: (value) {
                      nome = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira o nome';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    onChanged: (value) {
                      email = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira o email';
                      }
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Por favor, insira um email válido';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Senha',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    obscureText: true,
                    onChanged: (value) {
                      senha = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira a senha';
                      }
                      if (value.length < 6) {
                        return 'A senha deve ter pelo menos 6 caracteres';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  isLoading
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF252525),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState?.validate() ?? false) {
                              await cadastrandoPessoa();
                              // chamamos a função para que ela seja executada após a validação
                              Navigator.pop(context);
                              //após o cadastro retorna para a tela inicial
                            }
                          },
                          child: const Text(
                            'Cadastrar',
                            style: TextStyle(
                              color: Colors.white, // Cor do texto
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
