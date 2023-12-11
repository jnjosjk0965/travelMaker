package com.servlet.api.beans;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown = true)
public class HotelList {
	@JsonProperty("data")
	private List<HotelData> data;
	public List<HotelData> getHotelData() {
		return data;
	}
	public void setHotelData(List<HotelData> data) {
		this.data = data;
	}
	@JsonIgnoreProperties(ignoreUnknown = true)
	public static class HotelData{
		@JsonProperty("name")
        private String name;
		@JsonProperty("hotelId")
        private String hotelId;
		@JsonProperty("geoCode")
        private GeoCode geoCode;
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getHotelId() {
			return hotelId;
		}
		public void setHotelId(String hotelId) {
			this.hotelId = hotelId;
		}
		public GeoCode getGeoCode() {
			return geoCode;
		}
		public void setGeoCode(GeoCode geoCode) {
			this.geoCode = geoCode;
		}
		@Override
		public String toString() {
			return "Data [name=" + name + ", hotelId=" + hotelId + ", geoCode=" + geoCode + "]";
		}
		
	}
	@JsonIgnoreProperties(ignoreUnknown = true)
	public static class GeoCode{
		@JsonProperty("latitude")
		private String latitude;
		@JsonProperty("longitude")
        private String longitude;
		public String getLatitude() {
			return latitude;
		}
		public void setLatitude(String latitude) {
			this.latitude = latitude;
		}
		public String getLongitude() {
			return longitude;
		}
		public void setLongitude(String longitude) {
			this.longitude = longitude;
		}
	}
}
