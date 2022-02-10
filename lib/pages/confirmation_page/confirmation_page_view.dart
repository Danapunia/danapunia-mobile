part of '../../pages/view.dart';

class ConfirmationPage extends StatelessWidget {
  const ConfirmationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PuniaRegisterController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Konfirmasi'),
        centerTitle: true,
        leading: IconButton(
          padding: const EdgeInsets.all(0),
          splashRadius: 20,
          icon: const Icon(Icons.arrow_back_outlined),
          onPressed: () => Get.back(),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Terima kasih saudara ${controller.data.name.text} atas punia yang diberikan kepada Pembangunan Bale Bengong, silahkan transfer punia dengan nominal Rp. ${controller.data.puniaAmount.text} melalui rekening Kertha Bumi sebagai berikut',
            ),
            const Spacer(),
            const Text(
              'Apabila Saudara telah melakukan transfer silahkan mengklik tombol dibawah ini untuk melakukan konfirmasi',
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: Text('Konfirmasi Punia'),
            )
          ],
        ),
      ),
    );
  }
}
