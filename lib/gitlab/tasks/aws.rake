require_relative '../aws_helper.rb'
require_relative '../build/info.rb'
require_relative '../build/check.rb'
require 'omnibus'

namespace :aws do
  desc "Perform operations related to AWS AMI"
  task :process do
    if Build::Check.add_latest_tag?
      AWSHelper.new(Omnibus::BuildVersion.semver, Build::Info.edition).process
    end
  end
end
