class Volunteer
  attr_accessor :name, :id, :project_id

  def initialize(attributes)
    @name = attributes[:name]
    @id = attributes[:id]
    @project_id = attributes[:project_id]
  end

  def Volunteer.all
    volunteers = []
    returned_volunteers = DB.exec("SELECT * FROM volunteers;")
    returned_volunteers.each do |volunteer|
      name = volunteer['name']
      id = volunteer.fetch('id').to_i
      project_id = volunteer.fetch('project_id').to_i
      volunteers.push(Volunteer.new({:name => name, :id => id, :project_id => project_id}))
    end
    volunteers
  end

  def save
    result = DB.exec("INSERT INTO volunteers (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first.fetch('id').to_i
  end
end
