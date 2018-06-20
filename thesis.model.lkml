connection: "yelp"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

datagroup: thesis_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "10000 hour"
}

persist_with: thesis_default_datagroup


# Base case explore
explore: yelp_business {
  join: yelp_business_attributes {
    type: left_outer
    sql_on: ${yelp_business.business_id} = ${yelp_business_attributes.business_id} ;;
    relationship: one_to_many
  }
  join: yelp_business_hours {
    type: left_outer
    sql_on: ${yelp_business.business_id} = ${yelp_business_hours.business_id} ;;
    relationship: one_to_many
  }
  join: yelp_checkin {
    type: left_outer
    sql_on: ${yelp_business.business_id} = ${yelp_checkin.business_id} ;;
    relationship: one_to_many
  }
  join: yelp_tip {
    type: left_outer
    sql_on: ${yelp_business.business_id} = ${yelp_tip.business_id} ;;
    relationship: one_to_many
  }
  join: yelp_review {
    type: left_outer
    sql_on: ${yelp_business.business_id} = ${yelp_review.business_id} ;;
    relationship: one_to_many
  }
  join: yelp_user {
    type: left_outer
    sql_on: ${yelp_user.user_id} = ${yelp_review.user_id} OR ${yelp_user.user_id} = ${yelp_tip.user_id} ;;
    relationship: one_to_many
  }
  join: total_checkins_per_business {
    type: left_outer
    sql_on: ${yelp_business.business_id} = ${total_checkins_per_business.business_id} ;;
    relationship: one_to_one
  }

}

## User Explore
explore: yelp_user {
  join: yelp_tip {
    type: left_outer
    sql_on: ${yelp_tip.user_id} = ${yelp_user.user_id} ;;
    relationship: one_to_many
  }
  join: yelp_review {
    type: left_outer
    sql_on: ${yelp_review.user_id} = ${yelp_user.user_id} ;;
    relationship: one_to_many
  }
}

### Testing
explore: food_per_city {}

explore: most_popular_day_for_checkin {}

explore: total_checkins_per_business {}
#
# explore: yelp_business_attributes {}
#
# explore: yelp_business_hours {}
#
# explore: yelp_checkin {
#   join: yelp_business {
#     type: left_outer
#     sql_on: ${yelp_checkin.business_id} = ${yelp_business.business_id}  ;;
#     relationship: many_to_one
#   }
# }
#
# explore: yelp_review {
#   join: yelp_user {
#     type: left_outer
#     sql_on: ${yelp_review.user_id} = ${yelp_user.user_id} ;;
#     relationship: many_to_one
#   }
# }
#
# explore: yelp_tip {}
#
# explore: yelp_user {}
