import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit_task/core/presentation/app_widget.dart';
import 'package:reddit_task/features/home/application/cubit/home_cubit.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => HomeCubit(),
      ),
    ],
    child: const MyApp(),
  ));
}
