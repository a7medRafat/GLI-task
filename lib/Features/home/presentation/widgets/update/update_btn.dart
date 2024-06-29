import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/injuctoin_container.dart';
import '../../../cubit/update/update_cubit.dart';

class UpdateBtn extends StatelessWidget {
  const UpdateBtn({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateCubit, UpdateState>(
      listener: (context, state) {},
      child: TextButton(
        child: const Text('Update'),
        onPressed: () {
          if (sl<UpdateCubit>().updateKey.currentState!.validate()) {
            sl<UpdateCubit>().updateTask(id: id, map: {
              'title': sl<UpdateCubit>().updateTitleCon.text,
              'description': sl<UpdateCubit>().updateDescCon.text,
            });
          }
        },
      ),
    );
  }
}
