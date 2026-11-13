import 'package:flutter/material.dart';

class FilaResultado extends StatelessWidget {
  final String etiqueta;
  final String valor;

  const FilaResultado({
    super.key,
    required this.etiqueta,
    required this.valor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            etiqueta,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            valor,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
