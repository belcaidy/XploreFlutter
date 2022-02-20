import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_ui/models/destination_model.dart';
import 'package:travel_ui/widgets/activity_card.dart';
import 'package:travel_ui/widgets/detail_app_bar.dart';

class DestinationDetailPage extends StatefulWidget {
  DestinationDetailPage({Key key, this.destination}) : super(key: key);

  final Destination destination;

  @override
  _DestinationDetailPageState createState() =>
      _DestinationDetailPageState(this.destination);
}

class _DestinationDetailPageState extends State<DestinationDetailPage> {
  final Destination destination;
  _DestinationDetailPageState(this.destination);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          DetailAppBar(
            destination: this.destination,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ActivityCard(
                activity: this.destination.activities[index],
              ),
              childCount: this.destination.activities.length,
            ),
          ),
        ],
      ),
    );
  }
}
