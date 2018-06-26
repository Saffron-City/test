view: yelp_business {
  sql_table_name: yelp.yelp_business ;;

  dimension: address {
    type: string
    sql: ${TABLE}.address ;;
  }

  dimension: business_id {
    type: string
    sql: ${TABLE}.business_id ;;
    primary_key: yes
  }

  dimension: categories {
    type: string
    sql: ${TABLE}.categories ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: is_open {
    type: string
    sql: ${TABLE}.is_open ;;
  }

#   dimension: latitude {
#     type: string
#     sql: ${TABLE}.latitude ;;
#   }
#
#   dimension: longitude {
#     type: string
#     sql: ${TABLE}.longitude ;;
#   }
  dimension: coordinates {
    type: location
    sql_latitude:${TABLE}.latitude ;;
    sql_longitude:${TABLE}.longitude ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: neighborhood {
    type: string
    sql: ${TABLE}.neighborhood ;;
  }

  dimension: postal_code {
    type: string
    map_layer_name: us_zipcode_tabulation_areas
    sql: ${TABLE}.postal_code ;;
  }

  dimension: review_count {
    type: string
    sql: ${TABLE}.review_count ;;
  }

  dimension: stars {
    type: string
    sql: ${TABLE}.stars ;;
  }

  dimension: state {
    type: string
    map_layer_name: us_states
    sql: ${TABLE}.state ;;
  }

  measure: count {
    type: count
    drill_fields: [business_detail*]
  }

  measure: zipcodes {
    type: count
    drill_fields: [postal_code, count]
  }

  measure: number_of_unique_states {
    type: count_distinct
    sql: ${TABLE}.state ;;
  }

  measure: number_of_unique_cities {
    type: count_distinct
    sql: ${TABLE}.city ;;
  }

  # source: https://discourse.looker.com/t/calculating-distance-from-a-dynamically-selected-location/7060
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
    sql: CASE WHEN {% parameter starting_point %} = 'cp' THEN 36.1162
              WHEN {% parameter starting_point %} = 'sc' THEN 36.974261
              WHEN {% parameter starting_point %} = 'msoe' THEN 43.044104
              WHEN {% parameter starting_point %} = 'uwm' THEN 43.076260
              ELSE 36.1162 END ;;
  }

  dimension: distance_city_long {
    hidden: yes
    type: number
    sql: CASE WHEN {% parameter starting_point %} = 'cp' THEN -115.1745
              WHEN {% parameter starting_point %} = 'sc' THEN -122.026518
              WHEN {% parameter starting_point %} = 'msoe' THEN -87.908014
              WHEN {% parameter starting_point %} = 'uwm' THEN -89.400004
              ELSE -115.1745 END ;;
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


  set: business_detail {
    fields: [name, categories, business_attributes*]
  }

  set: business_attributes {
    fields: [yelp_business_attributes.business_id,yelp_business_attributes.AcceptsInsurance,yelp_business_attributes.ByAppointmentOnly,yelp_business_attributes.BusinessAcceptsCreditCards,yelp_business_attributes.BusinessParking_garage,yelp_business_attributes.BusinessParking_street,yelp_business_attributes.BusinessParking_validated,yelp_business_attributes.BusinessParking_lot,yelp_business_attributes.BusinessParking_valet,yelp_business_attributes.HairSpecializesIn_coloring,yelp_business_attributes.HairSpecializesIn_africanamerican,yelp_business_attributes.HairSpecializesIn_curly,yelp_business_attributes.HairSpecializesIn_perms,yelp_business_attributes.HairSpecializesIn_kids,yelp_business_attributes.HairSpecializesIn_extensions,yelp_business_attributes.HairSpecializesIn_asian,yelp_business_attributes.HairSpecializesIn_straightperms,yelp_business_attributes.RestaurantsPriceRange2,yelp_business_attributes.GoodForKids,yelp_business_attributes.WheelchairAccessible,yelp_business_attributes.BikeParking,yelp_business_attributes.Alcohol,yelp_business_attributes.HasTV,yelp_business_attributes.NoiseLevel,yelp_business_attributes.RestaurantsAttire,yelp_business_attributes.Music_dj,yelp_business_attributes.Music_background_music,yelp_business_attributes.Music_no_music,yelp_business_attributes.Music_karaoke,yelp_business_attributes.Music_live,yelp_business_attributes.Music_video,yelp_business_attributes.Music_jukebox,yelp_business_attributes.Ambience_romantic,yelp_business_attributes.Ambience_intimate,yelp_business_attributes.Ambience_classy,yelp_business_attributes.Ambience_hipster,yelp_business_attributes.Ambience_divey,yelp_business_attributes.Ambience_touristy,yelp_business_attributes.Ambience_trendy,yelp_business_attributes.Ambience_upscale,yelp_business_attributes.Ambience_casual,yelp_business_attributes.RestaurantsGoodForGroups,yelp_business_attributes.Caters,yelp_business_attributes.WiFi,yelp_business_attributes.RestaurantsReservations,yelp_business_attributes.RestaurantsTakeOut,yelp_business_attributes.HappyHour,yelp_business_attributes.GoodForDancing,yelp_business_attributes.RestaurantsTableService,yelp_business_attributes.OutdoorSeating,yelp_business_attributes.RestaurantsDelivery,yelp_business_attributes.BestNights_monday,yelp_business_attributes.BestNights_tuesday,yelp_business_attributes.BestNights_friday,yelp_business_attributes.BestNights_wednesday,yelp_business_attributes.BestNights_thursday,yelp_business_attributes.BestNights_sunday,yelp_business_attributes.BestNights_saturday,yelp_business_attributes.GoodForMeal_dessert,yelp_business_attributes.GoodForMeal_latenight,yelp_business_attributes.GoodForMeal_lunch,yelp_business_attributes.GoodForMeal_dinner,yelp_business_attributes.GoodForMeal_breakfast,yelp_business_attributes.GoodForMeal_brunch,yelp_business_attributes.CoatCheck,yelp_business_attributes.Smoking,yelp_business_attributes.DriveThru,yelp_business_attributes.DogsAllowed,yelp_business_attributes.BusinessAcceptsBitcoin,yelp_business_attributes.Open24Hours,yelp_business_attributes.BYOBCorkage,yelp_business_attributes.BYOB,yelp_business_attributes.Corkage,yelp_business_attributes.DietaryRestrictions_dairy-free,yelp_business_attributes.DietaryRestrictions_gluten-free,yelp_business_attributes.DietaryRestrictions_vegan,yelp_business_attributes.DietaryRestrictions_kosher,yelp_business_attributes.DietaryRestrictions_halal,yelp_business_attributes.DietaryRestrictions_soy-free,yelp_business_attributes.DietaryRestrictions_vegetarian,yelp_business_attributes.AgesAllowed,yelp_business_attributes.RestaurantsCounterService]
  }
}
