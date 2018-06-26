view: monthly_activity {
  derived_table: {
    sql_trigger_value: select 1 ;;
    # sortkeys: ["signup_month"]
    # distribution: "user_id"
    sql: SELECT

                yelp_user.user_id as user_id
              , extract(month from yelp_user.yelping_since) as signup_month
             -- , extract(year from yelp_user.yelping_since) as signup_year
              , month_list.written_month as written_month
              , COALESCE(data.monthly_reviews, 0) as monthly_reviews
             -- , COALESCE(data.total_purchase_amount, 0) as monthly_spend
             -- , row_number() over() AS key
            FROM
              yelp_user

            LEFT JOIN

              (
                SELECT
                  DISTINCT(extract(month from yelp_review.date)) as written_month
                FROM yelp_review
              ) as month_list
            ON month_list.written_month >= extract(month from yelp_user.yelping_since)  -- your dialect will vary

            LEFT JOIN

              (
                SELECT
                      o.user_id
                    , extract(month from o.date) as written_month
                    , COUNT(distinct o.review_id) AS monthly_reviews
                   -- , sum(o.sale_price) AS total_purchase_amount

                FROM yelp_review o
                GROUP BY 1,2
              ) as data
            ON data.written_month = month_list.written_month
            AND data.user_id = yelp_user.user_id
             ;;
    indexes: ["user_id"]
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension_group: signup {
    type: time
    timeframes: [month]
    sql: ${TABLE}.signup_month ;;
  }

  dimension_group: written {
    type: time
    timeframes: [month]
    sql: ${TABLE}.written_month ;;
  }

  dimension: months_since_signup {
    type: number
    sql: timestampdiff(month, ${TABLE}.signup_month, ${TABLE}.written_month) ;;
  }

  dimension: monthly_reviews {
    type: number
    sql: ${TABLE}.monthly_reviews ;;
  }

  measure: total_yelp_user {
    type: count_distinct
    sql: ${user_id} ;;
    drill_fields: [yelp_user.id, yelp_user.age, yelp_user.name, user_order_facts.lifetime_orders]
  }

  measure: total_active_yelp_user {
    type: count_distinct
    sql: ${user_id} ;;
    drill_fields: [yelp_user.id, yelp_user.age, yelp_user.name, user_order_facts.lifetime_orders]

    filters: {
      field: monthly_reviews
      value: ">0"
    }
  }

  measure: percent_of_cohort_active {
    type: number
    value_format_name: percent_1
    sql: 1.0 * ${total_active_yelp_user} / nullif(${total_yelp_user},0) ;;
    drill_fields: [user_id, monthly_reviews, total_reviews_written]
  }

  measure: total_reviews_written {
    type: sum
    value_format_name: usd
    sql: ${monthly_reviews} ;;
    drill_fields: [detail*]
  }

  measure: reviews_per_user {
    type: number
    value_format_name: usd
    sql: ${total_reviews_written} / nullif(${total_yelp_user},0) ;;
    drill_fields: [user_id, monthly_reviews, total_reviews_written]
  }

  measure: spend_per_active_user {
    type: number
    value_format_name: usd
    sql: ${total_reviews_written} / nullif(${total_active_yelp_user},0) ;;
    drill_fields: [user_id, total_reviews_written]
  }

  dimension: key {
    type: number
    primary_key: yes
    hidden: yes
    sql: ${TABLE}.key ;;
  }

  set: detail {
    fields: [user_id, signup_month, monthly_reviews]
  }
}
