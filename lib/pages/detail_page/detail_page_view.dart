part of '../../pages/view.dart';

class DetailPageView extends StatelessWidget {
  const DetailPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GetBuilder<DetailPageController>(
        dispose: (_) => _.controller?.punia = null,
        builder: (_) => !_.isLoading
            ? NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  DetailPageAppBar(
                    innerBoxIsScrolled: innerBoxIsScrolled,
                    key: const Key('DetailPageAppBar'),
                  ),
                ],
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const DetailPageTitle(),
                      const DetailPageQuantity(),
                      const DetailPageDescription(),
                      const SizedBox(height: 16),
                      const DetailPageProposal(),
                      const SizedBox(height: 16),
                      const DetailPageProgres(),
                      const SizedBox(height: 16),
                      if (_.punia!.organizationId != null)
                        const DetailPageOrganization(),
                      const SizedBox(height: 500),
                    ],
                  ),
                ),
              )
            : const Center(child: CircularProgressIndicator()),
      ),
      bottomNavigationBar: const DetailPageFAB(),
    );
  }
}
