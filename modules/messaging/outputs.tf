output "space" {
  value       = tama_space.this
  description = "The messaging space id"
}

output "schemas" {
  description = "Scheams for the messaging space"
  value = {
    actor             = tama_class.actor,
    thread            = tama_class.thread,
    user-message      = tama_class.user-message,
    assistant-message = tama_class.assistant-message,
    tool-message      = tama_class.tool-message,
    response          = tama_class.response
  }
}
