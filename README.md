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

## Cómo ejecutar

1. Crear un proyecto Flutter: `flutter create divisor_cuenta`.
2. Copiar la carpeta `lib` de este proyecto sobre la carpeta `lib` creada.
3. Desde la carpeta del proyecto ejecutar:

```bash
flutter pub get
flutter run
```

No se requieren dependencias externas.
