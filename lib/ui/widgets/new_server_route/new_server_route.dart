import 'package:c_hat_server_manager/model/build_type.dart';
import 'package:c_hat_server_manager/ui/widgets/new_server_route/widgets/form_text_field.dart';
import 'package:flutter/material.dart';

class NewServerRoute extends StatelessWidget {
  NewServerRoute({super.key});

  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  var buildType = BuildType.stable;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormTextField(label: "Name", controller: nameController),

        FormTextField(label: "Description", controller: descriptionController),

        Row(
          children: [
            /*Radio(value: BuildType.stable.toString(), groupValue: buildType.toString(), onChanged: (_) { buildType = _; })
            Radio(value: BuildType.stable.toString(), groupValue: buildType.toString(), onChanged: (_) { buildType = _; })
            Radio(value: BuildType.stable.toString(), groupValue: buildType.toString(), onChanged: (_) { buildType = _; })
            Radio(value: BuildType.stable.toString(), groupValue: buildType.toString(), onChanged: (_) { buildType = _; })
          */]
        )
      ],
    );
  }
}