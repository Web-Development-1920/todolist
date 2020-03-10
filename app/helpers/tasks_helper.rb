module TasksHelper
  def priority_select(data)
    case data
    when 1
      "High"
    when 2
      "Medium"
    when 3
      "Low"
    end
  end

  def done_check(data)
    if data
      "Yes"
    else
      "No"
    end
  end
end
