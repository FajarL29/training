import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_latihan/user/cubit/user_cubit.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User screen'),
      ),
      body: BlocProvider(
        create: (_) => UserCubit()..getUserList(),
        child: BlocConsumer<UserCubit, UserState>(
          builder: (ctx, state) {
            if (state is FecthUserSucces) {
              return ListView.builder(
                itemCount: state.data.length,
                itemBuilder: (ctx, index) {
                  return ListTile(
                    title: Text(state.data[index].title),
                    subtitle: Text(state.data[index].body),
                  );
                },
              );
            } else if (state is FecthUserFailed) {
              return Center(
                child: Text(state.message),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
          listener: (context, state) {
            // Tambahkan logika di sini jika diperlukan
          },
        ),
      ),
    );
  }
}