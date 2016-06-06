module Listable
  def format_description(description)
    "#{description}".ljust(30)
  end

  def format_priority
    value = " â§".colorize(:red) if priority == "high"
    value = " â¨".colorize(:yellow) if priority == "medium"
    value = " â©".colorize(:green) if priority == "low"
    value = "" if !priority
    return value
  end

  def format_date(options={})
    if options[:due] != nil
      return Chronic.parse(options[:due]).strftime("%D").to_s
    elsif options[:start_date] || options[:end_date]
      dates = Chronic.parse(options[:start_date]).strftime("%D").to_s if options[:start_date]
      dates << " -- " + Chronic.parse(options[:end_date]).strftime("%D").to_s if options[:end_date]
      return dates
    else
      return "No due date"
    end
  end

  def format_name
    @site_name ? @site_name : ""
  end
end
