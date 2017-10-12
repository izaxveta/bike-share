module Route

  def self.[](*part_names)
    content = part_names.map(&parts).join
    /#{content}/
  end

  def self.parts
    {
      trip: '\/(trip).*',
      model: '\/(station|trip|condition).*',
      dashboard: '-dashboard',
      new: '\/new',
      edit: '\/edit',
      id: '\/(\d+)'
    }
  end
end

# Route[:model]
# => ^\/station$
# => /station

# Route[:model, :new]
# => ^\/station\/new$
# => /station/new

# Route[:model, :id]
# => ^\/station\/\d+$
# => /station/23

# Route[:model, :id, :edit]
# => ^\/station\/\d+\/edit$
# => /station/23

# Route[:model, :dashboard]
# => ^\/station-dashboard$
# => /station-dashboard
