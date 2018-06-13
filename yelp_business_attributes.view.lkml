view: yelp_business_attributes {
  sql_table_name: yelp.yelp_business_attributes ;;

  dimension: accepts_insurance {
    type: string
    sql: ${TABLE}.AcceptsInsurance ;;
  }

  dimension: ages_allowed {
    type: string
    sql: ${TABLE}.AgesAllowed ;;
  }

  dimension: alcohol {
    type: string
    sql: ${TABLE}.Alcohol ;;
  }

  dimension: ambience_casual {
    type: string
    sql: ${TABLE}.Ambience_casual ;;
  }

  dimension: ambience_classy {
    type: string
    sql: ${TABLE}.Ambience_classy ;;
  }

  dimension: ambience_divey {
    type: string
    sql: ${TABLE}.Ambience_divey ;;
  }

  dimension: ambience_hipster {
    type: string
    sql: ${TABLE}.Ambience_hipster ;;
  }

  dimension: ambience_intimate {
    type: string
    sql: ${TABLE}.Ambience_intimate ;;
  }

  dimension: ambience_romantic {
    type: string
    sql: ${TABLE}.Ambience_romantic ;;
  }

  dimension: ambience_touristy {
    type: string
    sql: ${TABLE}.Ambience_touristy ;;
  }

  dimension: ambience_trendy {
    type: string
    sql: ${TABLE}.Ambience_trendy ;;
  }

  dimension: ambience_upscale {
    type: string
    sql: ${TABLE}.Ambience_upscale ;;
  }

  dimension: best_nights_friday {
    type: string
    sql: ${TABLE}.BestNights_friday ;;
  }

  dimension: best_nights_monday {
    type: string
    sql: ${TABLE}.BestNights_monday ;;
  }

  dimension: best_nights_saturday {
    type: string
    sql: ${TABLE}.BestNights_saturday ;;
  }

  dimension: best_nights_sunday {
    type: string
    sql: ${TABLE}.BestNights_sunday ;;
  }

  dimension: best_nights_thursday {
    type: string
    sql: ${TABLE}.BestNights_thursday ;;
  }

  dimension: best_nights_tuesday {
    type: string
    sql: ${TABLE}.BestNights_tuesday ;;
  }

  dimension: best_nights_wednesday {
    type: string
    sql: ${TABLE}.BestNights_wednesday ;;
  }

  dimension: bike_parking {
    type: string
    sql: ${TABLE}.BikeParking ;;
  }

  dimension: business_accepts_bitcoin {
    type: string
    sql: ${TABLE}.BusinessAcceptsBitcoin ;;
  }

  dimension: business_accepts_credit_cards {
    type: string
    sql: ${TABLE}.BusinessAcceptsCreditCards ;;
  }

  dimension: business_id {
    type: string
    sql: ${TABLE}.business_id ;;
  }

  dimension: business_parking_garage {
    type: string
    sql: ${TABLE}.BusinessParking_garage ;;
  }

  dimension: business_parking_lot {
    type: string
    sql: ${TABLE}.BusinessParking_lot ;;
  }

  dimension: business_parking_street {
    type: string
    sql: ${TABLE}.BusinessParking_street ;;
  }

  dimension: business_parking_valet {
    type: string
    sql: ${TABLE}.BusinessParking_valet ;;
  }

  dimension: business_parking_validated {
    type: string
    sql: ${TABLE}.BusinessParking_validated ;;
  }

  dimension: by_appointment_only {
    type: string
    sql: ${TABLE}.ByAppointmentOnly ;;
  }

  dimension: byob {
    type: string
    sql: ${TABLE}.BYOB ;;
  }

  dimension: byobcorkage {
    type: string
    sql: ${TABLE}.BYOBCorkage ;;
  }

  dimension: caters {
    type: string
    sql: ${TABLE}.Caters ;;
  }

  dimension: coat_check {
    type: string
    sql: ${TABLE}.CoatCheck ;;
  }

  dimension: corkage {
    type: string
    sql: ${TABLE}.Corkage ;;
  }

  dimension: dietary_restrictions_dairyfree {
    type: string
    sql: ${TABLE}.DietaryRestrictions_dairyfree ;;
  }

  dimension: dietary_restrictions_glutenfree {
    type: string
    sql: ${TABLE}.DietaryRestrictions_glutenfree ;;
  }

  dimension: dietary_restrictions_halal {
    type: string
    sql: ${TABLE}.DietaryRestrictions_halal ;;
  }

  dimension: dietary_restrictions_kosher {
    type: string
    sql: ${TABLE}.DietaryRestrictions_kosher ;;
  }

  dimension: dietary_restrictions_soyfree {
    type: string
    sql: ${TABLE}.DietaryRestrictions_soyfree ;;
  }

  dimension: dietary_restrictions_vegan {
    type: string
    sql: ${TABLE}.DietaryRestrictions_vegan ;;
  }

  dimension: dietary_restrictions_vegetarian {
    type: string
    sql: ${TABLE}.DietaryRestrictions_vegetarian ;;
  }

  dimension: dogs_allowed {
    type: string
    sql: ${TABLE}.DogsAllowed ;;
  }

  dimension: drive_thru {
    type: string
    sql: ${TABLE}.DriveThru ;;
  }

  dimension: good_for_dancing {
    type: string
    sql: ${TABLE}.GoodForDancing ;;
  }

  dimension: good_for_kids {
    type: string
    sql: ${TABLE}.GoodForKids ;;
  }

  dimension: good_for_meal_breakfast {
    type: string
    sql: ${TABLE}.GoodForMeal_breakfast ;;
  }

  dimension: good_for_meal_brunch {
    type: string
    sql: ${TABLE}.GoodForMeal_brunch ;;
  }

  dimension: good_for_meal_dessert {
    type: string
    sql: ${TABLE}.GoodForMeal_dessert ;;
  }

  dimension: good_for_meal_dinner {
    type: string
    sql: ${TABLE}.GoodForMeal_dinner ;;
  }

  dimension: good_for_meal_latenight {
    type: string
    sql: ${TABLE}.GoodForMeal_latenight ;;
  }

  dimension: good_for_meal_lunch {
    type: string
    sql: ${TABLE}.GoodForMeal_lunch ;;
  }

  dimension: hair_specializes_in_africanamerican {
    type: string
    sql: ${TABLE}.HairSpecializesIn_africanamerican ;;
  }

  dimension: hair_specializes_in_asian {
    type: string
    sql: ${TABLE}.HairSpecializesIn_asian ;;
  }

  dimension: hair_specializes_in_coloring {
    type: string
    sql: ${TABLE}.HairSpecializesIn_coloring ;;
  }

  dimension: hair_specializes_in_curly {
    type: string
    sql: ${TABLE}.HairSpecializesIn_curly ;;
  }

  dimension: hair_specializes_in_extensions {
    type: string
    sql: ${TABLE}.HairSpecializesIn_extensions ;;
  }

  dimension: hair_specializes_in_kids {
    type: string
    sql: ${TABLE}.HairSpecializesIn_kids ;;
  }

  dimension: hair_specializes_in_perms {
    type: string
    sql: ${TABLE}.HairSpecializesIn_perms ;;
  }

  dimension: hair_specializes_in_straightperms {
    type: string
    sql: ${TABLE}.HairSpecializesIn_straightperms ;;
  }

  dimension: happy_hour {
    type: string
    sql: ${TABLE}.HappyHour ;;
  }

  dimension: has_tv {
    type: string
    sql: ${TABLE}.HasTV ;;
  }

  dimension: music_background_music {
    type: string
    sql: ${TABLE}.Music_background_music ;;
  }

  dimension: music_dj {
    type: string
    sql: ${TABLE}.Music_dj ;;
  }

  dimension: music_jukebox {
    type: string
    sql: ${TABLE}.Music_jukebox ;;
  }

  dimension: music_karaoke {
    type: string
    sql: ${TABLE}.Music_karaoke ;;
  }

  dimension: music_live {
    type: string
    sql: ${TABLE}.Music_live ;;
  }

  dimension: music_no_music {
    type: string
    sql: ${TABLE}.Music_no_music ;;
  }

  dimension: music_video {
    type: string
    sql: ${TABLE}.Music_video ;;
  }

  dimension: noise_level {
    type: string
    sql: ${TABLE}.NoiseLevel ;;
  }

  dimension: open24_hours {
    type: string
    sql: ${TABLE}.Open24Hours ;;
  }

  dimension: outdoor_seating {
    type: string
    sql: ${TABLE}.OutdoorSeating ;;
  }

  dimension: restaurants_attire {
    type: string
    sql: ${TABLE}.RestaurantsAttire ;;
  }

  dimension: restaurants_counter_service {
    type: string
    sql: ${TABLE}.RestaurantsCounterService ;;
  }

  dimension: restaurants_delivery {
    type: string
    sql: ${TABLE}.RestaurantsDelivery ;;
  }

  dimension: restaurants_good_for_groups {
    type: string
    sql: ${TABLE}.RestaurantsGoodForGroups ;;
  }

  dimension: restaurants_price_range2 {
    type: string
    sql: ${TABLE}.RestaurantsPriceRange2 ;;
  }

  dimension: restaurants_reservations {
    type: string
    sql: ${TABLE}.RestaurantsReservations ;;
  }

  dimension: restaurants_table_service {
    type: string
    sql: ${TABLE}.RestaurantsTableService ;;
  }

  dimension: restaurants_take_out {
    type: string
    sql: ${TABLE}.RestaurantsTakeOut ;;
  }

  dimension: smoking {
    type: string
    sql: ${TABLE}.Smoking ;;
  }

  dimension: wheelchair_accessible {
    type: string
    sql: ${TABLE}.WheelchairAccessible ;;
  }

  dimension: wi_fi {
    type: string
    sql: ${TABLE}.WiFi ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
