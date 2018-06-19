view: food_per_city {
  derived_table: {
    sql_trigger_value: select 1 ;;
    sql:
      SELECT count(business_id) as number_of_food_places
        , city
        , state
      FROM yelp_business
      WHERE (categories like '%food%'
        OR categories like '%restaurant%'
        OR categories like '%coffee%'
        OR categories like '%tea%'
        OR categories like '%bars%'
        OR categories like '%pubs%') --
        AND is_open = '1'
        GROUP BY 2,3 ;;
    indexes: ["business_id"]
  }
  dimension: business_id {
    type: string
    primary_key: yes
    sql: ${TABLE}.business_id ;;
  }
  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }
  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }
}
