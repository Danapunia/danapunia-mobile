part of '../../components/_component.dart';

class DetailPagePopup extends StatelessWidget {
  const DetailPagePopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<DetailPagePopupController>();

    return Text('');
    // return AlertDialog(
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(20),
    //   ),
    //   contentPadding: const EdgeInsets.all(16),
    //   content: WillPopScope(
    //     onWillPop: () async => false,
    //     child: SingleChildScrollView(
    //       child: GetBuilder<PuniaRegisterController>(
    //         builder: (_) => Column(
    //           crossAxisAlignment: CrossAxisAlignment.stretch,
    //           mainAxisSize: MainAxisSize.min,
    //           children: [
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 Expanded(
    //                   child: Text(ctrl.punia!.name!),
    //                 ),
    //                 InkWell(
    //                   onTap: () {
    //                     Get.back();
    //                     dispose();
    //                   },
    //                   child: const Icon(
    //                     Icons.close_rounded,
    //                   ),
    //                 )
    //               ],
    //             ),
    //             const SizedBox(height: 16),
    //             TextFormField(
    //               decoration: const InputDecoration(
    //                 labelText: 'Nama Donatur',
    //                 border: OutlineInputBorder(),
    //                 contentPadding: EdgeInsets.symmetric(
    //                   vertical: 0,
    //                   horizontal: 16,
    //                 ),
    //               ),
    //               controller: data.name,
    //             ),
    //             const SizedBox(height: 16),
    //             TextFormField(
    //               decoration: const InputDecoration(
    //                 labelText: 'No Telepon',
    //                 border: OutlineInputBorder(),
    //                 contentPadding: EdgeInsets.symmetric(
    //                   vertical: 0,
    //                   horizontal: 16,
    //                 ),
    //               ),
    //               controller: data.telephoneNumber,
    //             ),
    //             const SizedBox(height: 16),
    //             Text('Nominal', style: GoogleFonts.inter()),
    //             const SizedBox(height: 4),
    //             SingleChildScrollView(
    //               scrollDirection: Axis.horizontal,
    //               child: Row(
    //                 children: List.generate(
    //                   puniaAmount.length,
    //                       (index) => GetBuilder<PuniaRegisterController>(
    //                     builder: (_) => Padding(
    //                       padding: EdgeInsets.only(
    //                         right: index != puniaAmount.length - 1 ? 8 : 0,
    //                         left: index != 0 ? 8 : 0,
    //                       ),
    //                       child: ChoiceChip(
    //                         label: Text(currency(puniaAmount[index].amount)),
    //                         selected: puniaAmount[index].isSelected,
    //                         onSelected: (_) => onSelectedPuniaAmount(index),
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             ),
    //             TextFormField(
    //               decoration: const InputDecoration(
    //                 border: UnderlineInputBorder(),
    //                 contentPadding: EdgeInsets.symmetric(
    //                   vertical: 0,
    //                   horizontal: 8,
    //                 ),
    //               ),
    //               controller: data.puniaAmount,
    //             ),
    //             const SizedBox(height: 16),
    //             ElevatedButton(
    //               onPressed: nextOnClick,
    //               child: const Text('Lanjutkan'),
    //               style: ElevatedButton.styleFrom(
    //                 shape: RoundedRectangleBorder(
    //                   borderRadius: BorderRadius.circular(10),
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
