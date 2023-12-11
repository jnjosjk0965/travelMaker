package common;

import java.time.Duration;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class DurationParser {
	// ISO8601 PnYnMnDTnHnMnS 를 변환
    public static Duration parseDuration(String durationString) {
        Pattern durationPattern = Pattern.compile("P(?:([0-9]+)Y)?(?:([0-9]+)M)?(?:([0-9]+)D)?(?:T(?:([0-9]+)H)?(?:([0-9]+)M)?(?:([0-9]+)S)?)?");
        Matcher matcher = durationPattern.matcher(durationString);

        if (!matcher.matches()) {
            throw new IllegalArgumentException("Invalid ISO 8601 duration format");
        }

        long days = parseLongOrZero(matcher.group(3));
        long hours = parseLongOrZero(matcher.group(4));
        long minutes = parseLongOrZero(matcher.group(5));
        long seconds = parseLongOrZero(matcher.group(6));

        return Duration.ofDays(days).plusHours(hours).plusMinutes(minutes).plusSeconds(seconds);
    }

    public static String formatDuration(Duration duration) {
        long hours = duration.toHours();
        long minutes = duration.toMinutesPart();

        StringBuilder formattedDuration = new StringBuilder();

        if (hours > 0) {
            formattedDuration.append(hours).append("시간");
        }

        if (minutes > 0) {
            formattedDuration.append(minutes).append("분");
        }

        return formattedDuration.toString().isEmpty() ? "0분" : formattedDuration.toString();
    }

    private static long parseLongOrZero(String value) {
        return value != null ? Long.parseLong(value) : 0;
    }
}
