part of '../../pages/view.dart';

class DetailPageView extends StatelessWidget {
  const DetailPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: GetBuilder<DetailPageController>(
        dispose: (_) => _.controller?.data = null,
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
                    children: const [
                      DetailPageTitle(),
                      DetailPageQuantity(),
                      DetailPageDescription(),
                      SizedBox(height: 16),
                      DetailPageProposal(),
                      SizedBox(height: 16),
                    ],
                  ),
                ),
              )
            : const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
