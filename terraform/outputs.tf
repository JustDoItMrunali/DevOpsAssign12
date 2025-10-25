output "controller_ip" {
  value = aws_instance.mru_controller.public_ip
}

output "manager_ip" {
  value = aws_instance.mru_manager.public_ip
}

output "worker_a_ip" {
  value = aws_instance.mru_worker_a.public_ip
}

output "worker_b_ip" {
  value = aws_instance.mru_worker_b.public_ip
}
