/* That i want to export from module */

output "my_private_ip" {
  value = aws_instance.first.private_ip
}