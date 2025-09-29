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
    response     = module.response.class
  }
}

output "thread_classes" {
  description = "Classes that can be passed into thread parameters"
  value = {
    author  = tama_class.actor.name
    thread  = tama_class.thread.name
    message = tama_class.user-message.name
  }
}
