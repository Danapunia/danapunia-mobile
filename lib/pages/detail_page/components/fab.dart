part of '_component.dart';

class DetailPageFAB extends StatelessWidget {
  const DetailPageFAB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<DetailPageController>();

    return ElevatedButton(
      onPressed: ctrl.fabOnCLick,
      child: const Text(
        'Punia Sekarang',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16),
        // primary: Colors.green,
      ),
    );
  }
}
