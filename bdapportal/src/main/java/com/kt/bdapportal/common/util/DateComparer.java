package com.kt.bdapportal.common.util;

import java.util.Date;

public class DateComparer  implements Comparable<DateComparer> {
	private Date dateTime;

	  public Date getDateTime() {
	    return dateTime;
	  }

	  public void setDateTime(Date datetime) {
	    this.dateTime = datetime;
	  }

	  @Override
	  public int compareTo(DateComparer o) {
	    return getDateTime().compareTo(o.getDateTime());
	  }
}
