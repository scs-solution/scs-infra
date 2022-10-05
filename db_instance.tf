resource "aws_db_instance" "web_db" {
  allocated_storage   = 8
  engine              = "mysql"
  engine_version      = "5.6.35"
  instance_class      = "db.t2.micro"
  username            = "admin"
  password            = "<DB_PASSWORD>"
  skip_final_snapshot = true
}