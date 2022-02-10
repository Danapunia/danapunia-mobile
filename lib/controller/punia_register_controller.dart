part of '_controller.dart';

class PuniaRegisterController extends GetxController {
  PuniaProgram? punia;
  Organization? organization;
  PuniaRegister data = PuniaRegister();

  void nextOnClick() {
    Get.to(() => const ConfirmationPage());
  }

  void get showDialog {
    Get.defaultDialog(
      title: '',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(punia!.name!),
          const SizedBox(height: 24.0),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Nama Donatur',
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 16,
              ),
            ),
            controller: data.name,
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Nominal',
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 16,
              ),
            ),
            controller: data.puniaAmount,
          ),
          // const SizedBox(height: 16.0),
          // TextFormField(
          //   decoration: const InputDecoration(
          //     labelText: 'Nomor Telepon',
          //     border: OutlineInputBorder(),
          //     contentPadding: EdgeInsets.symmetric(
          //       vertical: 0,
          //       horizontal: 16,
          //     ),
          //   ),
          //   controller: data.puniaAmount,
          // ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: nextOnClick,
            child: const Text('Lanjutkan'),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          )
        ],
      ),
      radius: 10.0,
      contentPadding: const EdgeInsets.symmetric(horizontal: 18),
      titlePadding: const EdgeInsets.all(0),
    );
  }
}
