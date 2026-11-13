
import 'package:flutter/material.dart';

import '../logica/calculadora.dart';
import '../modelos/cuenta.dart';
import '../widgets/fila_resultado.dart';

class PantallaCuenta extends StatefulWidget {
  const PantallaCuenta({super.key});

  @override
  State<PantallaCuenta> createState() => _PantallaCuentaState();
}

class _PantallaCuentaState extends State<PantallaCuenta> {
  final TextEditingController _montoController =
      TextEditingController();

  Cuenta _cuenta = const Cuenta();

  static const List<int> _opcionesPropina = [0, 10, 15, 20];

  @override
  void dispose() {
    _montoController.dispose();
    super.dispose();
  }

  void _actualizarMonto(String texto) {
    setState(() {
      _cuenta = _cuenta.copyWith(monto: leerMonto(texto));
    });
  }

  void _agregarPersona() {
    setState(() {
      _cuenta = agregarPersona(_cuenta);
    });
  }

  void _quitarPersona() {
    setState(() {
      _cuenta = quitarPersona(_cuenta);
    });
  }

  void _actualizarPropina(int? porcentaje) {
    if (porcentaje == null) return;

    setState(() {
      _cuenta = _cuenta.copyWith(propina: porcentaje);
    });
  }

  @override
  Widget build(BuildContext context) {
    final propina = formatearMonto(calcularPropina(_cuenta));
    final total = formatearMonto(calcularTotal(_cuenta));
    final porPersona = formatearMonto(calcularPorPersona(_cuenta));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Divisor de cuenta'),
        centerTitle: true,
      ),

      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 480),
              child: Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Icon(
                        Icons.restaurant,
                        size: 52,
                        color: Colors.teal,
                      ),

                      const SizedBox(height: 10),

                      Text(
                        'Calculá cuánto debe pagar cada persona',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),

                      const SizedBox(height: 24),

                      TextField(
                        controller: _montoController,
                        onChanged: _actualizarMonto,
                        keyboardType:
                            const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        decoration: const InputDecoration(
                          labelText: 'Monto de la cuenta',
                          hintText: 'Ej. 150.50',
                          prefixText: 'Bs ',
                          border: OutlineInputBorder(),
                        ),
                      ),

                      const SizedBox(height: 22),

                      Text(
                        'Cantidad de personas',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),

                      const SizedBox(height: 8),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton.filledTonal(
                            onPressed: _quitarPersona,
                            icon: const Icon(Icons.remove),
                            tooltip: 'Restar una persona',
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                            ),
                            child: Text(
                              '${_cuenta.personas}',
                              style: Theme.of(context)
                                  .textTheme.headlineSmall,
                            ),
                          ),

                          IconButton.filledTonal(
                            onPressed: _agregarPersona,
                            icon: const Icon(Icons.add),
                            tooltip: 'Sumar una persona',
                          ),
                        ],
                      ),

                      const SizedBox(height: 18),

                      DropdownButtonFormField<int>(
                        value: _cuenta.propina,
                        decoration: const InputDecoration(
                          labelText: 'Porcentaje de propina',
                          border: OutlineInputBorder(),
                        ),
                        items: _opcionesPropina.map((opcion) {
                          return DropdownMenuItem<int>(
                            value: opcion,
                            child: Text('$opcion %'),
                          );
                        }).toList(),
                        onChanged: _actualizarPropina,
                      ),

                      const SizedBox(height: 24),

                      const Divider(),

                      FilaResultado(
                        etiqueta: 'Propina:',
                        valor: propina,
                      ),

                      FilaResultado(
                        etiqueta: 'Total con propina:',
                        valor: total,
                      ),

                      FilaResultado(
                        etiqueta: 'Paga cada persona:',
                        valor: porPersona,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),

      // Identificación del desarrollador al pie de la aplicación.
      bottomNavigationBar: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: Colors.blue.shade900,
          ),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.code,
                color: Colors.white70,
                size: 22,
              ),

              SizedBox(height: 5),

              Text(
                'Desarrollado por',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                ),
              ),

              SizedBox(height: 4),

              Text(
                'Miguel A. Rocha',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),

              SizedBox(height: 4),

              Text(
                '© 2026 | Aplicación Flutter',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
