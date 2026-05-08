import 'package:flutter/material.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({super.key});

  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage>
    with AutomaticKeepAliveClientMixin<StatsPage> {
  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState( ) {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const Placeholder();
  }
}
