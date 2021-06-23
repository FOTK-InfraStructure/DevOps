resource "aws_vpc" "GitOps_TEST" {
  cidr_block = "10.0.0.0/16"
  tags = {
	  Name = "GitOps_TEST_VPC"
  }
}