import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/injuctoin_container.dart';
import '../../../../../core/utiles/Liner_progress_widget.dart';
import '../../../../../core/utiles/default_text_field.dart';
import '../../../cubit/update/update_cubit.dart';

class UpdateInputs extends StatelessWidget {
  const UpdateInputs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateCubit, UpdateState>(
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DefaultField(
                borderRadius: BorderRadius.circular(5),
                filled: true,
                controller: sl<UpdateCubit>().updateTitleCon,
                hint: 'title',
                maxLines: 1,
                isPassword: false,
                textInputType: TextInputType.text,
                validation: (value) {
                  if (value.isEmpty) {
                    return 'title required';
                  }
                },
                borderSide: false),
            const SizedBox(height: 8),
            DefaultField(
                filled: true,
                borderRadius: BorderRadius.circular(5),
                controller: sl<UpdateCubit>().updateDescCon,
                hint: 'Description',
                maxLines: 4,
                isPassword: false,
                textInputType: TextInputType.text,
                validation: (value) {
                  if (value.isEmpty) {
                    return 'description required';
                  }
                },
                borderSide: false),
            if (state is UpdateTasksLoadingState) const LinearLoading()
          ],
        );
      },
    );
  }
}
