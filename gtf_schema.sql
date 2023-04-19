CREATE TABLE agency (
  agency_id TEXT,
  agency_name TEXT,
  agency_url TEXT,
  agency_timezone TEXT,
  agency_lang TEXT,
  agency_phone TEXT,
  agency_fare_url TEXT,
  agency_email TEXT,
  PRIMARY KEY (agency_id)
);
CREATE TABLE route (
  route_id TEXT PRIMARY KEY,
  agency_id TEXT,
  route_short_name TEXT,
  route_long_name TEXT,
  route_desc TEXT,
  route_type INTEGER,
  route_url TEXT,
  route_color TEXT,
  route_text_color TEXT
);
CREATE TABLE trip (
  trip_id TEXT PRIMARY KEY,
  route_id TEXT,
  service_id TEXT,
  trip_headsign TEXT,
  trip_short_name TEXT,
  direction_id INTEGER,
  block_id TEXT,
  shape_id TEXT,
  FOREIGN KEY (route_id) REFERENCES route(route_id)
);
CREATE TABLE stop (
  stop_id TEXT PRIMARY KEY,
  stop_name TEXT,
  stop_lat REAL,
  stop_lon REAL,
  stop_desc TEXT,
  zone_id TEXT,
  stop_url TEXT,
  location_type INTEGER,
  parent_station TEXT,
  wheelchair_boarding INTEGER
);
CREATE TABLE stop_time (
  trip_id TEXT,
  arrival_time TEXT,
  departure_time TEXT,
  stop_id TEXT,
  stop_sequence INTEGER,
  stop_headsign TEXT,
  pickup_type INTEGER,
  drop_off_type INTEGER,
  shape_dist_traveled REAL,
  timepoint INTEGER,
  FOREIGN KEY (trip_id) REFERENCES trip(trip_id),
  FOREIGN KEY (stop_id) REFERENCES stop(stop_id),
  PRIMARY KEY (trip_id, stop_sequence)
);
CREATE TABLE calendar (
  service_id TEXT PRIMARY KEY,
  monday INTEGER,
  tuesday INTEGER,
  wednesday INTEGER,
  thursday INTEGER,
  friday INTEGER,
  saturday INTEGER,
  sunday INTEGER,
  start_date TEXT,
  end_date TEXT
);
