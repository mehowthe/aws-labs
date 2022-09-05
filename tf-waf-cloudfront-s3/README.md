
<h1 align="center">
  AWS WAF + CloudFront + S3 lab (terraform)
  <br>
</h1>

<h4 align="center">Basic IaaS demo presenting integration of 3 AWS services </h4>

<p align="center">
  <a href="#key-features">Key Features</a> •
  <a href="#how-to-use">How To Use</a> •
  <a href="#license">License</a>
</p>

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

