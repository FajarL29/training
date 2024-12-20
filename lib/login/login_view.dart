import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:flutter_latihan/flutter/dev/benchmarks/macrobenchmarks/lib/main.dart';
import 'package:flutter_latihan/homepage/home_page.dart';
//import 'package:flutter_latihan/homepage/home_page.dart';
//import 'package:flutter_latihan/login/cubit/login_cubit.dart';

import 'cubit/login_cubit.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.watch<LoginCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(
                  'https://files.klob.id/public/mco01/kgrvzul8/Logo_TMMIN_-_HRD_Recruitmentent_TMMIN.png',
                  width: 200,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              const Text(
                'Login',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const Text('Email'),
              const SizedBox(
                height: 12,
              ),
              TextFormField(
                controller: cubit.emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  counter: Text('Size'),
                  hintText: 'Mohon di isi',
                  contentPadding: EdgeInsets.all(
                    12,
                  ),
                  prefixIcon: Icon(
                    Icons.email,
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const Text('Password'),
              const SizedBox(
                height: 12,
              ),
              TextFormField(
                controller: cubit.passwordController,
                obscureText: cubit.hidePassword,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  contentPadding: const EdgeInsets.all(
                    12,
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      context.read<LoginCubit>().togglePassword();
                    },
                    child: cubit.hidePassword
                        ? const Icon(
                            Icons.visibility_off,
                          )
                        : const Icon(
                            Icons.visibility,
                          ),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              BlocConsumer<LoginCubit, LoginState>(
                listener: (context, state) {
                  if (state is LoginSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Login Berhasil'),
                      ),
                    );
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                      (route) => false,
                    );

                    // Arahkan ke homepage
                  } else if (state is LoginFailed) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      onPressed: () {
                        context.read<LoginCubit>().login();
                      },
                      child: state is LoginLoading
                          ? const SizedBox(
                              height: 30,
                              width: 30,
                              child: CircularProgressIndicator())
                          : const Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
