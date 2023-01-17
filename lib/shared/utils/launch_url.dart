import 'package:cs_100/shared/ui/error_snackbar.dart';
import 'package:url_launcher/url_launcher.dart';

void openLink(String url) async {
  if (!url.startsWith("http")) {
    url = "https://$url";
  }
  if (!await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)) {
    showErrorSnackbar(message: "Couldn't open link \n try copying it instead");
  }
}
