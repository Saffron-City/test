connection: "yelp"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

datagroup: thesis_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: thesis_default_datagroup

explore: yelp_business {
  join: yelp_business_attributes {
    type: left_outer
    sql_on: ${yelp_business.business_id} = ${yelp_business_attributes.business_id} ;;
    relationship: many_to_many
  }
}

explore: yelp_business_attributes {}

explore: yelp_business_hours {}

explore: yelp_checkin {}

explore: yelp_review {}

explore: yelp_tip {}

explore: yelp_user {}
