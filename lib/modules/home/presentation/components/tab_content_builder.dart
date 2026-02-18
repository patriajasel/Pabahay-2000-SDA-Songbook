import 'package:church_songbook_app/modules/home/presentation/components/song_list_builder.dart';
import 'package:church_songbook_app/widget/category_picker/category_picker_widget.dart';
import 'package:church_songbook_app/widget/search_field/search_field_widget.dart';
import 'package:flutter/material.dart';

class TabContentBuilder extends StatelessWidget {
  const TabContentBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Expanded(child: SearchFieldWidget(controller: controller)),
              const Spacer(),
              CategoryPickerWidget(),
            ],
          ),
        ),
        SongListBuilder(),
      ],
    );
  }
}
