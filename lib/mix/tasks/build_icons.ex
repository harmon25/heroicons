defmodule Mix.Tasks.BuildIcons do
  use Mix.Task

  require EEx
  EEx.function_from_file(:defp, :render_icon, "./priv/templates/render_fn.ex.eex", [:name, :svg])

  EEx.function_from_file(:defp, :render_module, "./priv/templates/module.ex.eex", [
    :module_name,
    :all_names,
    :all_render_functions,
    :docs
  ])

  @tmp "./tmp"
  @icon_root "#{@tmp}/icons"

  @shortdoc "Builds icons from src"
  def run(_) do
    types = File.ls!(@icon_root)

    Enum.map(types, &create_output/1)
    |> Enum.each(&handle_type/1)

    File.rm_rf("./lib/heroicons")
    File.mkdir!("./lib/heroicons")

    File.rename!("#{@tmp}/outline.ex.2.txt", "./lib/heroicons/outline.ex")
    File.rename!("#{@tmp}/solid.ex.2.txt", "./lib/heroicons/solid.ex")

    File.rm_rf!(@tmp)
  end

  defp handle_type({type, outfile}) do
    type_path = Path.join([@icon_root, type])

    all_icons = File.ls!(type_path)

    all_names =
      Enum.map(all_icons, fn icon_filename ->
        name = Path.rootname(icon_filename)

        svg =
          Path.join([@icon_root, type, icon_filename])
          |> File.read!()
          |> String.trim()
          |> String.replace("\n", "")
          |> add_extra()

        iconstr = render_icon(name, svg)

        IO.write(outfile, iconstr <> "\n")

        name
      end)

    File.close(outfile)

    module_out = File.open!("#{@tmp}/#{type}.ex.2.txt", [:write, :utf8])
    module_name = gen_module_name(type)
    mod_docs = gen_docs(type)

    all_fns = File.read!("#{@tmp}/#{type}.ex.1.txt")
    renderd_mod = render_module(module_name, Enum.join(all_names, " "), all_fns, mod_docs)

    IO.write(module_out, renderd_mod)
    File.close(module_out)
  end

  defp create_output(type), do: {type, File.open!("#{@tmp}/#{type}.ex.1.txt", [:write, :utf8])}

  defp gen_module_name("outline") do
    "Heroicons.Outline"
  end

  defp gen_module_name("solid") do
    "Heroicons.Solid"
  end

  defp gen_docs("outline") do
    """
     For primary navigation and marketing sections, designed to be rendered at 24x24.
    """
  end

  defp gen_docs("solid") do
    """
    For buttons, form elements, and to support text, designed to be rendered at 20x20.
    """
  end

  defp add_extra(svg_string) do
    String.replace(svg_string, "<svg xmlns=", "<svg class={{@class}} :attrs={{@opts}} xmlns=",
      global: false
    )
  end
end
