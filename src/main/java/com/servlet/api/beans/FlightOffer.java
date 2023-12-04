package com.servlet.api.beans;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.List;

@JsonIgnoreProperties(ignoreUnknown = true)
public class FlightOffer {
	@JsonProperty("meta")
    private Meta meta;
	@JsonProperty("data")
    private List<Data> data;

    public Meta getMeta() {
		return meta;
	}
	public void setMeta(Meta meta) {
		this.meta = meta;
	}
	public List<Data> getData() {
		return data;
	}
	public void setData(List<Data> data) {
		this.data = data;
	}
	// Inner classes for nested structures

    public static class Meta {
    	// 검색 결과 수
    	@JsonProperty("count")
        private int count;
        // 요청 링크
    	@JsonProperty("links")
        private Links links;
        
		public int getCount() {
			return count;
		}
		public void setCount(int count) {
			this.count = count;
		}
		public Links getLinks() {
			return links;
		}
		public void setLinks(Links links) {
			this.links = links;
		}

    }

    public static class Links {
    	@JsonProperty("self")
        private String self;

		public String getSelf() {
			return self;
		}

		public void setSelf(String self) {
			this.self = self;
		}
    }
	@JsonIgnoreProperties(ignoreUnknown = true)
    public static class Data {
    	@JsonProperty("id")
        private String id; // 플라이트 오퍼 id
    	@JsonProperty("oneWay")
        private boolean oneWay; // 편도인지 아닌지
    	@JsonProperty("lastTicketingDate")
        private String lastTicketingDate;
    	@JsonProperty("lastTicketingDateTime")
        private String lastTicketingDateTime;
    	@JsonProperty("numberOfBookableSeats")
        private int numberOfBookableSeats;  // 최대 예약 가능 수
    	@JsonProperty("itineraries")
        private List<Itinerary> itineraries; // 여행 일정
    	@JsonProperty("price")
        private Price price;  // 가격 정보
    	@JsonProperty("travelerPricings")
        private List<TravelerPricing> travelerPricings; // 각 여행자의 요금
       
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public boolean isOneWay() {
			return oneWay;
		}
		public void setOneWay(boolean oneWay) {
			this.oneWay = oneWay;
		}
		public String getLastTicketingDate() {
			return lastTicketingDate;
		}
		public void setLastTicketingDate(String lastTicketingDate) {
			this.lastTicketingDate = lastTicketingDate;
		}
		public String getLastTicketingDateTime() {
			return lastTicketingDateTime;
		}
		public void setLastTicketingDateTime(String lastTicketingDateTime) {
			this.lastTicketingDateTime = lastTicketingDateTime;
		}
		public int getNumberOfBookableSeats() {
			return numberOfBookableSeats;
		}
		public void setNumberOfBookableSeats(int numberOfBookableSeats) {
			this.numberOfBookableSeats = numberOfBookableSeats;
		}
		public List<Itinerary> getItineraries() {
			return itineraries;
		}
		public void setItineraries(List<Itinerary> itineraries) {
			this.itineraries = itineraries;
		}
		public Price getPrice() {
			return price;
		}
		public void setPrice(Price price) {
			this.price = price;
		}
		public List<TravelerPricing> getTravelerPricings() {
			return travelerPricings;
		}
		public void setTravelerPricings(List<TravelerPricing> travelerPricings) {
			this.travelerPricings = travelerPricings;
		}
    }
	@JsonIgnoreProperties(ignoreUnknown = true)
    public static class Itinerary {
        private List<Segment> segments;
        
		public List<Segment> getSegments() {
			return segments;
		}
		public void setSegments(List<Segment> segments) {
			this.segments = segments;
		}
    }
	@JsonIgnoreProperties(ignoreUnknown = true)
    public static class Segment {
    	private String id; // 세그먼트 아이디
        private Departure departure; // 출발 정보
        private Arrival arrival; // 도착 정보
        private String carrierCode; // 비행사 코드
        private String number;  // 비행기에 할당된 코드
        private Aircraft aircraft; // 비행기 정보
        
		public Departure getDeparture() {
			return departure;
		}
		public void setDeparture(Departure departure) {
			this.departure = departure;
		}
		public Arrival getArrival() {
			return arrival;
		}
		public void setArrival(Arrival arrival) {
			this.arrival = arrival;
		}
		public String getCarrierCode() {
			return carrierCode;
		}
		public void setCarrierCode(String carrierCode) {
			this.carrierCode = carrierCode;
		}
		public String getNumber() {
			return number;
		}
		public void setNumber(String number) {
			this.number = number;
		}
		public Aircraft getAircraft() {
			return aircraft;
		}
		public void setAircraft(Aircraft aircraft) {
			this.aircraft = aircraft;
		}
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
    }
	@JsonIgnoreProperties(ignoreUnknown = true)
    public static class Departure {
        private String iataCode;
        private String terminal;
        private String at;
        
		public String getIataCode() {
			return iataCode;
		}
		public void setIataCode(String iataCode) {
			this.iataCode = iataCode;
		}
		public String getTerminal() {
			return terminal;
		}
		public void setTerminal(String terminal) {
			this.terminal = terminal;
		}
		public String getAt() {
			return at;
		}
		public void setAt(String at) {
			this.at = at;
		}
    }
	@JsonIgnoreProperties(ignoreUnknown = true)
    public static class Arrival {
        private String iataCode;
        private String terminal;
        private String at;
        
		public String getIataCode() {
			return iataCode;
		}
		public void setIataCode(String iataCode) {
			this.iataCode = iataCode;
		}
		public String getTerminal() {
			return terminal;
		}
		public void setTerminal(String terminal) {
			this.terminal = terminal;
		}
		public String getAt() {
			return at;
		}
		public void setAt(String at) {
			this.at = at;
		}
    }
	@JsonIgnoreProperties(ignoreUnknown = true)
    public static class Aircraft {
        private String code;

		public String getCode() {
			return code;
		}
		public void setCode(String code) {
			this.code = code;
		}
    }
	@JsonIgnoreProperties(ignoreUnknown = true)
    public static class Price {
        private String currency; // 화폐단위
        private String total;  // 유저가 결제해야할 금액
        private String base;  // 세금을 제한 금액
        private String grandTotal;
        
		public String getCurrency() {
			return currency;
		}
		public void setCurrency(String currency) {
			this.currency = currency;
		}
		public String getTotal() {
			return total;
		}
		public void setTotal(String total) {
			this.total = total;
		}
		public String getBase() {
			return base;
		}
		public void setBase(String base) {
			this.base = base;
		}
		public String getGrandTotal() {
			return grandTotal;
		}
		public void setGrandTotal(String grandTotal) {
			this.grandTotal = grandTotal;
		}
    }
	@JsonIgnoreProperties(ignoreUnknown = true)
    public static class TravelerPricing {
        private String travelerId;  //여행객 id
        private String travelerType; // adult, children
        private Price price; 
        private List<FareDetailBySegment> fareDetailsBySegment;
        
		public String getTravelerId() {
			return travelerId;
		}
		public void setTravelerId(String travelerId) {
			this.travelerId = travelerId;
		}
		public String getTravelerType() {
			return travelerType;
		}
		public void setTravelerType(String travelerType) {
			this.travelerType = travelerType;
		}
		public Price getPrice() {
			return price;
		}
		public void setPrice(Price price) {
			this.price = price;
		}
		public List<FareDetailBySegment> getFareDetailsBySegment() {
			return fareDetailsBySegment;
		}
		public void setFareDetailsBySegment(List<FareDetailBySegment> fareDetailsBySegment) {
			this.fareDetailsBySegment = fareDetailsBySegment;
		}
    }
	@JsonIgnoreProperties(ignoreUnknown = true)
    public static class FareDetailBySegment {
        private String segmentId;
        private String cabin; // economy, business, first
        private IncludedCheckedBags includedCheckedBags;
        
		public String getSegmentId() {
			return segmentId;
		}
		public void setSegmentId(String segmentId) {
			this.segmentId = segmentId;
		}
		public String getCabin() {
			return cabin;
		}
		public void setCabin(String cabin) {
			this.cabin = cabin;
		}
		public IncludedCheckedBags getIncludedCheckedBags() {
			return includedCheckedBags;
		}
		public void setIncludedCheckedBags(IncludedCheckedBags includedCheckedBags) {
			this.includedCheckedBags = includedCheckedBags;
		}
    }
	@JsonIgnoreProperties(ignoreUnknown = true)
    public static class IncludedCheckedBags {
        private int quantity;
        private int weight;
        private String weightUnit = "KG"; 

		public int getQuantity() {
			return quantity;
		}
		public void setQuantity(int quantity) {
			this.quantity = quantity;
		}
		public int getWeight() {
			return weight;
		}
		public void setWeight(int weight) {
			this.weight = weight;
		}
		public String getWeightUnit() {
			return weightUnit;
		}
    }
}
