class Gemifier < Thor
  include Thor::Actions
  GEMIFIER_PATH = File.expand_path(File.join(Dir.pwd,"..")) # one directory lower than this gemifier

  desc "create NAME <directory>", "create a new ruby gem"
  method_option :name, type: :string
  method_option :directory, type: :string, default: GEMIFIER_PATH
  def create
    directory = options[:directory]
    run("cd #{directory} && bundle gem #{options[:name]}")
    puts run("pwd")

  end
end