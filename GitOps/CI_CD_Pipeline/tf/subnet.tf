resource "aws_subnet" "GitOps_Public_a" {
  vpc_id = aws_vpc.GitOps_TEST.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    Name = "GitOps_Public_a"
  }
}