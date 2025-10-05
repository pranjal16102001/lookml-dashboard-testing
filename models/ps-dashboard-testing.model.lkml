# Define the database connection to be used for this model.
connection: "ps_bigquery_sales_connection"
# include all the views
include: "/views/**/*.view.lkml"

# Include all dashboard files in the 'dashboards' folder (Safest path fix)
include: "dashboards/*.dashboard"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.
datagroup: ps_dashboard_testing_default_datagroup {
  sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: ps_dashboard_testing_default_datagroup


explore: dim_customers {}
explore: facts_order {}
explore: dim_products {}
