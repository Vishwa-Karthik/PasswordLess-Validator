# Password Less Validation 
## A simple Flutter password-less authenticator using [Magic Link](https://magic.link/)



## Installation
Add Magic_sdk to your pubspec.yaml
```dart

dependencies:
  flutter:
    sdk: flutter
  magic_sdk: ^0.5.0
```
## Add Dependencies
```dart
import 'package:magic_sdk/magic_sdk.dart';
```

## Create SDK instance 

Head over to Magic Link to save your public key API. We will call this "TOKEN"
```dart
void main()  {
  Magic.instance = Magic('YOUR API TOKEN');
}
```

### Use Stack in the top level and add <code>Magic.instance.relayer</code> to the children of Stack to ensure the best performance.
```dart

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Stack(children: [             // Use Stack() here
          MaterialApp(
            title: 'Magic Demo',
            home: const LoginPage(),
          ),
          Magic.instance.relayer // Insert Magic relayer here
        ]));
  }
}
```

## Head over to [<code>Flutter Docs</code>](https://magic.link/docs/login-methods/email/integration/flutter) to have better insights.
