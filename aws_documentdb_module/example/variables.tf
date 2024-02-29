variable "master_password" {
  default     = "asdf1234"
}

variable "parameter" {
description = "Additional parameters for the document DB cluster"
type        = map(object({
  name         = string
  value        = string
  apply_method = string
}))
default     = {
  audit_logs = {
    name         = "audit_logs"
    value        = "enabled"
    apply_method = "immediate"
  },
  change_stream_log_retention_duration = {
    name         = "change_stream_log_retention_duration"
    value        = "3600"
    apply_method = "immediate"
  },
  tls = {
    name         = "tls"
    value        = "enabled"
    apply_method = "immediate"
  },
  profiler = {
    name         = "profiler"
    value        = "enabled"
    apply_method = "immediate"
  },
  ttl_monitor = {
    name         = "ttl_monitor"
    value        = "enabled"
    apply_method = "immediate"
  }
}
}
