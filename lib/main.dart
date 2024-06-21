import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash/data/model/itemModel.dart';

import 'package:slash/presentation/mainViwe/viwe.dart';

import 'data/rebo/rebo.dart';
import 'presentation/bloc/blocImp.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final DataRepository repository = DataRepository();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit(repository)..fetchData(),
        ),
        // Add more BlocProviders if needed
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainView(), // Set the initial route or widget to MainView()
      ),
    );
  }
}

