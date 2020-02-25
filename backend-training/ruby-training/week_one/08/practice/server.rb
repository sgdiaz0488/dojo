# frozen_string_literal: true

# Make a blog web app
# 1. Import all the icaliers on startup
#
# * Put all your ruby class in models
# * Only declare and run your app in this file

require 'csv'
require 'erb'
require 'rack'
require 'octokit'
require 'github/markup'
require_relative 'user'
require_relative 'icaliers'
require_relative 'module_user'

# Your code starts here

class Page
  def render
    ERB.new(File.read('./views/icaliers.erb')).result(binding)
  end

  def content
    render do
      Icaliers.get_users_from_csv
    end
  end
end

webapp = lambda { |_env|
  ['200', { 'Content-Type' => 'text/html' }, [Page.new.content]]
}

# Icaliers.export_users_csv

# Rack::Handler::WEBrick
# Webrick Server
Rack::Handler::WEBrick.run webapp

# Users.from_organization.inspect
# Your code ends here
