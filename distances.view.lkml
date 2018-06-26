view: distances {
  sql_table_name: yelp.yelp_business ;;
  dimension: lat  {
    type: number
    sql: ${TABLE}.latitude ;;
  }
  dimension: lon {
    type: number
    sql: ${TABLE}.longitude ;;
  }
  dimension: location {
    type: location
    sql_latitude: ${lat} ;;
    sql_longitude: ${lon} ;;
  }
  parameter: starting_point {
    type: string
    allowed_value: {
      label: "Caesar's Palace"
      value: "cp"
    }
    allowed_value: {
      label: "Santa Cruz Office"
      value: "sc"
    }
    allowed_value: {
      label: "MSOE"
      value: "msoe"
    }
    allowed_value: {
      label: "UW Madison"
      value: "uwm"
    }
  }
  dimension: distance_city_lat {
    hidden: yes
    type: number
    sql: CASE WHEN {% parameter city %} = 'cp' THEN 36.1162
              WHEN {% parameter city %} = 'sc' THEN 36.974261
              WHEN {% parameter city %} = 'msoe' THEN 43.044104
              WHEN {% parameter city %} = 'uwm' THEN 43.076260
              -- WHEN {% parameter city %} = 'berlin' THEN 52.5200
              ELSE 48.864716 END ;;
  }

  dimension: distance_city_long {
    hidden: yes
    type: number
    sql: CASE WHEN {% parameter city %} = 'cp' THEN 115.1745
              WHEN {% parameter city %} = 'sc' THEN -122.026518
              WHEN {% parameter city %} = 'msoe' THEN -87.908014
              WHEN {% parameter city %} = 'uwm' THEN -89.400004
              -- WHEN {% parameter city %} = 'berlin' THEN 13.404954
              ELSE 2.349014 END ;;
  }

  dimension: location_of_selected_city {
    hidden: yes
    type: location
    sql_latitude: ${distance_city_lat} ;;
    sql_longitude: ${distance_city_long} ;;
  }

  dimension: distance_between_selected_city_and_user {
    label: "Distance in mi"
    type: distance
    start_location_field: location
    end_location_field: location_of_selected_city
    units: miles
  }
}
