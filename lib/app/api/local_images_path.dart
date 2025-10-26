abstract class ImagesPath {
  ImagesPath._();

  static const app = _App();
  static const auth = _Auth();
  static const drawer = _Drawer();
    static const lottie = _Lottie();

  // static const profile = _Profile();
  static const addProduct = _AddProduct();
  static const basicPage = _BasicPage();
  static const defaultImage = _DefaultImage();
}

class _App {
  const _App();
  final image = "assets/images/app/app_icon.png";
}

class _Auth {
  const _Auth();
  final email = "assets/images/auth/email.png";
  final imageBottom = "assets/images/auth/background_bottom.png";
  final imageTop = "assets/images/auth/background_top.png";
  final googleIcon = "assets/images/auth/google_icon.png";
}

class _Lottie {
  const _Lottie();
  final loadingCircleCheckRed= "assets/Animation/Loading_circle_check_red.json";
  final loadingTwoCircleBlue = "assets/Animation/loading_two_circle_blue.json";
  final loadingSquareAndTriangle =
      "assets/Animation/Loading_square_and_triangle.json";
  final noInternet = "assets/Animation/no_internet.json";
}

class _Drawer {
  const _Drawer();
}

// class _Profile {
//   const _Profile();

// }

class _AddProduct {
  const _AddProduct();
}

class _BasicPage {
  const _BasicPage();
  final search = "assets/images/basic_page/basic_page_search.png";
  final categories = "assets/images/basic_page/categories_icon.png";
}

class _DefaultImage {
  const _DefaultImage();
  final product = "assets/images/default/goods.jpg";
  final defaultProduct = "assets/images/default/default_product.png";
  final maleImage = "assets/images/default/male_image.jpg";
  final femaleImage = "assets/images/default/female_image.jpg";
  final clinicImage = "assets/images/default/clinc_image.jpg";
}
