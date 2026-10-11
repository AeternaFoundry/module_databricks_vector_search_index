output "vector_search_indices_id" {
  description = "Map of id values across all vector_search_indices, keyed the same as var.vector_search_indices except keys with no id are omitted"
  value       = { for k, v in databricks_vector_search_index.vector_search_indices : k => v.id if v.id != null && length(v.id) > 0 }
}
output "vector_search_indices_creator" {
  description = "Map of creator values across all vector_search_indices, keyed the same as var.vector_search_indices except keys with no creator are omitted"
  value       = { for k, v in databricks_vector_search_index.vector_search_indices : k => v.creator if v.creator != null && length(v.creator) > 0 }
}
output "vector_search_indices_delta_sync_index_spec" {
  description = "Map of delta_sync_index_spec values across all vector_search_indices, keyed the same as var.vector_search_indices except keys with no delta_sync_index_spec are omitted"
  value       = { for k, v in databricks_vector_search_index.vector_search_indices : k => one(v.delta_sync_index_spec) if v.delta_sync_index_spec != null && length(v.delta_sync_index_spec) > 0 }
}
output "vector_search_indices_direct_access_index_spec" {
  description = "Map of direct_access_index_spec values across all vector_search_indices, keyed the same as var.vector_search_indices except keys with no direct_access_index_spec are omitted"
  value       = { for k, v in databricks_vector_search_index.vector_search_indices : k => one(v.direct_access_index_spec) if v.direct_access_index_spec != null && length(v.direct_access_index_spec) > 0 }
}
output "vector_search_indices_endpoint_id" {
  description = "Map of endpoint_id values across all vector_search_indices, keyed the same as var.vector_search_indices except keys with no endpoint_id are omitted"
  value       = { for k, v in databricks_vector_search_index.vector_search_indices : k => v.endpoint_id if v.endpoint_id != null && length(v.endpoint_id) > 0 }
}
output "vector_search_indices_endpoint_name" {
  description = "Map of endpoint_name values across all vector_search_indices, keyed the same as var.vector_search_indices except keys with no endpoint_name are omitted"
  value       = { for k, v in databricks_vector_search_index.vector_search_indices : k => v.endpoint_name if v.endpoint_name != null && length(v.endpoint_name) > 0 }
}
output "vector_search_indices_index_subtype" {
  description = "Map of index_subtype values across all vector_search_indices, keyed the same as var.vector_search_indices except keys with no index_subtype are omitted"
  value       = { for k, v in databricks_vector_search_index.vector_search_indices : k => v.index_subtype if v.index_subtype != null && length(v.index_subtype) > 0 }
}
output "vector_search_indices_index_type" {
  description = "Map of index_type values across all vector_search_indices, keyed the same as var.vector_search_indices except keys with no index_type are omitted"
  value       = { for k, v in databricks_vector_search_index.vector_search_indices : k => v.index_type if v.index_type != null && length(v.index_type) > 0 }
}
output "vector_search_indices_name" {
  description = "Map of name values across all vector_search_indices, keyed the same as var.vector_search_indices except keys with no name are omitted"
  value       = { for k, v in databricks_vector_search_index.vector_search_indices : k => v.name if v.name != null && length(v.name) > 0 }
}
output "vector_search_indices_primary_key" {
  description = "Map of primary_key values across all vector_search_indices, keyed the same as var.vector_search_indices except keys with no primary_key are omitted"
  value       = { for k, v in databricks_vector_search_index.vector_search_indices : k => v.primary_key if v.primary_key != null && length(v.primary_key) > 0 }
}
output "vector_search_indices_provider_config" {
  description = "Map of provider_config values across all vector_search_indices, keyed the same as var.vector_search_indices except keys with no provider_config are omitted"
  value       = { for k, v in databricks_vector_search_index.vector_search_indices : k => one(v.provider_config) if v.provider_config != null && length(v.provider_config) > 0 }
}
output "vector_search_indices_status" {
  description = "Map of status values across all vector_search_indices, keyed the same as var.vector_search_indices except keys with no status are omitted"
  value       = { for k, v in databricks_vector_search_index.vector_search_indices : k => v.status if v.status != null && length(v.status) > 0 }
}

