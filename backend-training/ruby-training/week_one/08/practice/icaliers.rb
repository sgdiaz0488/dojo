# frozen_string_literal: true

class Icaliers
  FILE_PATH = 'users.csv'

  def self.export_users_csv
    users = Users.from_organization

    CSV.open('users.csv', 'w') do |csv|
      csv << %w[Login Avatar Url]
      users.each do |user|
        csv << [user.login, user.avatar_url, user.html_url]
      end
    end
  end

  def self.get_users_from_csv
    users_csv = CSV.foreach(FILE_PATH, headers: true)
    users = users_csv.map { |row| User.new(row) }

    icaliers = '<table>'

    users.each do |user|
      icaliers += '<tr>'
      icaliers += "<td><a href='#{user.url}'>#{user.login}</a></td>"
      icaliers += "<td><img src='#{user.avatar}' width=100 height=100/></td>"
      icaliers += '</tr>'
    end

    icaliers += '</table>'

    icaliers
  end
end
