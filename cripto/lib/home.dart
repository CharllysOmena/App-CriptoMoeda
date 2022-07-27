import 'package:cripto/api/webClient.dart';
import 'package:cripto/model/cripto.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import 'components/tela_error.dart';
import 'components/tela_loading.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final String _titulo = "CriptoMoedas";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titulo),
        backgroundColor: Colors.red,
      ),
      body: ListaFuture(),
    );
  }
}

class ListaFuture extends StatefulWidget {
  const ListaFuture({
    Key? key,
  }) : super(key: key);

  @override
  State<ListaFuture> createState() => _ListaFutureState();
}

class _ListaFutureState extends State<ListaFuture> {
  NumberFormat real = NumberFormat.currency(locale: 'pt_BR', name: "R\$");
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Cripto>>(
      future: fetchCripto(http.Client()),
      builder: ((context, snapshot) {
        if (snapshot.hasError) {
          return const TelaErro();
        } else if (snapshot.hasData) {
          List<Cripto> cripto = snapshot.data!;
          return RefreshIndicator(
            onRefresh: () async {
              var newList = await Future.delayed(
                  Duration(seconds: 2), () => fetchCripto(http.Client()));
              setState(() {
                cripto = newList;
              });
            },
            child: ListView.builder(
              itemCount: cripto.length,
              itemBuilder: ((context, index) {
                double valor = double.parse(cripto[index].valor);
                return Card(
                  child: ListTile(
                    leading: Container(
                      child: SvgPicture.network(
                        cripto[index].urlImagem,
                        height: 40,
                        width: 40,
                      ),
                    ),
                    title: Text(cripto[index].nome),
                    subtitle: Text(real.format(valor)),
                  ),
                );
              }),
            ),
          );
        } else {
          return const TelaCarregamento();
        }
      }),
    );
  }
}
