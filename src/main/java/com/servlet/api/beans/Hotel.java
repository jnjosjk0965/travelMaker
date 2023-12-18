package com.servlet.api.beans;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Hotel {
	@JsonProperty("data")
	private List<HotelData> data;

	public List<HotelData> getData() {
		return data;
	}
	public void setData(List<HotelData> data) {
		this.data = data;
	}

	@JsonIgnoreProperties(ignoreUnknown = true)
	public static class HotelData{
		@JsonProperty("hotel")
		private HotelDetailData hotelDetailData;
		@JsonProperty("available")
		private boolean available;
		@JsonProperty("offers")
		private List<Offer> offers;
		@JsonProperty("self")
		private String self;
		public HotelDetailData getHotelDetailData() {
			return hotelDetailData;
		}
		public void setHotelDetailData(HotelDetailData hotelDetailData) {
			this.hotelDetailData = hotelDetailData;
		}
		public boolean isAvailable() {
			return available;
		}
		public void setAvailable(boolean available) {
			this.available = available;
		}
		public List<Offer> getOffers() {
			return offers;
		}
		public void setOffers(List<Offer> offers) {
			this.offers = offers;
		}
		public String getSelf() {
			return self;
		}
		public void setSelf(String self) {
			this.self = self;
		}
	}
	@JsonIgnoreProperties(ignoreUnknown = true)
	public static class HotelDetailData{
		@JsonProperty("hotelId")
        private String hotelId;
		@JsonProperty("chainCode")
        private String chainCode;
		@JsonProperty("dupeId")
        private String dupeId;
		@JsonProperty("name")
        private String name;
		@JsonProperty("latitude")
        private double latitude;
		@JsonProperty("longitude")
        private double longitude;
		public String getHotelId() {
			return hotelId;
		}
		public void setHotelId(String hotelId) {
			this.hotelId = hotelId;
		}
		public String getChainCode() {
			return chainCode;
		}
		public void setChainCode(String chainCode) {
			this.chainCode = chainCode;
		}
		public String getDupeId() {
			return dupeId;
		}
		public void setDupeId(String dupeId) {
			this.dupeId = dupeId;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public double getLatitude() {
			return latitude;
		}
		public void setLatitude(double latitude) {
			this.latitude = latitude;
		}
		public double getLongitude() {
			return longitude;
		}
		public void setLongitude(double longitude) {
			this.longitude = longitude;
		}
	}
	@JsonIgnoreProperties(ignoreUnknown = true)
	public static class Offer{
		@JsonProperty("id")
		private String id;
		@JsonProperty("checkInDate")
        private String checkInDate;
		@JsonProperty("checkOutDate")
        private String checkOutDate;
		@JsonProperty("room")
        private Room room;
		@JsonProperty("guests")
        private Guests guests;
		@JsonProperty("price")
        private HotelPrice price;
		@JsonProperty("self")
        private String self;
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public String getCheckInDate() {
			return checkInDate;
		}
		public void setCheckInDate(String checkInDate) {
			this.checkInDate = checkInDate;
		}
		public String getCheckOutDate() {
			return checkOutDate;
		}
		public void setCheckOutDate(String checkOutDate) {
			this.checkOutDate = checkOutDate;
		}
		public Room getRoom() {
			return room;
		}
		public void setRoom(Room room) {
			this.room = room;
		}
		public Guests getGuests() {
			return guests;
		}
		public void setGuests(Guests guests) {
			this.guests = guests;
		}
		public HotelPrice getPrice() {
			return price;
		}
		public void setPrice(HotelPrice price) {
			this.price = price;
		}
		public String getSelf() {
			return self;
		}
		public void setSelf(String self) {
			this.self = self;
		}
	}
	@JsonIgnoreProperties(ignoreUnknown = true)
	public static class Room{
		@JsonProperty("type")
		private String type;
		@JsonProperty("typeEstimated")
		private TypeEstimated typeEstimated;
		@JsonProperty("description")
        private Description description;
		public String getType() {
			return type;
		}
		public void setType(String type) {
			this.type = type;
		}
		public TypeEstimated getTypeEstimated() {
			return typeEstimated;
		}
		public void setTypeEstimated(TypeEstimated typeEstimated) {
			this.typeEstimated = typeEstimated;
		}
		public Description getDescription() {
			return description;
		}
		public void setDescription(Description description) {
			this.description = description;
		}
	}
	
	@JsonIgnoreProperties(ignoreUnknown = true)
	public static class TypeEstimated{
		@JsonProperty("category")
		private String category;
		@JsonProperty("beds")
        private int beds;
		@JsonProperty("bedType")
        private String bedType;
		public String getCategory() {
			return category;
		}
		public void setCategory(String category) {
			this.category = category;
		}
		public int getBeds() {
			return beds;
		}
		public void setBeds(int beds) {
			this.beds = beds;
		}
		public String getBedType() {
			return bedType;
		}
		public void setBedType(String bedType) {
			this.bedType = bedType;
		}
	}
	@JsonIgnoreProperties(ignoreUnknown = true)
	public static class Description{
		@JsonProperty("text")
		private String text;
		@JsonProperty("lang")
        private String lang;
		public String getText() {
			return text;
		}
		public void setText(String text) {
			this.text = text;
		}
		public String getLang() {
			return lang;
		}
		public void setLang(String lang) {
			this.lang = lang;
		}
	}
	@JsonIgnoreProperties(ignoreUnknown = true)
	public static class Guests {
		@JsonProperty("adults")
		private int adults;
		public int getAdults() {
			return adults;
		}
		public void setAdults(int adults) {
			this.adults = adults;
		}
	}
	@JsonIgnoreProperties(ignoreUnknown = true)
	public static class HotelPrice {
		@JsonProperty("currency")
		private String currency;
		@JsonProperty("base")
		private String base;
		@JsonProperty("total")
		private String total;
		@JsonProperty("variations")
	    private Variations variations;
		public String getCurrency() {
			return currency;
		}
		public void setCurrency(String currency) {
			this.currency = currency;
		}
		public String getBase() {
			return base;
		}
		public void setBase(String base) {
			this.base = base;
		}
		public String getTotal() {
			return total;
		}
		public void setTotal(String total) {
			this.total = total;
		}
		public Variations getVariations() {
			return variations;
		}
		public void setVariations(Variations variations) {
			this.variations = variations;
		}
	}
	@JsonIgnoreProperties(ignoreUnknown = true)
	public static class Variations{
		@JsonProperty("average")
		private Average average;
		@JsonProperty("changes")
	    private List<Change> changes;
		public Average getAverage() {
			return average;
		}
		public void setAverage(Average average) {
			this.average = average;
		}
		public List<Change> getChanges() {
			return changes;
		}
		public void setChanges(List<Change> changes) {
			this.changes = changes;
		}
	}
	@JsonIgnoreProperties(ignoreUnknown = true)
	public static class Average {
		@JsonProperty("base")
		private String base;
		public String getBase() {
			return base;
		}
		public void setBase(String base) {
			this.base = base;
		}
	}
	@JsonIgnoreProperties(ignoreUnknown = true)
	public static class Change {
		@JsonProperty("startDate")
		private String startDate;
		@JsonProperty("endDate")
		private String endDate;
		@JsonProperty("total")
		private String total;
		public String getStartDate() {
			return startDate;
		}
		public void setStartDate(String startDate) {
			this.startDate = startDate;
		}
		public String getEndDate() {
			return endDate;
		}
		public void setEndDate(String endDate) {
			this.endDate = endDate;
		}
		public String getTotal() {
			return total;
		}
		public void setTotal(String total) {
			this.total = total;
		}
	}
}
