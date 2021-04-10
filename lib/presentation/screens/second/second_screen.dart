import 'package:blocbeginner/logic/cubits/cubits.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondScreen extends StatefulWidget {
  final String title;
  final Color color;

  const SecondScreen({Key key, @required this.title, @required this.color})
      : super(key: key);

  static const String routeName = '/second';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => SecondScreen(
        title: 'Second',
        color: Colors.redAccent,
      ),
    );
  }

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
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
            Text(
              'You have pushed this button many times',
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).decrement();
                    }),
                IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).increment();
                    }),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            MaterialButton(
              color: widget.color,
              onPressed: () {},
              child: Text('Go to Second Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
