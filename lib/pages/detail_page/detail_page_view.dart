part of '../../pages/view.dart';

class DetailPageView extends StatelessWidget {
  const DetailPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<DetailPageController>();
    return WillPopScope(
      onWillPop: ctrl.back,
      child: Scaffold(
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
                        const DetailPageTitle(
                          key: Key('DetailPageAppBar'),
                        ),
                        const DetailPageQuantity(
                          key: Key('DetailPageQuantity'),
                        ),
                        const DetailPageDescription(
                          key: Key('DetailPageDescription'),
                        ),
                        const SizedBox(height: 16),
                        const DetailPageProposal(
                          key: Key('DetailPageProposal'),
                        ),
                        // const SizedBox(height: 16),
                        // const DetailPageProgres(
                        //   key: Key('DetailPageProgres'),
                        // ),
                        const SizedBox(height: 16),
                        if (_.punia!.organizationId != null)
                          const DetailPageOrganization(
                            key: Key('DetailPageOrganization'),
                          ),
                        const SizedBox(height: 350),
                      ],
                    ),
                  ),
                )
              : const Center(child: CircularProgressIndicator()),
        ),
        bottomNavigationBar: const DetailPageFAB(
          key: Key('DetailPageFAB'),
        ),
      ),
    );
  }
}
