data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}

# Creating the IP Set tp be defined in AWS WAF
resource "aws_waf_ipset" "ipset" {
  name = "AllowMe"
  ip_set_descriptors {
    type = "IPV4"
    value = "${chomp(data.http.myip.response_body)}/32"
  }
}

# Creating the AWS WAF rule that will be applied on AWS Web ACL
resource "aws_waf_rule" "waf_rule" {
  depends_on = [aws_waf_ipset.ipset]
  name        = "AllowIpRule"
  metric_name = "AllowIpRuleMetrics"
  predicates {
    data_id = aws_waf_ipset.ipset.id
    negated = false
    type    = "IPMatch"
  }
}

# Creating the Web ACL component in AWS WAF
resource "aws_waf_web_acl" "waf_acl" {
  depends_on = [
    aws_waf_rule.waf_rule,
    aws_waf_ipset.ipset,
  ]
  name        = "AllowIPsAcl"
  metric_name = "AllowIPsAclMetrics"

  default_action {
    type = "BLOCK"
  }
  rules {
    action {
      type = "ALLOW"
    }
    priority = 1
    rule_id  = aws_waf_rule.waf_rule.id
    type     = "REGULAR"
  }
}
