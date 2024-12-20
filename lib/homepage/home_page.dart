import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_latihan/Homepage/home_cubit.dart';
import 'package:flutter_latihan/Homepage/home_view.dart';
// import 'package:training/homepage/home_cubit.dart';
// import 'package:training/homepage/home_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomePageCubit(),
      child: const HomeView(),
    );
  }
}
