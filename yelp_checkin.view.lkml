view: yelp_checkin {
  sql_table_name: yelp.yelp_checkin ;;

  dimension: business_id {
    type: string
    sql: ${TABLE}.business_id ;;
  }

  dimension: checkins {
    type: string
    sql: ${TABLE}.checkins ;;
  }

  dimension: hour {
    type: string
    sql: ${TABLE}.hour ;;
  }

  dimension: weekday {
    type: string
    sql: ${TABLE}.weekday ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: total_checkins {
    label: "Total Checkins"
    type: sum
    sql: ${TABLE}.checkins ;;
    drill_fields: [business_id]
  }
}
