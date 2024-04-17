require 'git'

class MyGit
  @param1 = ENV['PARAM1'] # Define as class variable

  def self.param1
    @param1
  end
  def self.git_last_merged_issues(git_path, pattern)
    print("param1: #{param1}\n")
    g = Git.open(git_path)
    latest_release_tag = "3.7.0"
    tasks_list = g.log(200).between(latest_release_tag, "HEAD").count
    print(tasks_list)
  end

end

class MyPipeline
  @release_tag_pattern = "[0-9]*.[0-9]*.[0-9]*"

  def self.release_run(git_path)
    MyGit.git_last_merged_issues(git_path, @release_tag_pattern)
  end
end


MyPipeline.release_run(Dir.pwd)
