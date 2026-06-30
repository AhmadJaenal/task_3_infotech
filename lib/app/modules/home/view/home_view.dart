import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:task_3_infotech/app/common/core/constant/app_color.dart';
import 'package:task_3_infotech/app/common/core/constant/app_margin.dart';
import 'package:task_3_infotech/app/common/core/constant/app_text_style.dart';
import 'package:task_3_infotech/app/common/utils/task_enum.dart';
import 'package:task_3_infotech/app/modules/home/model/todo_model.dart';
import 'package:task_3_infotech/app/modules/home/provider/todo_provider.dart';
import 'package:task_3_infotech/app/widgets/forms/app_text_field.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Color _selectedColor = AppColors.error2;
  final TextEditingController _controller = TextEditingController();

  final List<Color> _colorOptions = [
    AppColors.error2,
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.pink,
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _showColorPicker() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Pilih Warna", style: AppTextStyle.paragraphMBold),
              const Gap(16),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: _colorOptions.map((color) {
                  final isSelected = _selectedColor == color;
                  return GestureDetector(
                    onTap: () {
                      setState(() => _selectedColor = color);
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                        border: isSelected
                            ? Border.all(color: Colors.black, width: 2)
                            : null,
                      ),
                      child: isSelected
                          ? const Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 18,
                            )
                          : null,
                    ),
                  );
                }).toList(),
              ),
              const Gap(8),
            ],
          ),
        );
      },
    );
  }

  void _addTask() {
    final text = _controller.text.trim();

    if (text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Task tidak boleh kosong",
            style: AppTextStyle.paragraphM,
          ),
        ),
      );
      return;
    }

    context.read<TaskProvider>().addTask(
      description: text,
      category: "Work",
      color: _selectedColor,
    );

    _controller.clear();

    FocusScope.of(context).unfocus();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Task berhasil ditambahkan",
          style: AppTextStyle.paragraphM,
        ),
        duration: Duration(milliseconds: 800),
      ),
    );
  }

  Widget _buildTaskItem(TaskProvider provider, TaskModel task) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: AppColors.black10,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// NOTE: Checkbox
          Checkbox(
            value: task.isCompleted,
            activeColor: AppColors.blue,
            onChanged: (_) {
              provider.toggleStatus(task.id);

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    task.isCompleted
                        ? "Task diubah menjadi belum selesai"
                        : "Task selesai",
                  ),
                  duration: const Duration(milliseconds: 700),
                ),
              );
            },
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.paragraphMBold.copyWith(
                    decoration: task.isCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    color: task.isCompleted
                        ? AppColors.black40
                        : AppColors.black,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Container(
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                        color: task.color,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      task.category,
                      style: AppTextStyle.paragraphS.copyWith(
                        color: AppColors.black80,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: task.isCompleted
                            ? AppColors.green.withAlpha(10)
                            : AppColors.primary1.withAlpha(10),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        task.isCompleted ? "Selesai" : "Belum",
                        style: AppTextStyle.paragraphM.copyWith(
                          color: task.isCompleted
                              ? AppColors.green
                              : AppColors.primary3,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          IconButton(
            tooltip: "Hapus Task",
            icon: const Icon(Icons.delete_outline_rounded, color: Colors.red),
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) {
                  return AlertDialog(
                    backgroundColor: AppColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    titlePadding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
                    contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
                    actionsPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    title: Row(
                      children: [
                        const Icon(
                          Icons.warning_amber_rounded,
                          color: Colors.red,
                          size: 24,
                        ),
                        const Gap(8),
                        Text("Hapus Task", style: AppTextStyle.paragraphLBold),
                      ],
                    ),
                    content: Text(
                      "Apakah Anda yakin ingin menghapus task ini?\nTindakan ini tidak dapat dibatalkan.",
                      style: AppTextStyle.paragraphM.copyWith(
                        color: AppColors.black80,
                      ),
                    ),
                    actions: [
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppColors.black80,
                          side: BorderSide(color: AppColors.black40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          "Batal",
                          style: AppTextStyle.paragraphMBold.copyWith(
                            color: AppColors.black80,
                          ),
                        ),
                      ),
                      FilledButton.icon(
                        style: FilledButton.styleFrom(
                          backgroundColor: AppColors.error2,
                          foregroundColor: AppColors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          provider.deleteTask(task.id);
                          Navigator.pop(context);

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: AppColors.blue,
                              behavior: SnackBarBehavior.floating,
                              content: Text(
                                "Task berhasil dihapus",
                                style: AppTextStyle.paragraphM.copyWith(
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          );
                        },
                        icon: const Icon(Icons.delete_outline_rounded),
                        label: Text(
                          "Hapus",
                          style: AppTextStyle.paragraphMBold.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(String title, String value, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        color: color.withAlpha(25),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withAlpha(70)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            title == "Total"
                ? Icons.list_alt_rounded
                : title == "Selesai"
                ? Icons.check_circle_rounded
                : Icons.pending_actions_rounded,
            color: color,
            size: 24,
          ),
          const Gap(8),
          Text(
            value,
            style: AppTextStyle.h3.copyWith(
              color: color,
              fontWeight: AppWeightFont.bold,
            ),
          ),
          const Gap(4),
          Text(
            title,
            style: AppTextStyle.paragraphM.copyWith(color: AppColors.black80),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip({
    required String label,
    required IconData icon,
    required bool selected,
    required VoidCallback onSelected,
  }) {
    return ChoiceChip(
      selected: selected,
      onSelected: (_) => onSelected(),

      showCheckmark: false,

      backgroundColor: AppColors.white,
      selectedColor: AppColors.highlight1,

      side: BorderSide(
        color: selected ? AppColors.highlight1 : AppColors.black40,
      ),

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),

      avatar: Icon(
        icon,
        size: 18,
        color: selected ? AppColors.white : AppColors.neutralDark3,
      ),

      label: Text(
        label,
        style: AppTextStyle.paragraphMBold.copyWith(
          color: selected ? AppColors.white : AppColors.neutralDark3,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColors.black20,
        body: Container(
          decoration: BoxDecoration(
            color: AppColors.backgroundColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppMargin.defaultMargin),
            child: Consumer<TaskProvider>(
              builder: (context, provider, _) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(16),
                    Text(
                      "Todo List",
                      style: AppTextStyle.h3.copyWith(
                        fontWeight: AppWeightFont.bold,
                      ),
                    ),
                    const Gap(20),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _buildFilterChip(
                            label: "Semua",
                            icon: Icons.list_alt_rounded,
                            selected: provider.filter == TaskFilter.all,
                            onSelected: () {
                              provider.changeFilter(TaskFilter.all);
                            },
                          ),
                          const Gap(10),
                          _buildFilterChip(
                            label: "Selesai",
                            icon: Icons.check_circle_outline_rounded,
                            selected: provider.filter == TaskFilter.completed,
                            onSelected: () {
                              provider.changeFilter(TaskFilter.completed);
                            },
                          ),
                          const Gap(10),
                          _buildFilterChip(
                            label: "Belum",
                            icon: Icons.pending_actions_rounded,
                            selected: provider.filter == TaskFilter.pending,
                            onSelected: () {
                              provider.changeFilter(TaskFilter.pending);
                            },
                          ),
                        ],
                      ),
                    ),
                    const Gap(20),
                    Row(
                      children: [
                        Expanded(
                          child: _buildInfoCard(
                            "Total",
                            provider.totalTask.toString(),
                            AppColors.highlight1,
                          ),
                        ),
                        const Gap(10),
                        Expanded(
                          child: _buildInfoCard(
                            "Selesai",
                            provider.completedTask.toString(),
                            AppColors.success1,
                          ),
                        ),
                        const Gap(10),
                        Expanded(
                          child: _buildInfoCard(
                            "Belum",
                            provider.pendingTask.toString(),
                            AppColors.warning1,
                          ),
                        ),
                      ],
                    ),
                    const Gap(20),
                    Text(
                      "Jumlah Task : ${provider.totalTask}",
                      style: AppTextStyle.paragraphMBold,
                    ),
                    const Gap(16),
                    Expanded(
                      child: provider.filteredTasks.isEmpty
                          ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.task_alt_rounded,
                                    size: 80,
                                    color: AppColors.black60,
                                  ),
                                  const Gap(16),
                                  Text(
                                    "Belum ada task",
                                    style: AppTextStyle.paragraphLBold.copyWith(
                                      color: AppColors.neutralDark2,
                                    ),
                                  ),
                                  const Gap(6),
                                  Text(
                                    "Tambahkan task pertama Anda",
                                    style: AppTextStyle.paragraphM.copyWith(
                                      color: AppColors.black80,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : ListView.builder(
                              itemCount: provider.filteredTasks.length,
                              itemBuilder: (context, index) {
                                final task = provider.filteredTasks[index];

                                return _buildTaskItem(provider, task);
                              },
                            ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        floatingActionButton: Container(
          height: 65,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: _showColorPicker,
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: _selectedColor,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.black60, width: 1),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: AppTextField(
                  controller: _controller,
                  hintText: 'Write new task...',
                  borderRadius: 30,
                  borderColor: AppColors.black60,
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                onPressed: _addTask,
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.blue,
                  foregroundColor: AppColors.white,
                ),
                icon: const Icon(Icons.arrow_upward_rounded),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
