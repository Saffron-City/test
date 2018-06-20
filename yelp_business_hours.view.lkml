view: yelp_business_hours {
  sql_table_name: yelp.yelp_business_hours ;;

  dimension: business_id {
    type: string
    sql: ${TABLE}.business_id ;;
    primary_key: yes
  }

  dimension: friday {
    type: string
    sql: ${TABLE}.friday ;;
  }

  dimension: monday {
    type: string
    sql: ${TABLE}.monday ;;
  }

  dimension: saturday {
    type: string
    sql: ${TABLE}.saturday ;;
  }

  dimension: sunday {
    type: string
    sql: ${TABLE}.sunday ;;
  }

  dimension: thursday {
    type: string
    sql: ${TABLE}.thursday ;;
  }

  dimension: tuesday {
    type: string
    sql: ${TABLE}.tuesday ;;
  }

  dimension: wednesday {
    type: string
    sql: ${TABLE}.wednesday ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
