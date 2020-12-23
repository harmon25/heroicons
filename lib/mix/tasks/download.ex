defmodule Mix.Tasks.Download do
  use Mix.Task

  @latest_version "v0.4.1"
  @filename "#{@latest_version}.zip"
  @downloadurl "https://github.com/tailwindlabs/heroicons/archive/#{@filename}"

  @tmp "./tmp"
  @shortdoc "Downloads and unzips latest heroicons archive"
  def run(_) do
    File.mkdir!(@tmp)
    save_as = "#{@tmp}/icons.zip"

    download(save_as)
    unzip(save_as)
  end

  defp download(file_name) do
    System.cmd("wget", [@downloadurl, "-O", file_name])
  end

  defp unzip(file_name) do
    System.cmd("unzip", [file_name, "heroicons-0.4.1/optimized/*", "-d", @tmp])
    File.cp_r!("#{@tmp}/heroicons-0.4.1/optimized", "#{@tmp}/icons")
    File.rm_rf!("#{@tmp}/heroicons-0.4.1")
    File.rm!(file_name)
  end
end
