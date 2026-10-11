resource "databricks_vector_search_index" "vector_search_indices" {
  for_each = var.vector_search_indices

  endpoint_name = each.value.endpoint_name
  index_type    = each.value.index_type
  name          = each.value.name
  primary_key   = each.value.primary_key
  endpoint_id   = each.value.endpoint_id
  index_subtype = each.value.index_subtype

  dynamic "delta_sync_index_spec" {
    for_each = each.value.delta_sync_index_spec != null ? [each.value.delta_sync_index_spec] : []
    content {
      columns_to_index = delta_sync_index_spec.value.columns_to_index
      columns_to_sync  = delta_sync_index_spec.value.columns_to_sync
      dynamic "embedding_source_columns" {
        for_each = delta_sync_index_spec.value.embedding_source_columns != null ? delta_sync_index_spec.value.embedding_source_columns : []
        content {
          embedding_model_endpoint_name = embedding_source_columns.value.embedding_model_endpoint_name
          model_endpoint_name_for_query = embedding_source_columns.value.model_endpoint_name_for_query
          name                          = embedding_source_columns.value.name
        }
      }
      dynamic "embedding_vector_columns" {
        for_each = delta_sync_index_spec.value.embedding_vector_columns != null ? delta_sync_index_spec.value.embedding_vector_columns : []
        content {
          embedding_dimension = embedding_vector_columns.value.embedding_dimension
          name                = embedding_vector_columns.value.name
        }
      }
      embedding_writeback_table = delta_sync_index_spec.value.embedding_writeback_table
      pipeline_type             = delta_sync_index_spec.value.pipeline_type
      source_table              = delta_sync_index_spec.value.source_table
    }
  }

  dynamic "direct_access_index_spec" {
    for_each = each.value.direct_access_index_spec != null ? [each.value.direct_access_index_spec] : []
    content {
      dynamic "embedding_source_columns" {
        for_each = direct_access_index_spec.value.embedding_source_columns != null ? direct_access_index_spec.value.embedding_source_columns : []
        content {
          embedding_model_endpoint_name = embedding_source_columns.value.embedding_model_endpoint_name
          model_endpoint_name_for_query = embedding_source_columns.value.model_endpoint_name_for_query
          name                          = embedding_source_columns.value.name
        }
      }
      dynamic "embedding_vector_columns" {
        for_each = direct_access_index_spec.value.embedding_vector_columns != null ? direct_access_index_spec.value.embedding_vector_columns : []
        content {
          embedding_dimension = embedding_vector_columns.value.embedding_dimension
          name                = embedding_vector_columns.value.name
        }
      }
      schema_json = direct_access_index_spec.value.schema_json
    }
  }

  dynamic "provider_config" {
    for_each = each.value.provider_config != null ? [each.value.provider_config] : []
    content {
      workspace_id = provider_config.value.workspace_id
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
    }
  }
}

