module ApplicationHelper

  def nicetime(t)
    return "–" if t.nil?
    d = Time.new - t
    if d > 0 && d < 60
      t("helpers.nicetime.seconds_ago", seconds: d.to_i)
    elsif d > 0 && d < 3600
      t("helpers.nicetime.minutes_ago", minutes: (d/60).to_i)
    else
      I18n.l(t)
    end
  end

  def pager(path_name=nil)
    if !path_name
      path_name = "#{controller_name}_path"
    end
    render('pager',
      path_name: path_name,
    )
  end
end
