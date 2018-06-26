#DEPRECATE

view: active_users {
  derived_table: {
    sql_trigger_value: select 1;;
    # distribution: "user_id" #Redshoft only; use indexes for MySQL
    # sortkeys: ["date"] #Redshift only
    sql: WITH daily_use AS (

        SELECT
          user_id
          , DATE_TRUNC('day', date) as activity_date
        FROM yelp_review
        GROUP BY 1, 2
      )
      --  ## 3) Cross join activity and dates to build a row for each user/date combo with
      -- days since last activity
      SELECT
            daily_use.user_id
          , wd.date as date
          , MIN(wd.date::date - daily_use.activity_date::date) as days_since_last_action
      FROM ${date_series.SQL_TABLE_NAME} AS wd
      LEFT JOIN daily_use
          ON wd.date >= daily_use.activity_date
          AND wd.date < daily_use.activity_date + interval '30 day'
      GROUP BY 1,2
       ;;
    indexes: ["user_id"]
  }

  dimension: date {
    type: date
    sql: ${TABLE}.date ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: days_since_last_action {
    type: number
    sql: ${TABLE}.days_since_last_action ;;
    value_format_name: decimal_0
  }

  dimension: active_this_day {
    type: yesno
    sql: ${days_since_last_action} <  1 ;;
  }

  dimension: active_last_7_days {
    type: yesno
    sql: ${days_since_last_action} < 7 ;;
  }

  measure: user_count_active_30_days {
    label: "Monthly Active Users"
    type: count_distinct
    sql: ${user_id} ;;
    drill_fields: [user_details*]
  }

  measure: user_count_active_this_day {
    label: "Daily Active Users"
    type: count_distinct
    sql: ${user_id} ;;
    drill_fields: [user_details*]

    filters: {
      field: active_this_day
      value: "yes"
    }
  }

  measure: user_count_active_7_days {
    label: "Weekly Active Users"
    type: count_distinct
    sql: ${user_id} ;;
    drill_fields: [user_details*]

    filters: {
      field: active_last_7_days
      value: "yes"
    }
  }
  set: user_details {
    fields: [yelp_user.user_id, yelp_user.name]
  }
}
