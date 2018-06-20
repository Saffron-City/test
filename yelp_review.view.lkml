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
    timeframes: [day_of_week, month, year, date]
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

  measure: min_stars {
    type: min
    sql: min(${TABLE}.stars) ;;
  }

  measure: first_quartile_stars {
    type: percentile
    percentile: 25
    sql: ${TABLE}.stars ;;

  }

  measure: median_stars {
    type: median
    sql: ${TABLE}.stars ;;
  }

  measure: third_quartile_stars {
    type: percentile
    percentile: 75
    sql: ${TABLE}.stars ;;
  }

  measure: max_stars {
    type: max
    sql: max(${TABLE}.stars) ;;
  }
}
