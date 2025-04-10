subnets = {
  public = {
    cidr_block        = "10.0.1.0/24"
    name              = "public-subnet"
    availability_zone = "eu-central-1a"
  }
  private = {
    cidr_block        = "10.0.2.0/24"
    name              = "private-subnet"
    availability_zone = "eu-central-1b"
  }
}