import 'package:belajar_flutter_ppmp/bloc/block_imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter/counter_state.dart';

// import '../main.dart';
//
// void main() {
//   runApp(const MyApp());
// }

class HomeScreenBlocListener extends StatefulWidget {
  const HomeScreenBlocListener({Key? key}) : super(key: key);

  @override
  State<HomeScreenBlocListener> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreenBlocListener> {
  int counterValue = 0;

  void increaseCounter() {
    setState(() {
      counterValue++;
    });
  }

  void decreaseCounter() {
    setState(() {
      counterValue--;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('Semua\'HomeScreen\'dibangun');
    return Scaffold(
        appBar: AppBar(
          title: const Text('Latihan BLoC Dasar'),
        ),
        body: SafeArea(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          BlocListener<CounterBloc, CounterState>(listener: (context, state) {
            if (state is IncrementState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Penambahan berhasil"),
                  duration: Duration(milliseconds: 50),
                ),
              );
            } else if (state is DecrementState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Pengurangan berhasil"),
                  duration: Duration(milliseconds: 50),
                ),
              );
            }
          }, child: Center(child:
              BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
            return Text(
              'Nilai Counter: ${state.counterValue}',
              style: TextStyle(fontSize: 20),
            );
          }))),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                      onPressed: () => context
                          .read<CounterBloc>()
                          .add(CounterDecrementEvent()),
                      icon: const Icon(Icons.remove),
                      label: const Text('Kurang')),
                ),
                const SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: ElevatedButton.icon(
                      onPressed: () => context
                          .read<CounterBloc>()
                          .add(CounterIncrementEvent()),
                      icon: const Icon(Icons.add),
                      label: const Text('Tambah')),
                )
              ],
            ),
          )
        ])));
  }
}
