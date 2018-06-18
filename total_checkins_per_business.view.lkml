view: total_checkins_per_business {
  derived_table: {
    sql_trigger_value: select 1 ;;
    sql:
      SELECT business_id, SUM(checkins) as checkins FROM yelp_checkin
      GROUP BY 1 ;;
  }
  dimension: business_id {
    type: string
    primary_key: yes
    sql: ${TABLE}.business_id ;;
  }
  dimension: total_checkins {
    type: number
    sql: ${TABLE}.checkins ;;
  }
}
