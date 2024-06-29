import 'package:flutter/material.dart';
import 'package:gli/Features/createtask/cubit/task_cubit.dart';
import 'package:gli/Features/home/cubit/home/home_cubit.dart';
import 'package:gli/core/utiles/default_text_field.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../app/injuctoin_container.dart';

class MyAlert {
  static show(context) => Alert(
          context: context,
          title: null,
          content: Column(
            children: <Widget>[
              DefaultField(
                  borderRadius: BorderRadius.circular(20),
                  filled: true,
                  controller: sl<TaskCubit>().titleController,
                  hint: 'title',
                  maxLines: 1,
                  isPassword: false,
                  textInputType: TextInputType.text,
                  validation: (value) {
                    if (value.isEmpty) {
                      return 'aaa';
                    }
                  },
                  borderSide: false),
              const SizedBox(height: 8),
              DefaultField(
                  filled: true,
                  borderRadius: BorderRadius.circular(20),
                  controller: sl<TaskCubit>().titleController,
                  hint: 'title',
                  maxLines: 3,
                  isPassword: false,
                  textInputType: TextInputType.text,
                  validation: (value) {
                    if (value.isEmpty) {
                      return 'aaa';
                    }
                  },
                  borderSide: false),
            ],
          ),
          buttons: [
            DialogButton(
              padding: const EdgeInsets.all(10),
              onPressed: () => Navigator.pop(context),
              child: const Text(
                "LOGIN",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          ]).show();
}
