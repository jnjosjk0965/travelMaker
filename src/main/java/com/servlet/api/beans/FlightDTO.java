package com.servlet.api.beans;

public class FlightDTO {
	private String flightId; // yymmdd + airlinecode + 3digit x 2
    private int flightPrice;
    
    private String outboundFlightNo;
    private String outboundSeatClass;
    private String outboundAirline;
    private String outboundDuration;
    private String outboundDepartureTime;
    private String outboundDepartureAirport;
    private String outboundArrivalTime;
    private String outboundArrivalAirport;
    
    private String returnFlightNo;
    private String returnSeatClass;
    private String returnAirline;
    private String returnDuration;
    private String returnDepartureTime;
    private String returnDepartureAirport;
    private String returnArrivalTime;
    private String returnArrivalAirport;
    
    public FlightDTO() { }

	public String getFlightId() {
		return flightId;
	}
	public void setFlightId(String flightId) {
		this.flightId = flightId;
	}
	public int getFlightPrice() {
		return flightPrice;
	}
	public void setFlightPrice(int flightPrice) {
		this.flightPrice = flightPrice;
	}
	public String getOutboundSeatClass() {
		return outboundSeatClass;
	}
	public void setOutboundSeatClass(String outboundSeatClass) {
		this.outboundSeatClass = outboundSeatClass;
	}
	public String getOutboundAirline() {
		return outboundAirline;
	}
	public void setOutboundAirline(String outboundAirline) {
		this.outboundAirline = outboundAirline;
	}
	public String getOutboundDuration() {
		return outboundDuration;
	}
	public void setOutboundDuration(String outboundDuration) {
		this.outboundDuration = outboundDuration;
	}
	public String getOutboundDepartureTime() {
		return outboundDepartureTime;
	}
	public void setOutboundDepartureTime(String outboundDepartureTime) {
		this.outboundDepartureTime = outboundDepartureTime;
	}
	public String getOutboundDepartureAirport() {
		return outboundDepartureAirport;
	}
	public void setOutboundDepartureAirport(String outboundDepartureAirport) {
		this.outboundDepartureAirport = outboundDepartureAirport;
	}
	public String getOutboundArrivalTime() {
		return outboundArrivalTime;
	}
	public void setOutboundArrivalTime(String outboundArrivalTime) {
		this.outboundArrivalTime = outboundArrivalTime;
	}
	public String getOutboundArrivalAirport() {
		return outboundArrivalAirport;
	}
	public void setOutboundArrivalAirport(String outboundArrivalAirport) {
		this.outboundArrivalAirport = outboundArrivalAirport;
	}
	public String getReturnSeatClass() {
		return returnSeatClass;
	}
	public void setReturnSeatClass(String returnSeatClass) {
		this.returnSeatClass = returnSeatClass;
	}
	public String getReturnAirline() {
		return returnAirline;
	}
	public void setReturnAirline(String returnAirline) {
		this.returnAirline = returnAirline;
	}
	public String getReturnDuration() {
		return returnDuration;
	}
	public void setReturnDuration(String returnDuration) {
		this.returnDuration = returnDuration;
	}
	public String getReturnDepartureTime() {
		return returnDepartureTime;
	}
	public void setReturnDepartureTime(String returnDepartureTime) {
		this.returnDepartureTime = returnDepartureTime;
	}
	public String getReturnDepartureAirport() {
		return returnDepartureAirport;
	}
	public void setReturnDepartureAirport(String returnDepartureAirport) {
		this.returnDepartureAirport = returnDepartureAirport;
	}
	public String getReturnArrivalTime() {
		return returnArrivalTime;
	}
	public void setReturnArrivalTime(String returnArrivalTime) {
		this.returnArrivalTime = returnArrivalTime;
	}
	public String getReturnArrivalAirport() {
		return returnArrivalAirport;
	}
	public void setReturnArrivalAirport(String returnArrivalAirport) {
		this.returnArrivalAirport = returnArrivalAirport;
	}
	public String getOutboundFlightNo() {
		return outboundFlightNo;
	}
	public void setOutboundFlightNo(String outboundFlightNo) {
		this.outboundFlightNo = outboundFlightNo;
	}
	public String getReturnFlightNo() {
		return returnFlightNo;
	}
	public void setReturnFlightNo(String returnFlightNo) {
		this.returnFlightNo = returnFlightNo;
	}
    public String getQueryString() {
    	return "?flightId=" + flightId
    			+ "&flightPrice=" + flightPrice
    			+ "&outboundFlightNo=" + outboundFlightNo
    			+ "&outboundSeatClass=" + outboundSeatClass
    			+ "&outboundAirline=" + outboundAirline
    			+ "&outboundDuration=" + outboundDuration
    			+ "&outboundDepartureTime=" + outboundDepartureTime
    			+ "&outboundDepartureAirport=" + outboundDepartureAirport
    			+ "&outboundArrivalTime=" + outboundArrivalTime
    			+ "&outboundArrivalAirport=" + outboundArrivalAirport
    			+ "&returnFlightNo=" + returnFlightNo
    			+ "&returnSeatClass=" + returnSeatClass
    			+ "&returnAirline=" + returnAirline
    			+ "&returnDuration=" + returnDuration
    			+ "&returnDepartureTime=" + returnDepartureTime
    			+ "&returnDepartureAirport=" + returnDepartureAirport
    			+ "&returnArrivalTime=" + returnArrivalTime
    			+ "&returnArrivalAirport=" + returnArrivalAirport;
    }
}
