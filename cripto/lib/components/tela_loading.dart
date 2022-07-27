import 'package:flutter/material.dart';

class TelaCarregamento extends StatelessWidget {
  const TelaCarregamento({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          CircularProgressIndicator(),
          Text("Carregando"),
        ],
      ),
    );
  }
}
