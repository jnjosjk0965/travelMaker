package com.servlet.api.beans;

import com.fasterxml.jackson.annotation.JsonIgnore;


import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

import common.DurationParser;

import java.text.NumberFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Locale;

@JsonIgnoreProperties(ignoreUnknown = true)
public class FlightOffer {
	@JsonProperty("meta")
    private FlightMeta meta;
	@JsonProperty("data")
    private List<FlightData> data;
	@JsonIgnore
	private static NumberFormat numFormatter = NumberFormat.getNumberInstance(Locale.getDefault());
	@JsonIgnore
	private static DateTimeFormatter toTimeFormatter = DateTimeFormatter.ofPattern("a h:mm",Locale.getDefault());
	@JsonIgnore
	private static DateTimeFormatter toDateFormatter = DateTimeFormatter.ofPattern("yyMMdd");
	

    public FlightMeta getFlightMeta() {
		return meta;
	}
	public void setFlightMeta(FlightMeta meta) {
		this.meta = meta;
	}
	public List<FlightData> getFlightData() {
		return data;
	}
	public void setFlightData(List<FlightData> data) {
		this.data = data;
	}
	public FlightDTO getCheapestFlight(String travelClass) {
        if (data == null || data.isEmpty()) {
            // Handle the case where the data list is empty
        	System.out.println("getCheapestFlight::no data");
            return null;
        }
        
        // Initialize variables to store the minimum price and corresponding flight ID
        double minPrice = Double.MAX_VALUE;
        FlightData cheapestFlight = null;

        // Iterate through the FlightData list
        for (FlightData flightData : data) {
            if (flightData.getPrice() != null && flightData.getPrice().getTotal() != null) {
                // Parse the price as a double
                double currentPrice = Double.parseDouble(flightData.getPrice().getTotal());
                // Update the minimum price and corresponding flight ID if the current price is lower
                if (currentPrice < minPrice) {
                    minPrice = currentPrice;
                    cheapestFlight = flightData;
                }
            }
        }
        
        return cheapestFlight.getFlightDTO(travelClass);
    }
	// Inner classes for nested structures

    public static class FlightMeta {
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
    public static class FlightData {
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
		public FlightDTO getFlightDTO(String travelClass) {
			FlightDTO result = new FlightDTO();
	        result.setFlightPrice(Integer.parseInt(this.getTravelerPricings().get(0).getPrice().getTotal().split("\\.")[0]));
	        String outNumber = this.getItineraries().get(0).getSegments().get(0).getNumber();
	        String retNumber = this.getItineraries().get(1).getSegments().get(0).getNumber();
	        
	        result.setOutboundAirline(this.getItineraries().get(0).getSegments().get(0).getCarrierCode());
	        result.setOutboundSeatClass(travelClass);
	        result.setOutboundFlightNo(this.getItineraries().get(0).getSegments().get(0).getCarrierCode() + outNumber);
	        result.setOutboundDuration(this.getItineraries().get(0).getDuration());
	        result.setOutboundDepartureTime(this.getItineraries().get(0).getSegments().get(0).getDeparture().getAt());
	        result.setOutboundDepartureAirport(this.getItineraries().get(0).getSegments().get(0).getDeparture().getIataCode());
	        result.setOutboundArrivalTime(this.getItineraries().get(0).getSegments().get(0).getArrival().getAt());
	        result.setOutboundArrivalAirport(this.getItineraries().get(0).getSegments().get(0).getArrival().getIataCode());

	        result.setReturnAirline(this.getItineraries().get(1).getSegments().get(0).getCarrierCode());
	        result.setReturnSeatClass(travelClass);
	        result.setReturnFlightNo(this.getItineraries().get(1).getSegments().get(0).getCarrierCode() + retNumber);
	        result.setReturnDuration(this.getItineraries().get(1).getDuration());
	        result.setReturnDepartureTime(this.getItineraries().get(1).getSegments().get(0).getDeparture().getAt());
	        result.setReturnDepartureAirport(this.getItineraries().get(1).getSegments().get(0).getDeparture().getIataCode());
	        result.setReturnArrivalTime(this.getItineraries().get(1).getSegments().get(0).getArrival().getAt());
	        result.setReturnArrivalAirport(this.getItineraries().get(1).getSegments().get(0).getArrival().getIataCode());
	        
	        result.setFlightId(this.getItineraries().get(0).getSegments().get(0).getDeparture().getDate() + result.getOutboundFlightNo() +
	        					this.getItineraries().get(1).getSegments().get(0).getDeparture().getDate() + result.getReturnFlightNo());
	        return result;
		}
    }
	@JsonIgnoreProperties(ignoreUnknown = true)
    public static class Itinerary {
		private String duration;
        private List<Segment> segments;
        
		public String getDuration() {
			return DurationParser.formatDuration(DurationParser.parseDuration(duration));
		}
		public void setDuration(String duration) {
			this.duration = duration;
		}
		public List<Segment> getSegments() {
			return segments;
		}
		public void setSegments(List<Segment> segments) {
			this.segments = segments;
		}
		@Override
		public String toString() {
			return "Itinerary [duration=" + duration + ", segments=" + segments + "]";
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
		@Override
		public String toString() {
			return "Segment [id=" + id + ", departure=" + departure + ", arrival=" + arrival + ", carrierCode="
					+ carrierCode + ", number=" + number + ", aircraft=" + aircraft + "]";
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
			return LocalDateTime.parse(at).format(toTimeFormatter);
		}
		public String getDate() {
			return LocalDateTime.parse(at).format(toDateFormatter);
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
			return LocalDateTime.parse(at).format(toTimeFormatter);
		}
		public String getDate() {
			return LocalDateTime.parse(at).format(toDateFormatter);
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
		public String getFormatTotal() {
			String[]temp = total.split("\\.");
			if(temp.length == 0)
				return numFormatter.format(Integer.parseInt(total)); 
			else
				return numFormatter.format(Integer.parseInt(temp[0]));
		}
		public String getTotal() {
			return total;
		}
		public void setTotal(String total) {
			this.total = total;
		}
		public String getFormatBase() {
			String[]temp = base.split("\\.");
			if(temp.length == 0)
				return numFormatter.format(Integer.parseInt(base)); 
			else
				return numFormatter.format(Integer.parseInt(temp[0]));
		}
		public String getBase() {
			return base;
		}
		public void setBase(String base) {
			this.base = base;
		}
		public String getFormatGrandTotal() {
			String[]temp = grandTotal.split("\\.");
			if(temp.length == 0)
				return numFormatter.format(Integer.parseInt(grandTotal)); 
			else
				return numFormatter.format(Integer.parseInt(temp[0]));
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
