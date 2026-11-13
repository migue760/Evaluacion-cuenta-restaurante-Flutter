# Divisor de cuenta - Flutter

Aplicación Flutter para dividir una cuenta de restaurante entre varias personas y calcular la propina.

## Funcionalidades

- Ingreso del monto de la cuenta.
- Selector de propina: 0 %, 10 %, 15 % y 20 %.
- Botones para agregar o quitar personas.
- Cálculo en tiempo real de propina, total y monto por persona.
- El número de personas nunca baja de una.
- Un monto vacío o inválido se interpreta como `Bs 0.00`.

## Estructura solicitada

```text
lib/
├── main.dart
├── modelos/
│   └── cuenta.dart
├── logica/
│   └── calculadora.dart
├── widgets/
│   └── fila_resultado.dart
└── pantallas/
    └── pantalla_cuenta.dart
```
