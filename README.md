# Flutter Counter Test Project

Este repositorio está dedicado a la creación de una aplicación de contador sencilla en Flutter, con el objetivo de comprender y aplicar diferentes tipos de pruebas para asegurar la calidad y funcionalidad del código.

## Objetivos

- **Pruebas Unitarias, de Widget y de Integración**: Comprender y aplicar tres tipos fundamentales de pruebas en Flutter para asegurar que el código funcione correctamente y que los cambios no introduzcan errores nuevos.
- **Herramientas de Prueba**: Configurar y utilizar herramientas como `flutter_test` y `mockito` para escribir y ejecutar pruebas efectivas.
- **Estrategias de Prueba**: Desarrollar estrategias para realizar pruebas de manera efectiva, garantizando la cobertura de código y la detección temprana de errores.

## Importancia de las Pruebas

Las pruebas son esenciales para asegurar que nuestro código funcione correctamente y para detectar problemas antes de que lleguen al usuario final. Además, facilitan el mantenimiento y la evolución del código al permitir realizar cambios con mayor seguridad.

### Tipos de Pruebas

1. **Pruebas Unitarias**  
   Prueban funciones y métodos individuales para asegurar que cumplen con los requisitos especificados.

   ```dart
   import 'package:flutter_test/flutter_test.dart';

   int sum(int a, int b) => a + b;

   void main() {
     test('sum adds two numbers', () {
       expect(sum(1, 2), 3);
     });
   }
   ```

2. **Pruebas de Widget**  
   Verifican la funcionalidad y apariencia de los widgets en la aplicación.

   ```dart
   import 'package:flutter/material.dart';
   import 'package:flutter_test/flutter_test.dart';

   void main() {
     testWidgets('Counter increments smoke test', (WidgetTester tester) async {
       await tester.pumpWidget(MyApp());

       expect(find.text('0'), findsOneWidget);
       expect(find.text('1'), findsNothing);

       await tester.tap(find.byIcon(Icons.add));
       await tester.pump();

       expect(find.text('0'), findsNothing);
       expect(find.text('1'), findsOneWidget);
     });
   }
   ```

3. **Pruebas de Integración**  
   Evalúan la interacción entre diferentes partes de la aplicación y servicios externos para asegurar que todo funcione en conjunto.

   ```dart
   import 'package:flutter_test/flutter_test.dart';
   import 'package:integration_test/integration_test.dart';
   import 'package:my_app/main.dart' as app;

   void main() {
     IntegrationTestWidgetsFlutterBinding.ensureInitialized();

     testWidgets('End-to-end test', (tester) async {
       app.main();
       await tester.pumpAndSettle();

       expect(find.text('0'), findsOneWidget);

       await tester.tap(find.byIcon(Icons.add));
       await tester.pumpAndSettle();

       expect(find.text('1'), findsOneWidget);
     });
   }
   ```

## Dependencias Recomendadas

Para realizar las pruebas, se recomienda utilizar las siguientes dependencias:

- **flutter_test:** Incluida con Flutter, es la herramienta principal para escribir y ejecutar pruebas unitarias y de widget.
- **mockito:** Una biblioteca popular para crear mocks y stubs en Dart, ideal para pruebas que requieren simular el comportamiento de dependencias externas.
  Añade estas dependencias en tu archivo pubspec.yaml:

```yaml
dev_dependencies:
  flutter_test:
    sdk: flutter
  mockito: ^5.0.0
```

## Pasos para Correr las Pruebas

1. Paso 1. Asegúrate de tener las dependencias necesarias en tu archivo pubspec.yaml y ejecuta `flutter pub get` para instalarlas.

2. Paso 2. Asegúrate de que tu aplicación de contador esté implementada correctamente con pruebas unitarias, de widget y de integración.

3. Paso 3. Verifica que tienes un dispositivo móvil o emulador configurado y corriendo si planeas ejecutar pruebas de integración.

4. Paso 4. Corre el comando `flutter test` y verifica el paso correcto de las pruebas unitarias y de widget.

5. Paso 5. Corre el comando `flutter test integration_test` y verifica el funcionamiento correcto del flujo del contador y el correcto paso del test (para este paso es necesario tener el dispositivo móvil corriendo).
