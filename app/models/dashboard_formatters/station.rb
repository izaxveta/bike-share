module StationDashboardFormatter

  def dashboard_data
    most_docks = maximum(:dock_count)
    least_docks = minimum(:dock_count)
    {
      total: count,
      average_docks: average(:dock_count).round,
      most_docks: most_docks,
      least_docks: least_docks,
      with_most_docks: where(dock_count: most_docks).names,
      with_least_docks: where(dock_count: least_docks).names,
      newest: where(installation_date: maximum(:installation_date)).names,
      oldest: where(installation_date: minimum(:installation_date)).names,
    }
  end

  def names
    all.map(&:name).join(', ')
  end

end
