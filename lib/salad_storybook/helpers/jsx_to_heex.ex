defmodule SaladStorybook.Helpers.JsxToHeex do
  @moduledoc false

  def convert(jsx) do
    case Floki.parse_fragment(jsx) do
      {:ok, ast} ->
        {:ok, ast |> Floki.traverse_and_update(&convert_tag/1) |> Floki.raw_html()}

      {:error, _} ->
        {:error, "Bad JSX syntax"}
    end
  end

  defp convert_tag({tag, attrs, children}) do
    tag = map_tag(tag)
    attrs = map_attr(attrs)
    children = Enum.map(children, &convert_tag/1)

    {tag, attrs, children}
  end

  # string content
  defp convert_tag(tag) do
    tag
  end

  @explicit_tag_mapping Map.new(
                          [
                            "link",
                            "badge",
                            "input",
                            "sheet",
                            "sheet_content",
                            "sheet_trigger",
                            "button",
                            "breadcrumb",
                            "breadcrumb_item",
                            "breadcrumb_link",
                            "breadcrumb_list",
                            "breadcrumb_page",
                            "breadcrumb_separator",
                            "card",
                            "card_content",
                            "card_description",
                            "card_footer",
                            "card_header",
                            "card_title",
                            "dropdown_menu",
                            "dropdown_menu_content",
                            "dropdown_menu_item",
                            "dropdown_menu_label",
                            "dropdown_menu_separator",
                            "dropdown_menu_trigger",
                            "table",
                            "table_body",
                            "table_cell",
                            "table_head",
                            "table_header",
                            "table_row",
                            "tabs",
                            "tabs_content",
                            "tabs_list",
                            "tabs_trigger",
                            "tooltip",
                            "tooltip_content",
                            "tooltip_trigger"
                          ],
                          &{String.replace(&1, "_", ""), ".#{&1}"}
                        )

  defp map_tag(tag) do
    case @explicit_tag_mapping[tag] do
      nil -> tag
      new_tag -> new_tag
    end
  end

  defp map_attr(attrs) when is_list(attrs) do
    attrs
    |> Enum.map(&map_attr/1)
    |> Enum.reject(&is_nil/1)
  end

  defp map_attr({key, value}) do
    case key do
      "classname" -> {"class", value}
      "htmlfor" -> {"for", value}
      "aschild" -> nil
      _ -> {key, value}
    end
  end
end
