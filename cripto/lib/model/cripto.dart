class Cripto {
  final String nome;
  final String valor;
  final String urlImagem;

  const Cripto(
      {required this.nome, required this.valor, required this.urlImagem});

  factory Cripto.fromJson(Map<String, dynamic> json) {
    return Cripto(
      nome: json['name'] as String,
      valor: json['price'] as String,
      urlImagem: json['logo_url'] as String,
    );
  }
}
