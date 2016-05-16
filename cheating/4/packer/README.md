Make sure to export your AWS account credentials before running
```
export AWS_ACCESS_KEY_ID='youraccesskeyid'
export AWS_SECRET_ACCESS_KEY='yoursecretkey'
```

To build a new image:
```bash
$ packer validate -var-file=variables.json app.json
$ packer build -var-file=variables.json app.json
```

This will spit out an AMI image ID, which can be referenced in
Terraform (in aws_init.tf file)

