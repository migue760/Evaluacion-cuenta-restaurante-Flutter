import '../modelos/cuenta.dart';

/// Convierte el texto ingresado a un monto válido.
/// Si está vacío o no representa un número, devuelve 0.
double leerMonto(String texto) {
  final monto = double.tryParse(texto.trim().replaceAll(',', '.'));
  if (monto == null || !monto.isFinite || monto < 0) {
    return 0.0;
  }
  return monto;
}

/// Calcula el importe de la propina según el porcentaje seleccionado.
double calcularPropina(Cuenta cuenta) {
  return cuenta.monto * cuenta.propina / 100;
}

/// Calcula el monto total incluyendo la propina.
double calcularTotal(Cuenta cuenta) {
  return cuenta.monto + calcularPropina(cuenta);
}

/// Calcula cuánto debe pagar cada persona.
double calcularPorPersona(Cuenta cuenta) {
  if (cuenta.personas < 1) {
    return 0.0;
  }
  return calcularTotal(cuenta) / cuenta.personas;
}

/// Devuelve una nueva cuenta con una persona adicional.
Cuenta agregarPersona(Cuenta cuenta) {
  return cuenta.copyWith(personas: cuenta.personas + 1);
}

/// Devuelve una nueva cuenta con una persona menos, sin bajar de una.
Cuenta quitarPersona(Cuenta cuenta) {
  final nuevasPersonas = cuenta.personas > 1 ? cuenta.personas - 1 : 1;
  return cuenta.copyWith(personas: nuevasPersonas);
}

/// Formatea un importe con dos decimales y el prefijo de bolivianos.
String formatearMonto(double monto) {
  return 'Bs ${monto.toStringAsFixed(2)}';
}
