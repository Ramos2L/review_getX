import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/controller_list.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final controller = Get.find<ControllerList>();

  TextEditingController controllerData = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Stack(
        key: const Key('stack'),
        alignment: AlignmentDirectional.center,
        children: [
          controller.obx(
            (state) => Column(
              key: const Key('column'),
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(8),
                    itemCount: controller.listData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Dismissible(
                        key: Key(controller.listData[index]),
                        direction: DismissDirection.endToStart,
                        onDismissed: (_) => controller.decrementData(index),
                        background: Container(
                          color: Colors.redAccent,
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: const Icon(Icons.delete, color: Colors.white),
                        ),
                        child: Container(
                          height: 50,
                          color: Theme.of(context).colorScheme.inversePrimary,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 5,
                                  vertical: 10,
                                ),
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: controller.listData[index].length > 2
                                      ? Text(
                                          controller.listData[index]
                                              .substring(0, 2),
                                        )
                                      : Text(
                                          controller.listData[index]
                                              .substring(0, 1),
                                        ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  controller.listData[index],
                                  style: const TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                  ),
                ),
              ],
            ),
            onEmpty: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: const Center(
                child: Text(
                  key: Key('text_empty_key'),
                  'Write data for save:',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .1,
              decoration: const BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                      child: TextFormField(controller: controllerData),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 20, 10),
                    child: ElevatedButton(
                      key: const Key('button'),
                      onPressed: () {
                        if (controllerData.text.isEmpty) {
                          // const snackBar = SnackBar(
                          //   content: Text('write message'),
                          //   duration: Duration(seconds: 3),
                          // );
                          // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          var snackBar = Get.showSnackbar(
                            const GetSnackBar(
                              key: ValueKey('snack_bar'),
                              backgroundColor: Colors.redAccent,
                              ///title: 'write message',
                              message: 'write message',
                              ///titleText: Text('write message'),
                              // messageText: Text(
                              //   key: Key('text'),
                              //   'write message',
                              // ),
                              icon: Icon(
                                Icons.refresh,
                                color: Colors.teal,
                              ),
                              duration: Duration(seconds: 3),
                            ),
                          );
                        }
                        if (controllerData.text.isNotEmpty) {
                          controller.incrementData(controllerData.text);
                          controllerData.text = '';
                        }
                      },
                      child: const Center(
                        child: Icon(Icons.add, color: Colors.teal),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controllerData.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}
