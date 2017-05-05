class Project
  attr_accessor :name, :id

  def initialize(attributes)
    @name = attributes[:name]
    @id = attributes[:id]
  end

  def Project.all
    projects = []
    returned_projects = DB.exec("SELECT * FROM projects;")
    returned_projects.each do |project|
      name = project['name']
      id = project.fetch('id').to_i
      projects.push(Project.new({:name => name, :id => id}))
    end
    projects
  end

  def save
    result = DB.exec("INSERT INTO projects (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first.fetch('id').to_i
  end

  def ==(another_project)
    self.name == another_project.name && self.id == another_project.id
  end

  def Project.find(id)
    found_project = nil
    Project.all.each do |project|
      if project.id == id
        found_project = project
      end
    end
    found_project
  end

  def update(attributes)
    @name = attributes[:name]
    DB.exec("UPDATE projects SET name = '#{@name}' WHERE id = #{self.id};")
  end

  def delete
    DB.exec("DELETE FROM projects WHERE id = #{self.id};")
    DB.exec("DELETE FROM volunteers WHERE project_id = #{self.id};")
  end

  def add_volunteer
    project_volunteers = []
    results = DB.exec("SELECT * FROM volunteers WHERE project_id = #{self.id};")
    results.each do |result|
      name = result.fetch('name')
      project_id = result.fetch('project_id').to_i
      id = result.fetch('id').to_i
      project_volunteers.push(Volunteer.new({:name => name, :project_id => project_id, :id => id}))
    end
    project_volunteers
  end

end
