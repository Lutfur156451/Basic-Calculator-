import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'module/calculator/controller/calculation_controller.dart';

void main() {
  runApp(GetMaterialApp(home: CalculatorApp()));
}

class CalculatorApp extends StatelessWidget {
  final calculatorController = Get.put(CalculatorController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Flexible(
                    child: Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 7.0, right: 4),
                        child: TextField(
                          onChanged: (value) => calculatorController
                              .firstNum.value = double.parse(value),
                          keyboardType: TextInputType.number,
                          controller: calculatorController.firstValueController,
                          decoration: const InputDecoration(
                            labelText: 'First Number',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 7.0, right: 4),
                        child: TextField(
                          onChanged: (value) => calculatorController
                              .secondNum.value = double.parse(value),
                          keyboardType: TextInputType.number,
                          controller: calculatorController.lastValueController,
                          decoration: const InputDecoration(
                            labelText: 'Second Number',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Obx(() => SizedBox(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 12.0, right: 12, top: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Result:',
                              style: TextStyle(fontSize: 20.0),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text(
                              ' ${calculatorController.result.value}',
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.green),
                            ),
                          ],
                        ),
                      ),
                    )),
              ),
              const SizedBox(height: 16.0),
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SizedBox(
                  height: 170,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Flexible(
                        child: Row(
                          children: [
                            Flexible(
                              child: Card(
                                child: SizedBox(
                                  height: MediaQuery.of(context).size.height,
                                  width: MediaQuery.of(context).size.width,
                                  child: ElevatedButton(
                                    onPressed: calculatorController.add,
                                    child: Text('Add'),
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              child: Card(
                                child: SizedBox(
                                  height: MediaQuery.of(context).size.height,
                                  width: MediaQuery.of(context).size.width,
                                  child: ElevatedButton(
                                    onPressed: calculatorController.subtract,
                                    child: Text('Subtract'),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: Row(
                          children: [
                            Flexible(
                              child: Card(
                                child: SizedBox(
                                  height: MediaQuery.of(context).size.height,
                                  width: MediaQuery.of(context).size.width,
                                  child: ElevatedButton(
                                    onPressed: calculatorController.multiply,
                                    child: Text('Multiply'),
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              child: Card(
                                child: SizedBox(
                                  height: MediaQuery.of(context).size.height,
                                  width: MediaQuery.of(context).size.width,
                                  child: ElevatedButton(
                                    onPressed: calculatorController.divide,
                                    child: Text('Divide'),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 12,
                  child: ElevatedButton(
                      onPressed: () {
                        calculatorController.clear();
                      },
                      child: Text("Clear")),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
