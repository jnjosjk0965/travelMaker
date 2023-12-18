package com.servlet.api.beans;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown = true)
public class HotelList {
	@JsonProperty("data")
	private List<HotelListData> data;
	public List<HotelListData> getHotelListData() {
		return data;
	}
	public void setHotelListData(List<HotelListData> data) {
		this.data = data;
	}
	public String getHotelListString() {
		StringBuilder builder = new StringBuilder();
		for (HotelListData hotel : data) {
			builder.append(hotel.getHotelId() + ",");
		}
		String result = builder.toString();
		if (result.endsWith(",")) {
		    result = result.substring(0, result.length() - 1);
		}
		return "?hotelIds=" + result;
	}
	@JsonIgnoreProperties(ignoreUnknown = true)
	public static class HotelListData{
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
