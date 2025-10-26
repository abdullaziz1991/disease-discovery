
import 'package:disease_discovery_project/app/app_theme/extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/app_basic_widget/app_text_form_field.dart';

class AppSearchAppbar extends StatefulWidget implements PreferredSizeWidget {
  const AppSearchAppbar({super.key});

  @override
  State<AppSearchAppbar> createState() => _AppSearchAppbarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppSearchAppbarState extends State<AppSearchAppbar> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          AppBar(
              actions: [
                Padding(
                    padding: const EdgeInsetsDirectional.only(start: 16.0),
                    child: IconButton(
                      // color: Colors.black,
                        onPressed: () {

                        },
                        icon: const Icon(Icons.person_add_alt_1,
                            color: Colors.white))),
                10.horizontalSpace,
              ],
              backgroundColor: context.colorScheme.secondary,
              title: AppTextFormField(
                validator1: "The search can't be larger than 50 letter".tr(),
                validator2: "The search can't be larger than 2 letter".tr(),
                hintText: "Search Here".tr(),
                textInputType: TextInputType.text,
                icon: Icons.search,
                iconColor: context.colorScheme.onSecondary,

                maxLenght: 50,
                minLenght: 2,
                controllers: searchController,
                isBorderRemoved: true,
                onChanged: (value) {
                  // if (searchController.text.isEmpty) {
                  //   context
                  //       .read<PatientInformationBloc>()
                  //       .add(SearchPatientEvent(search: ''));
                  // }
                },
                onFieldSubmitted: (searchText) {
                  // context
                  //     .read<PatientInformationBloc>()
                  //     .add(SearchPatientEvent(search: searchText));
                },
                onSuffixPressed: () {
                  // searchController.clear();
                  // context
                  //     .read<PatientInformationBloc>()
                  //     .add(SearchPatientEvent(search: ''));
                },
                padding: 0,
                // contentPadding: 0
              ),
              iconTheme: IconThemeData(color: context.colorScheme.onSurface)),
          Container(
              height: 5, // ارتفاع الظل
              decoration: BoxDecoration(
                  color: Colors.transparent, // لا يؤثر على لون الخلفية
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      // لون الظل مع شفافية
                      blurRadius: 10,
                      // مدى انتشار الظل
                      offset: const Offset(0, 2), // اتجاه الظل (أفقي، عمودي)
                    )
                  ]))
        ]));
  }
}
