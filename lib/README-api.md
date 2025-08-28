````markdown
# API client and token storage (Dio + Hive)

This folder contains a minimal Dio API client and a token storage helper using Hive.

Files added:

- `lib/api/api_client.dart` — configures Dio with baseUrl and an interceptor that reads the saved token from Hive and adds it as `Authorization: Bearer <token>` to every request.
- `lib/api/auth_api.dart` — simple `AuthApi` class with `login` and `logout`. `login` posts to `/login`, extracts `token` from the response and saves it to Hive.
- `lib/storage/token_storage.dart` — thin wrapper around Hive box `auth` to save/get/delete the token.

Usage notes:

1. Add dependencies to your `pubspec.yaml`:

```yaml
dependencies:
  dio: ^5.0.0
  hive: ^2.2.3
  hive_flutter: ^1.1.0
```

2. Initialize Hive in `main()` before running the app (example for Flutter):

```dart
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'storage/token_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await TokenStorage.init();
  runApp(MyApp());
}
```

3. Use `AuthApi().login(email: ..., password: ...)` from your login screen. On success the token is saved and all subsequent requests using `ApiClient().dio` will include the Authorization header automatically.

4. If you need to clear token on logout call `AuthApi().logout()` or `TokenStorage.deleteToken()`.

5. Adjust baseUrl and paths to match your backend. The baseUrl is currently set to `https://training-api-unrp.onrender.com` as requested.
````