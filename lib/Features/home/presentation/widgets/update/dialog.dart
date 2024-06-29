import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gli/Features/createtask/data/models/taskModel.dart';
import 'package:gli/Features/home/cubit/update/update_cubit.dart';
import 'package:gli/Features/home/presentation/widgets/update/title.dart';
import 'package:gli/Features/home/presentation/widgets/update/update_btn.dart';
import 'package:gli/Features/home/presentation/widgets/update/update_inputs.dart';
import '../../../../../app/injuctoin_container.dart';

Future<void> myDialog(context, TaskModel model, String id) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      sl<UpdateCubit>().updateTitleCon.text = model.title!;
      sl<UpdateCubit>().updateDescCon.text = model.description!;
      return BlocConsumer<UpdateCubit, UpdateState>(
        listener: (context, state) {
          if (state is UpdateTasksSuccessState) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            title: const DialogTitle(),
            contentPadding: const EdgeInsets.all(10),
            content: Form(
                key: sl<UpdateCubit>().updateKey, child: const UpdateInputs()),
            actions: [UpdateBtn(id: id)],
          );
        },
      );
    },
  );
}
