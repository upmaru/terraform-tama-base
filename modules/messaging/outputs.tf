output "space_id" {
  value       = tama_space.this.id
  description = "The messaging space id"
}

output "schemas" {
  description = "Scheams for the messaging space"
  value = {
    actor        = tama_class.actor,
    thread       = tama_class.thread,
    user-message = tama_class.user-message,
    response     = tama_class.response
  }
}
