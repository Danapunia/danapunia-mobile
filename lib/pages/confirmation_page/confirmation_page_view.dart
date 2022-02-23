part of '../../pages/view.dart';

class ConfirmationPage extends StatelessWidget {
  const ConfirmationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ConfirmationPageController>(
      init: ConfirmationPageController(),
      builder: (_) => Scaffold(
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
        body: _.isLoading == false
            ? Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Terima kasih saudara ${_.dontatur.data.name.text.isNotEmpty ? _.dontatur.data.name.text : null} atas punia yang diberikan kepada ${_.punia.punia?.name}, silahkan transfer punia dengan nominal Rp. ${_.dontatur.data.puniaAmount.text.isNotEmpty ? _.dontatur.data.puniaAmount.text : null} melalui rekening ${_.punia.organization != null ? _.punia.organization!.namaOrganisasi : 'organization_null'} sebagai berikut',
                      style: GoogleFonts.inter(),
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: _.rekening.isNotEmpty
                          ? Center(
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black87),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: ListView.builder(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                  ),
                                  controller: ScrollController(),
                                  shrinkWrap: true,
                                  itemCount: _.rekening.length,
                                  itemBuilder: (ctx, i) => _card(_.rekening[i]),
                                ),
                              ),
                            )
                          : const Center(child: Text('TIDAK ADA REKENING')),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Apabila Saudara telah melakukan transfer silahkan mengklik tombol dibawah ini untuk melakukan konfirmasi',
                      style: GoogleFonts.inter(),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'Konfirmasi Punia',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.all(16),
                        // primary: Colors.green,
                      ),
                    )
                  ],
                ),
              )
            : const Center(child: CircularProgressIndicator()),
      ),
    );
  }

  Widget _card(Bank data) {
    final ctrl = Get.find<ConfirmationPageController>();

    return ListTile(
      title: Text(
        '${data.accountNumber} (${data.accountProvider})',
        style: GoogleFonts.inter(),
      ),
      subtitle: Text(
        data.accountName,
        style: GoogleFonts.inter(),
      ),
      leading: Radio(
        value: data.id,
        groupValue: ctrl.selectedRekeningId,
        onChanged: (int? value) => ctrl.selectedBankOnChange(value!),
      ),
      trailing: TextButton(
        onPressed: () => ctrl.copyToClipBoard(data),
        child: Text(
          'Salin',
          style: GoogleFonts.inter(),
        ),
      ),
    );
  }
}
