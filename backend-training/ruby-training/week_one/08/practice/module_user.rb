# frozen_string_literal: true

module Users
  def self.from_organization
    client = Octokit::Client.new(access_token: '2ae584417782f0f4865a42d5da55915ea46a79d8')
    client.organizations.first.rels[:members].get.data
  end
end
