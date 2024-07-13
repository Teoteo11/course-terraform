/* configure the AWS provider */
provider "aws" {
    region = "ca-central-1"
    allowed_account_ids = ["XXXXXXXXX"] /* substitute with your account ID */
    access_key = "XXXXXXXXX" /* substitute with ACCESS KEY */
    secret_key = "XXXXXXXXX" /* substitute with SECRET KEY */
}