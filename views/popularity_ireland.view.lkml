view: popularity_ireland {
  derived_table: {
    sql: SELECT
          spotify_popularity.title  AS spotify_popularity_title,
          spotify_popularity.track  AS spotify_popularity_track,
          spotify_popularity.position  AS spotify_popularity_position,
              (spotify_popularity.date ) AS spotify_popularity_date_date,
          spotify_popularity.artist  AS spotify_popularity_artist,
          spotify_popularity.uri  AS spotify_popularity_uri,
          COUNT(*) AS spotify_popularity_count,
          AVG(spotify_popularity.int64_field_0 ) AS spotify_popularity_average_int64_field_0,
          COALESCE(SUM(spotify_popularity.int64_field_0 ), 0) AS spotify_popularity_total_int64_field_0
      FROM `daveward-ps-dev.spotify_data.spotify_popularity`
           AS spotify_popularity
      WHERE (spotify_popularity.country ) = 'Ireland'
      GROUP BY
          1,
          2,
          3,
          4,
          5,
          6
       ;;
      datagroup_trigger: current_datagroup
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: spotify_popularity_title {
    type: string
    sql: ${TABLE}.spotify_popularity_title ;;
  }

  dimension: spotify_popularity_track {
    type: string
    sql: ${TABLE}.spotify_popularity_track ;;
  }

  dimension: spotify_popularity_position {
    type: number
    sql: ${TABLE}.spotify_popularity_position ;;
  }

  dimension: spotify_popularity_date_date {
    type: date
    datatype: date
    sql: ${TABLE}.spotify_popularity_date_date ;;
  }

  dimension: spotify_popularity_artist {
    type: string
    sql: ${TABLE}.spotify_popularity_artist ;;
  }

  dimension: spotify_popularity_uri {
    type: string
    sql: ${TABLE}.spotify_popularity_uri ;;
  }

  dimension: spotify_popularity_count {
    type: number
    sql: ${TABLE}.spotify_popularity_count ;;
  }

  dimension: spotify_popularity_average_int64_field_0 {
    type: number
    sql: ${TABLE}.spotify_popularity_average_int64_field_0 ;;
  }

  dimension: spotify_popularity_total_int64_field_0 {
    type: number
    sql: ${TABLE}.spotify_popularity_total_int64_field_0 ;;
  }

  set: detail {
    fields: [
      spotify_popularity_title,
      spotify_popularity_track,
      spotify_popularity_position,
      spotify_popularity_date_date,
      spotify_popularity_artist,
      spotify_popularity_uri,
      spotify_popularity_count,
      spotify_popularity_average_int64_field_0,
      spotify_popularity_total_int64_field_0
    ]
  }
}
