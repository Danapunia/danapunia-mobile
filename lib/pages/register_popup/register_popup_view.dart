part of '../../pages/view.dart';

class RegisterPopupView extends StatelessWidget {
  const RegisterPopupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<RegisterPopupController>();

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      contentPadding: const EdgeInsets.all(16),
      content: WillPopScope(
        onWillPop: () async => false,
        child: SingleChildScrollView(
          child: GetBuilder<RegisterPopupController>(
            builder: (_) => Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        ctrl.punia.punia!.name!,
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: ctrl.closePopup,
                      child: const Icon(
                        Icons.close_rounded,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Nama Donatur',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 16,
                    ),
                  ),
                  controller: ctrl.data.name,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'No Telepon',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 16,
                    ),
                  ),
                  controller: ctrl.data.telephoneNumber,
                ),
                const SizedBox(height: 16),
                Text('Nominal', style: GoogleFonts.inter()),
                const SizedBox(height: 4),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      ctrl.puniaAmount.length,
                      (index) => GetBuilder<RegisterPopupController>(
                        builder: (_) => Padding(
                          padding: EdgeInsets.only(
                            right: index != ctrl.puniaAmount.length - 1 ? 8 : 0,
                            left: index != 0 ? 8 : 0,
                          ),
                          child: ChoiceChip(
                            label: Text(
                              currency(ctrl.puniaAmount[index].amount),
                            ),
                            selected: ctrl.puniaAmount[index].isSelected,
                            onSelected: (_) =>
                                ctrl.onSelectedPuniaAmount(index),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 8,
                    ),
                  ),
                  controller: ctrl.data.puniaAmount,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: ctrl.nextOnClick,
                  child: const Text('Lanjutkan'),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
