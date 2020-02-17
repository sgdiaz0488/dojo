# frozen_string_literal: true

## Create a shuffler project assignator to assign developers that work at Icalia to projects
## 1. Every developer must team with two other members
## 2. Every developer has more or less the same amount of projects
## 3. Build as many classes you think you will need
## 4. Refactor every time you can
## 5. The code at the bottom must run without change
## Hint: http://ruby-doc.org/core-2.2.0/Array.html#method-i-sort

TEAM_MEMBERS = %w[Walter Kevin Cejas Vov Lentes Scarlett Jesus Cesar Julian Luis].freeze
PROJECTS = %w[Okudoc Datoz RTS Foresight Whales EstoyBien Sostener StropInsights TKING Vamonos].freeze

## Your code starts here
class Shuffler
  # Devuelve un listado de miembros usando los nombres de TEAM_MEMBERS
  def members
    team = []

    TEAM_MEMBERS.each do |item|
      # Genera un nuevo miembro
      member = Member.new(item)

      # Añade el miembro al equipo
      team << member
    end

    team
  end

  # Crea un equipo con una cantidad dada de persona y usando una lista como base
  def make_team_with(amount, list)
    team = []

    while team.size < amount
      # Selecciona un miembro aleatoriamente
      index = rand(list.size)
      member = list[index]

      # Añade el miembro al equipo
      team << member

      # Valida que no se repita
      team.uniq!
    end

    team
  end

  # Asigna miembros a los proyectos
  def assign_projects
    # Crea el equipo con 3 miembros
    team = make_team_with(3, members)

    PROJECTS.each do |item|
      # Genera un nuevo proyecto
      project = Project.new(item)

      # Define el líder del proyecto
      project.lead = team.first
    end
  end
end

# Clase para construir un Miembro
class Member
  attr_reader :name
  attr_reader :role

  def initialize(name)
    @name = name
    @role = 'developer'
  end
end

# Clase para construir un Proyecto
class Project
  attr_reader :name
  attr_accessor :lead
  attr_accessor :members

  def initialize(name)
    @name = name
  end
end

## Your code ends here

shuffler = Shuffler.new

shuffler.assign_projects

shuffler.members.each do |member|
  puts "###Projects of #{member.name} ###"
  member.projects.each do |project|
    puts "== #{project.name} =="
    puts "Lead name: #{project.lead.name}"
    puts 'Members: '
    project.members.each do |member|
      puts "#{member.name} with #{member.role} role"
    end
  end
end
