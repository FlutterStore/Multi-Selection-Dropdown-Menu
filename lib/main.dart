// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multi Selection Dropdown',style: TextStyle(fontSize: 15,)),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('WRAP', style: TextStyle(
                fontSize: 15,
                color: Colors.green,
              )),
              const SizedBox(
                height: 10,
              ),
              MultiSelectDropDown(
                onOptionSelected: (options) {
                  debugPrint(options.toString());
                },
                options: const <ValueItem>[
                  ValueItem(label: 'Option 1', value: '1'),
                  ValueItem(label: 'Option 2', value: '2'),
                  ValueItem(label: 'Option 3', value: '3'),
                  ValueItem(label: 'Option 4', value: '4'),
                  ValueItem(label: 'Option 5', value: '5'),
                  ValueItem(label: 'Option 6', value: '6'),
                ],
                selectionType: SelectionType.multi,
                chipConfig: const ChipConfig(
                    wrapType: WrapType.wrap, backgroundColor: Colors.red),
                dropdownHeight: 300,
                optionTextStyle: const TextStyle(fontSize: 16),
                selectedOptionIcon: const Icon(
                  Icons.checklist,
                  color: Colors.pink,
                ),
                selectedOptionTextColor: Colors.green,
              ),
              const SizedBox(
                height: 50,
              ),
              const Text('SCROLL', style: TextStyle(
                fontSize: 15,
                color: Colors.green,
              )),
              const SizedBox(
                height: 10,
              ),
              MultiSelectDropDown(
                onOptionSelected: (options) {
                  debugPrint(options.toString());
                },
                options: const <ValueItem>[
                  ValueItem(label: 'Option 1', value: '1'),
                  ValueItem(label: 'Option 2', value: '2'),
                  ValueItem(label: 'Option 3', value: '3'),
                  ValueItem(label: 'Option 4', value: '4'),
                  ValueItem(label: 'Option 5', value: '5'),
                  ValueItem(label: 'Option 6', value: '6'),
                ],
                selectionType: SelectionType.multi,
                chipConfig: const ChipConfig(wrapType: WrapType.scroll,backgroundColor: Colors.green),
                dropdownHeight: 400,
                optionTextStyle: const TextStyle(fontSize: 16),
                selectedOptionIcon: const Icon(Icons.check_circle,color: Colors.green,),
                selectedOptionTextColor: Colors.green,
              ),
              const SizedBox(
                height: 50,
              ),
              const Text('FROM NETWORK', style: TextStyle(
                fontSize: 15,
                color: Colors.green,
              )),
              const SizedBox(
                height: 10,
              ),
              MultiSelectDropDown.network(
                dropdownHeight: 200,
                selectedOptionIcon: const Icon(Icons.check,color: Colors.green,),
                selectedOptionTextColor: Colors.green,
                onOptionSelected: (options) {
                  debugPrint(options.toString());
                },
                networkConfig: NetworkConfig(
                  url: 'https://jsonplaceholder.typicode.com/users',
                  method: RequestMethod.get,
                  headers: {
                    'Content-Type': 'application/json',
                  },
                ),
                chipConfig: const ChipConfig(wrapType: WrapType.wrap,backgroundColor: Colors.green),
                responseParser: (response) {
                  debugPrint('Response: $response');
        
                  final list = (response as List<dynamic>).map((e) {
                    final item = e as Map<String, dynamic>;
                    return ValueItem(
                      label: item['name'],
                      value: item['id'].toString(),
                    );
                  }).toList();
        
                  return Future.value(list);
                },
                responseErrorBuilder: ((context, body) {
                  return const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text('Error fetching the data'),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    )
    );
  }
}