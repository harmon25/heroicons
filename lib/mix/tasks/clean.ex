defmodule Mix.Tasks.Cleanup do
  use Mix.Task

  @tmp "./tmp"
  @shortdoc "Cleans up tmp dir.."
  def run(_) do
    # calling our Hello.say() function from earlier

    File.rm_rf!(@tmp)
    File.mkdir!(@tmp)
  end
end
