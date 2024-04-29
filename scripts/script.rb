require 'git'
require 'active_support'
require 'active_support/core_ext'
require 'set'

class MyGit
  def self.git_last_merged_issues(git_path, start)
    g = Git.open(git_path)
    g.fetch
    current_branch = g.current_branch
    puts "Current branch: #{current_branch}"
    tasks_list = []
    g.log(500).between(start, "HEAD").each do |commit|
      tasks_list.push(commit)
    end
    print(tasks_list.count)
    tasks_list.each do |ticket_number|
      puts ticket_number
    end
    tasks_list
  end

end

class MyPipeline
  @previous_branch = ENV['previous_release_branch']
  def self.release_run(git_path)
    MyGit.git_last_merged_issues(git_path, @previous_branch)
  end
end

MyPipeline.release_run(Dir.pwd)
