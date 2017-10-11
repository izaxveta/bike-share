module StationDashboardFormatter

  def dashboard_data
    most_docks = maximum(:dock_count)
    least_docks = minimum(:dock_count)
    {
      most_docks: most_docks,
      least_docks: least_docks,
      with_most_docks: where(dock_count: most_docks),
      with_least_docks: where(dock_count: least_docks),
      average_docks: average(:dock_count).round,
      newest: where(installation_date: maximum(:installation_date)),
      oldest: where(installation_date: minimum(:installation_date))
    }
  end

end
