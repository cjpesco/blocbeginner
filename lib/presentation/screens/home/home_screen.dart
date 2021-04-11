import 'package:blocbeginner/contants/constants.dart';
import 'package:blocbeginner/logic/cubits/cubits.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  final String title;
  final Color color;

  const HomeScreen({Key key, @required this.title, @required this.color})
      : super(key: key);

  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => HomeScreen(
        title: 'Home',
        color: Colors.blueAccent,
      ),
    );
  }

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Cubit'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<InternetCubit, InternetState>(
              builder: (context, state) {
                if (state is InternetConnected &&
                    state.connectionType == ConnectionType.Wifi) {
                  return Text(
                    'Wi-Fi',
                    style: Theme.of(context).textTheme.headline3.copyWith(
                          color: Colors.green,
                        ),
                  );
                } else if (state is InternetConnected &&
                    state.connectionType == ConnectionType.Mobile) {
                  return Text(
                    'Mobile',
                    style: Theme.of(context).textTheme.headline3.copyWith(
                          color: Colors.red,
                        ),
                  );
                } else if (state is InternetDisconnected) {
                  return Text(
                    'Disconnected',
                    style: Theme.of(context).textTheme.headline3.copyWith(
                          color: Colors.grey,
                        ),
                  );
                }
                return CircularProgressIndicator();
              },
            ),
            Divider(
              height: 5.0,
            ),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.status == CounterStatus.increment) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.green,
                      content: Text('Incremented!'),
                      duration: Duration(milliseconds: 300),
                    ),
                  );
                } else if (state.status == CounterStatus.decrement) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red,
                      content: Text('Decremented!'),
                      duration: Duration(milliseconds: 300),
                    ),
                  );
                }
              },
              builder: (context, state) {
                String messageState;
                if (state.counterValue < 0) {
                  messageState = 'YAY NEGATIVE';
                } else if (state.counterValue % 2 == 0) {
                  messageState = 'YAYY ';
                } else if (state.counterValue == 5) {
                  messageState = 'HMMM NUMBER';
                } else if (state.counterValue < 0) {
                  messageState = 'YAY NEGATIVE';
                } else {
                  messageState = '';
                }

                return Text(
                  '$messageState  ${state.counterValue}',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 50.0,
                    fontWeight: FontWeight.w600,
                  ),
                );
              },
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     IconButton(
            //         icon: Icon(Icons.remove),
            //         onPressed: () {
            //           BlocProvider.of<CounterCubit>(context).decrement();
            //         }),
            //     IconButton(
            //         icon: Icon(Icons.add),
            //         onPressed: () {
            //           BlocProvider.of<CounterCubit>(context).increment();
            //         }),
            //   ],
            // ),
            // SizedBox(
            //   height: 10.0,
            // ),
            // MaterialButton(
            //   color: widget.color,
            //   child: Text('Go to Second Screen'),
            //   onPressed: () {
            //     Navigator.of(context).pushNamed('/second');
            //   },
            // ),
            // MaterialButton(
            //   color: widget.color,
            //   child: Text('Go to Third Screen'),
            //   onPressed: () {
            //     Navigator.of(context).pushNamed('/third');
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
