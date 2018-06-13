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

  dimension: date {
    type: string
    sql: ${TABLE}.date ;;
  }

  dimension: funny {
    type: string
    sql: ${TABLE}.funny ;;
  }

  dimension: review_id {
    type: string
    sql: ${TABLE}.review_id ;;
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
    drill_fields: []
  }
}
