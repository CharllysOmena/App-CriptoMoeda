import 'package:flutter/material.dart';

class TelaErro extends StatelessWidget {
  const TelaErro({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Icon(
            Icons.dangerous_outlined,
            color: Colors.red,
            size: 80,
          ),
          Text(
            "Conexão de rede não encontrada!",
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
