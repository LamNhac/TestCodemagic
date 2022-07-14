import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/cubit/counter_cubit.dart';
import 'package:myapp/cubit/counter_cubit_state.dart';
import 'package:myapp/presentation/screens/SecondScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text(widget.title),
      ),
      body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Ban da bam dc ',
                ),
                BlocConsumer<CounterCubit,CounterCubitState>(
                  listener: (context,state) {
                    if(state.wasIncremented == true){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Increment!"),
                          duration: Duration(seconds: 1),
                          )
                        );
                      }
                    else if(state.wasIncremented == false){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Decrement!"),
                          duration: Duration(seconds: 1),
                          )
                        );
                    }
                  },
                  builder: (context,state) {
                    return Text(
                        state.counterValue.toString(),
                        style: Theme.of(context).textTheme.headline4,);
                  } ),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FloatingActionButton(
                      heroTag: 'Tagdecrement',
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context).decrement();
                      },
                      tooltip: 'Decrement',
                      child: const Icon(Icons.remove),
                    ),
                    FloatingActionButton(
                      heroTag: 'Tagincrement',
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context).increment();
                      },
                      tooltip: 'Increment',
                      child: const Icon(Icons.add),
                    )
                  ],
                
                
                ),
                SizedBox(
                  height: 24,
                ),
                MaterialButton(
                  onPressed: (){
                    Navigator.of(context).pushNamed('/second');
                  }, 
                  color: Colors.blueAccent,
                  child: Text('Go to second screen'),)
              ],
            ),
          
          )
      );
      // This trailing comma makes auto-formatting nicer for build methods.
    
  }
}
