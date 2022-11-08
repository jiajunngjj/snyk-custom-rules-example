# flask-polling-app
An example of Snyk IaC custom rule for Azure Key Vault to detect and disallow the default action (Allow) for network ACL.

## Bundle the rule

```
$ snyk-iac-rules build
```

## Testing Terraform static file
```
$ snyk iac test main.tf --rules=bundle.tar.gz
```

## Testing Terraform plan
Create Terraform plan JSON file:

```
$ terraform plan -out=tfplan_fixed.binary
$ terraform show -json tfplan_fixed.binary > tf-plan_fixed.json
```

Test Terraform plan file with the custom rules:
```
$ snyk iac test tf-plan.json --rules=bundle.tar.gz
```



