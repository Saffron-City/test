view: yelp_review {
  sql_table_name: yelp.yelp_review ;;

  dimension: business_id {
    type: string
    sql: ${TABLE}.business_id ;;
  }

  dimension: cool {
    type: string
    sql: ${TABLE}.cool ;;
  }
  dimension_group: date {
    type: time
    timeframes: [day_of_week, month, quarter, year, date]
    sql: ${TABLE}.date ;;
    datatype: date
  }
#   dimension: date {
#     type: string
#     sql: ${TABLE}.date ;;
#   }

  dimension: funny {
    type: string
    sql: ${TABLE}.funny ;;
  }

  dimension: review_id {
    type: string
    sql: ${TABLE}.review_id ;;
    primary_key: yes
  }

  dimension: stars {
    type: string
    sql: ${TABLE}.stars ;;
  }

  dimension: text {
    type: string
    sql: ${TABLE}.text ;;
  }

  dimension: review_length {
    type: string
    sql: char_length(${TABLE}.text) ;;
  }

  dimension: useful {
    type: string
    sql: ${TABLE}.useful ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
   # sql: ${TABLE}. ;;
    drill_fields: []
  }

#   measure: min_stars {
#     type: min
#     sql: ${TABLE}.stars ;;
#   }
#
#   measure: lower_quartile_stars {
#     type: percentile
#     percentile: 25
#     sql: ${TABLE}.stars ;;
#   }
#
#   measure: median_stars {
#     type: median
#     sql: ${TABLE}.stars ;;
#   }
#
#   measure: upper_quartile_stars {
#     type: percentile
#     percentile: 75
#     sql: ${TABLE}.stars ;;
#   }
#
#   measure: max_stars {
#     type: max
#     sql: ${TABLE}.stars ;;
#   }

  measure: min_text {
    type: min
    sql: char_length(${TABLE}.text) ;;
  }

  measure: lower_quartile_text {
    type: percentile
    percentile: 25
    sql: char_length(${TABLE}.text) ;;
  }

  measure: median_text {
    type: median
    sql: char_length(${TABLE}.text) ;;
  }

  measure: upper_quartile_text {
    type: percentile
    percentile: 75
    sql: char_length(${TABLE}.text) ;;
  }

  measure: max_text {
    type: max
    sql: char_length(${TABLE}.text) ;;
  }

}
