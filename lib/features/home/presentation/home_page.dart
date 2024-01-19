import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit_task/core/utility/pallete.dart';
import 'package:reddit_task/features/home/application/cubit/home_cubit.dart';
import 'package:reddit_task/features/home/presentation/home_page_body.dart';
import 'package:reddit_task/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:responsive_builder/responsive_builder.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HomeCubit>(context);
    cubit.mq = MediaQuery.of(context);
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          key: cubit.scaffoldKey,
          backgroundColor: Pallete.blackColor,
          appBar: !cubit.isBottomSheetOpen
              ? PreferredSize(
                  preferredSize: Size.fromHeight(13.sw),
                  child: const CustomAppBar(),
                )
              : null,
          body: const HomePageBody(),
          // bottomSheet: const Card(),
        );
      },
    );
  }
}
