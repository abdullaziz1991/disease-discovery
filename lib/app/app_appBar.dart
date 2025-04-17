import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../presentation/bloc/diseases_discovery_bloc.dart';
import '../presentation/widgets/app_text_style.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  // implements PreferredSizeWidget تجبر AppAppBar على تنفيذ preferredSize لتحديد حجم الشريط.
  // نستخدمها عندما نكون AppBar مخصص
  final String title;
  const AppAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        const SizedBox(width: 50),
      ],
      //backgroundColor: context.colorScheme.secondary,
      leading: InkWell(
        child: Padding(
            padding: EdgeInsets.all(10.r),
            child: Icon(Icons.language, size: 25.r, color: Colors.blueGrey)),
        onTap: () {
          // if (EasyLocalization.of(context)!.locale.languageCode == 'en') {
          //   context.setLocale(const Locale('ar'));
          // } else {
          //   context.setLocale(const Locale('en'));
          // }

          context
              .read<DiseasesDiscoveryBloc>()
              .add(ChangeLanguageEvent(context: context));
        },
      ),
      title: Center(
          child: Text(title,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20))
          //      AppTextStyle(
          //   text: title,
          //   fontWeight: FontWeight.w600,
          //   fontSize: 20.sp,
          //   //color: context.colorScheme.onSecondary
          // )
          ),
      // iconTheme: const IconThemeData(color: Colors.white)
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  // هنا، نُرجع ارتفاع kToolbarHeight (الارتفاع الافتراضي لشريط التطبيق في Flutter، وهو 56 بكسل)
}
