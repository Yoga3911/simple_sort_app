import 'package:double_linked_list/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'sort_algo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DoublyLinkedList linkedList = DoublyLinkedList();
  TextEditingController arrayController = TextEditingController();
  TextEditingController beforeController = TextEditingController();
  TextEditingController afterController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Merge Sort for Doubly Linked List'),
        backgroundColor: red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: arrayController,
                decoration: InputDecoration(
                  hintText: "Array Data",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9,]')),
                ],
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  beforeController.text = arrayController.text;
                },
                child: const Text(
                  "Submit",
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: beforeController,
                readOnly: true,
                decoration: InputDecoration(
                  hintText: "Data before sort",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                maxLines: 5,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  linkedList = DoublyLinkedList();
                  for (String i in arrayController.text.split(",")) {
                    linkedList.append(int.parse(i));
                  }
                  linkedList.mergeSortList();
                  afterController.text = linkedList
                      .printList()
                      .toString()
                      .replaceAll("[", "")
                      .replaceAll("]", "");
                },
                child: const Text(
                  "Sort",
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: afterController,
                readOnly: true,
                decoration: InputDecoration(
                  hintText: "Data after sort",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                maxLines: 5,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  linkedList = DoublyLinkedList();
                  arrayController.clear();
                  beforeController.clear();
                  afterController.clear();
                },
                child: const Text(
                  "Reset",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
