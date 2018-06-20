view: yelp_user {
  sql_table_name: yelp.yelp_user ;;

  dimension: average_stars {
    type: string
    sql: ${TABLE}.average_stars ;;
  }

  dimension: compliment_cool {
    type: string
    sql: ${TABLE}.compliment_cool ;;
  }

  dimension: compliment_cute {
    type: string
    sql: ${TABLE}.compliment_cute ;;
  }

  dimension: compliment_funny {
    type: string
    sql: ${TABLE}.compliment_funny ;;
  }

  dimension: compliment_hot {
    type: string
    sql: ${TABLE}.compliment_hot ;;
  }

  dimension: compliment_list {
    type: string
    sql: ${TABLE}.compliment_list ;;
  }

  dimension: compliment_more {
    type: string
    sql: ${TABLE}.compliment_more ;;
  }

  dimension: compliment_note {
    type: string
    sql: ${TABLE}.compliment_note ;;
  }

  dimension: compliment_photos {
    type: string
    sql: ${TABLE}.compliment_photos ;;
  }

  dimension: compliment_plain {
    type: string
    sql: ${TABLE}.compliment_plain ;;
  }

  dimension: compliment_profile {
    type: string
    sql: ${TABLE}.compliment_profile ;;
  }

  dimension: compliment_writer {
    type: string
    sql: ${TABLE}.compliment_writer ;;
  }

  dimension: cool {
    type: string
    sql: ${TABLE}.cool ;;
  }

  dimension: elite {
    type: string
    sql: ${TABLE}.elite ;;
  }

  dimension: fans {
    type: string
    sql: ${TABLE}.fans ;;
  }

  dimension: friends {
    type: string
    sql: ${TABLE}.friends ;;
  }

  dimension: funny {
    type: string
    sql: ${TABLE}.funny ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: review_count {
    type: string
    sql: ${TABLE}.review_count ;;
  }

  dimension: useful {
    type: string
    sql: ${TABLE}.useful ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
    primary_key: yes
  }
  dimension_group: yelping_since {
    type: time
    timeframes: [day_of_week, month, year, date]
    sql: STR_TO_DATE(${TABLE}.yelping_since, '%Y-%m-%d') ;;
    datatype: date
  }
#   dimension: yelping_since {
#     type: string
#     sql: ${TABLE}.yelping_since ;;
#   }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
