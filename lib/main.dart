import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/show_news/presentetion/news%20cubit/news_cubit.dart';

import 'package:news_app/features/show_news/presentetion/pages/home_page.dart';

import 'core/constants/palette.dart';
import 'core/services_locator.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => s1<NewsCubit>()),
  
        // BlocProvider(create: (context) => s1<TextCubit>()),
      ],
     child: MaterialApp(
      title:'News App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: const ColorScheme.light().copyWith(
          secondary: Palette.deepBlue,

        ),
        fontFamily: 'Poppins',
      ),
      home:  HomePage(),

     ),
    );
  }
}
    