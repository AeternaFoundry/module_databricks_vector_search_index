variable "vector_search_indices" {
  description = <<EOT
Map of vector_search_indices, attributes below
Required:
    - endpoint_name
    - index_type
    - name
    - primary_key
Optional:
    - endpoint_id
    - index_subtype
    - delta_sync_index_spec (block):
        - columns_to_index (optional)
        - columns_to_sync (optional)
        - embedding_source_columns (optional, block):
            - embedding_model_endpoint_name (optional)
            - model_endpoint_name_for_query (optional)
            - name (optional)
        - embedding_vector_columns (optional, block):
            - embedding_dimension (optional)
            - name (optional)
        - embedding_writeback_table (optional)
        - pipeline_type (optional)
        - source_table (optional)
    - direct_access_index_spec (block):
        - embedding_source_columns (optional, block):
            - embedding_model_endpoint_name (optional)
            - model_endpoint_name_for_query (optional)
            - name (optional)
        - embedding_vector_columns (optional, block):
            - embedding_dimension (optional)
            - name (optional)
        - schema_json (optional)
    - provider_config (block):
        - workspace_id (optional)
    - timeouts (block):
        - create (optional)
EOT

  type = map(object({
    endpoint_name = string
    index_type    = string
    name          = string
    primary_key   = string
    endpoint_id   = optional(string)
    index_subtype = optional(string)
    delta_sync_index_spec = optional(object({
      columns_to_index = optional(list(string))
      columns_to_sync  = optional(list(string))
      embedding_source_columns = optional(list(object({
        embedding_model_endpoint_name = optional(string)
        model_endpoint_name_for_query = optional(string)
        name                          = optional(string)
      })))
      embedding_vector_columns = optional(list(object({
        embedding_dimension = optional(number)
        name                = optional(string)
      })))
      embedding_writeback_table = optional(string)
      pipeline_type             = optional(string)
      source_table              = optional(string)
    }))
    direct_access_index_spec = optional(object({
      embedding_source_columns = optional(list(object({
        embedding_model_endpoint_name = optional(string)
        model_endpoint_name_for_query = optional(string)
        name                          = optional(string)
      })))
      embedding_vector_columns = optional(list(object({
        embedding_dimension = optional(number)
        name                = optional(string)
      })))
      schema_json = optional(string)
    }))
    provider_config = optional(object({
      workspace_id = optional(string)
    }))
    timeouts = optional(object({
      create = optional(string)
    }))
  }))
}

