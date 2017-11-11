resource "aws_route53_zone" "precisesteps" {
   name = "precisesteps.com"
}
resource "aws_route53_record" "server1-record" {
   zone_id = "${aws_route53_zone.precisesteps.zone_id}"
   name = "server1.precisesteps.com"
   type = "A"
   ttl = "300"
   records = ["52.11.83.121"]
}
resource "aws_route53_record" "www-record" {
   zone_id = "${aws_route53_zone.precisesteps.zone_id}"
   name = "www.precisesteps.com"
   type = "A"
   ttl = "300"
   records = ["52.11.83.121"]
}
resource "aws_route53_record" "mail1-record" {
   zone_id = "${aws_route53_zone.precisesteps.zone_id}"
   name = "precisesteps.com"
   type = "MX"
   ttl = "300"
   records = [
     "NS-CLOUD-C1.GOOGLEDOMAINS.COM.",
     "NS-CLOUD-C2.GOOGLEDOMAINS.COM.",
     "NS-CLOUD-C3.GOOGLEDOMAINS.COM.",
     "NS-CLOUD-C4.GOOGLEDOMAINS.COM.",
   ]
}

output "ns-servers" {
   value = "${aws_route53_zone.precisesteps.name_servers}"
}
