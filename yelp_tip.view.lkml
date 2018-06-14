view: yelp_tip {
  sql_table_name: yelp.yelp_tip ;;

  dimension: business_id {
    type: string
    sql: ${TABLE}.business_id ;;
  }
  dimension_group: date {
    type: time
    timeframes: [day_of_week, month, year, date]
    sql: STR_TO_DATE(${TABLE}.date, '%Y-%m-%d') ;;
    datatype: date
  }
#   dimension: date {
#     type: string
#     sql: ${TABLE}.date ;;
#   }

  dimension: likes {
    type: string
    sql: ${TABLE}.likes ;;
  }

  dimension: text {
    type: string
    sql: ${TABLE}.text ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
