
<h1 align="center">
  AWS WAF + CloudFront + S3 lab (terraform)
  <br>
</h1>

<h4 align="center">Basic IaaS demo presenting integration of 3 AWS services </h4>

![screenshot](./docs/demo.gif)

<p align="center">
  <a href="#features">Key Features</a> •
  <a href="#how-to-use">How To Use</a> •
  <a href="#license">License</a>
</p>

## What it does
* creates S3 bucket with static files hosting enabled ([s3.tf](s3.tf))
  * uploads sample index.html file ([./templates/index.html](./templates/index.html))
  * configures policy access - objects in buckets are accessible only via CloudFront Distribution
* creates CloudFront Distribution for a given S3 bucket
  * distribution is associated with WAF ACL below 
* creates WAF ACL with a rule that allows to allow traffic only from a given range of ip
  * for a demo purpose, IP is taken from a host, from where these terraform changes were applied

All resources created by Terraform are documented in [docs/README.md](docs/README.md])

## Prerequisites

* Installed [terraform](https://www.terraform.io/downloads) (version `">=1.2.8"` or use [tfswitch](https://tfswitch.warrensbox.com/Install/)
* [AWS account + AWS CLI with credentials configured](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html) 

## How To Use

To clone and run this application, you'll need [Git](https://git-scm.com) and [Node.js](https://nodejs.org/en/download/) (which comes with [npm](http://npmjs.com)) installed on your computer. From your command line:

```bash
# Clone this repository
$ git clone https://github.com/mehowthe/aws-labs/tf-waf-cloudfront-s3

# Go into the repository
$ cd aws-labs/tf-waf-cloudfront-s3

# Optional - if you're using tfswitch - use proper version of terraform
$ tfswitch

# Init terraform - download modules and providers
$ terraform init

# Create all the resources
$ terraform apply
```

## License

MIT

---

> [michaldurkalec.com](https://www.michaldurkalec.com) &nbsp;&middot;&nbsp;
> GitHub [@mehowthe](https://github.com/mehowthe) &nbsp;&middot;&nbsp;

