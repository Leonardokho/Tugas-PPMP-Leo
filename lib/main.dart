import 'package:belajar_flutter_ppmp/bloc/block_imports.dart';
import 'package:belajar_flutter_ppmp/bloc/my_observer.dart';
import 'package:belajar_flutter_ppmp/screen/home_screen_blocconsumer.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

void main() {
  BlocOverrides.runZoned(() => runApp(const MyApp()),
      blocObserver: MyBlocObserver());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        title: 'Tugas Leonardo',
        theme: ThemeData(primarySwatch: Colors.blue),
        debugShowCheckedModeBanner: false,
        home: const HomeScreenBlocConsumer(),
      ),
    );
  }
}
