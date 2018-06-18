view: most_popular_day_for_checkin {
  derived_table: {
    sql_trigger_value: select 1 ;;
    sql: select c.business_id, c.weekday, derz.max as checkins
          from yelp_checkin c
          inner join
          (
            select der.business_id, max(der.checkins) as max
            FROM
            (SELECT business_id, weekday, sum(checkins) as checkins FROM yelp_checkin
            -- WHERE business_id = '3Mc-LxcqeguOXOVT_2ZtCg'
            group by 1,2
            ) der
            group by 1
          ) derz
          on derz.business_id = c.business_id
          group by 1,2,3
          having sum(c.checkins) = derz.max ;;
  }
  dimension: business_id {
    type: string
    primary_key: yes
    sql: ${TABLE}.business_id ;;
  }
  dimension: day_of_week {
    type: string
    sql: ${TABLE}.weekday ;;
  }
  dimension: total_checkins {
    type: number
    sql: ${TABLE}.checkins ;;
  }
}
