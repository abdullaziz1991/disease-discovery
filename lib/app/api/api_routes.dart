abstract class ApiRoutes {
  ApiRoutes._();

  static const baseUrlDev = "http://192.168.1.130:5000/";

  static const select = _Select();
  static const get = _Get();
  static const update = _Update();
  static const insert = _Insert();
  static const delete = _Delete();
  static const services = _Services();
  static const image = _Image();
  static const notification = _Notification();
}

class _Select {
  const _Select();

  final selectUser = 'Login';
}

class _Get {
  const _Get();

}

class _Update {
  const _Update();

}

class _Insert {
  const _Insert();

}

class _Delete {
  const _Delete();

}

class _Services {
  const _Services();

  final predict = 'predict';

// final refreshToken = '${ApiRoutes.baseUrlDev}Services/RefreshToken.php';
}

class _Image {
  const _Image();

  final productImageUrl = 'http://192.168.1.130:8000/storage/productImages/';
  final userImageUrL = 'http://192.168.1.130:8000/storage/personalImages/';
}

class _Notification {
  const _Notification();
}

