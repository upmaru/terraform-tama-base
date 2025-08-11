output "extracted_class_ids" {
  description = "The IDs of the extracted classes"
  value = {
    for k, v in data.tama_class.extracted : k => v.id
  }
}
