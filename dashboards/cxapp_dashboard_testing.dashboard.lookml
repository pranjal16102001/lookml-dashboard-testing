dashboard: cxapp_dashboard_testing {
title: "CXApp Sales Dashboard"
layout: newspaper
preferred_viewer: dashboards-next
tile_size: 100
model: ps_dashboard_testing

filters: {
  name: order_date_filter, # <-- ADDED COMMA
  title: "Order Date",      # <-- ADDED COMMA (This is the likely fix for line 9 error)
  type: date_filter,
  default_value: "30 days",
  explore: facts_order,
  field: facts_order.order_date_date
} # Closing brace for the 'filters' block

elements: [
  {
  name: orders_by_product_category,
  title: "Top 10 Orders by Product Category",

  # Vertical Bar Chart
  type: looker_column,

  model: ps_dashboard_testing,
  explore: facts_order,

  # Link the tile to the dashboard filter
  listen: {
  order_date_filter: facts_order.order_date_date
  },

  query: {
  dimensions: [dim_products.category_name],
measures: [facts_order.order_count],
sorts: [facts_order.order_count desc],
limit: 10
},

# Positioning
row: 0,
col: 0,
width: 16,
height: 8
}
]
