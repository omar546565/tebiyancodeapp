import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tebiyancode/modules/counter/cubit/cubit.dart';
import 'package:tebiyancode/modules/counter/cubit/states.dart';

class   counterScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context)=> CounterCubit(),
      child: BlocConsumer<CounterCubit, CounterStates>(
        listener: (context, state){
          if(state is CounterInitialState) print('initial state');
          if(state is CounterMinusState) print('minus state ${state.counter}');
          if(state is CounterPlusState) print('plus state ${state.counter}');
        },
        builder: (context,state)
        {

         return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              titleSpacing: 20.0,
              title: Row(
                children: const [
                  CircleAvatar(
                    radius: 20.0,
                    backgroundImage: NetworkImage(
                        'https://img.lovepik.com/free-png/20210918/lovepik-character-png-image_400195163_wh1200.png'),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Text(
                    'counter',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              actions: [
                IconButton(
                  icon: const CircleAvatar(
                    radius: 20.0,
                    backgroundColor: Colors.blue,
                    child: Icon(
                      Icons.camera_alt,
                      size: 25.0,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const CircleAvatar(
                    radius: 20.0,
                    backgroundColor: Colors.blue,
                    child: Icon(
                      Icons.edit,
                      size: 25.0,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            body: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: (){
                    CounterCubit.get(context).minus();

                  },
                  child: const Text(
                    'MINus',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: Text('${CounterCubit.get(context).counter}',
                    style: const TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: (){
                    CounterCubit.get(context).plus();

                  },
                  child: const Text(
                    'PLUS',
                  ),
                ),
              ],
            ) ,
          );
        },
      ),
    );
  }

}

