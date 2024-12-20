import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_latihan/Homepage/home_cubit.dart';
//import 'package:training/homepage/home_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homepage'),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Counter App Using Cubit'),
            const SizedBox(
              height: 24,
            ),
            BlocBuilder<HomePageCubit, int>(
              builder: (context, state) {
                return Text(
                  'COUNTER : $state',
                  style: const TextStyle(
                    fontSize: 32,
                    color: Colors.green,
                  ),
                );
              },
            ),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
              onPressed: () {
                context.read<HomePageCubit>().increment();
              },
              child: const Text(
                'Increment',
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            ElevatedButton(
              onPressed: () {
                context.read<HomePageCubit>().decrement();
              },
              child: const Text(
                'Decrement',
              ),
            )
          ],
        ),
      ),
    );
  }
}
