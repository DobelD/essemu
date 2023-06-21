import '../../../data/campaign.dart';
import '../../../provider/endpoint.dart';

class CampaignService {
  Endpoint endpoint = Endpoint();

  Future<List<Campaign>> getData() async {
    try {
      final response = await endpoint.getCampaign();
      final List<Campaign> campaign = [];
      for (var data in response) {
        final cmp = Campaign.fromJson(data);
        campaign.add(cmp);
      }
      return campaign;
    } catch (e) {
      throw "$e";
    }
  }
}
