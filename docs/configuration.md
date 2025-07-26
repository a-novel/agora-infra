# Configuration

This section explains how to configure the repository and to connect the repository to AWS.

## GitHub Repository Configuration

The Repository needs the following variable to be defined:

- AWS_ROLE: The ARN of the role to use to deploy infrastructure

## SES Configuration

By default, AWS set the SES account to sandbox mode, to be able to use SES for production you must request it by
following this [doc](https://docs.aws.amazon.com/ses/latest/dg/request-production-access.html?icmpid=docs_ses_console).

## GitHub Action Role

To give AWS access to GitHub action you need to create a role on AWS IAM (
see [GitHub doc](https://docs.github.com/en/actions/deployment/security-hardening-your-deployments/configuring-openid-connect-in-amazon-web-services)).

If it is not already done, don't forget to create an identity provider for GitHub according to the above documentation.

You can then use the following example as trusted relationship statement:

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Federated": "arn:aws:iam::<account_id>:oidc-provider/token.actions.githubusercontent.com"
      },
      "Action": "sts:AssumeRoleWithWebIdentity",
      "Condition": {
        "StringLike": {
          "token.actions.githubusercontent.com:sub": "repo:<organization_name>/<repository_name>:*"
        },
        "StringEquals": {
          "token.actions.githubusercontent.com:aud": "sts.amazonaws.com"
        }
      }
    }
  ]
}
```

And add permissions to the role, for example you can add full access on S3, DynamoDB, VPC, ECS, RDS, Secrets Manager
and Elastic Load Balancing.

When you are done you can set the role ARN as variable on GitHub with the name `AWS_ROLE`.
If you are not using the free tier on GitHub the best way to do that is using an environment secret which will allow you
to have different role per environment.
