view: yelp_tip {
  sql_table_name: yelp.yelp_tip ;;

  dimension: business_id {
    type: string
    sql: ${TABLE}.business_id ;;
  }

  dimension: date {
    type: string
    sql: ${TABLE}.date ;;
  }

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
