defmodule Storybook.Examples.FormDemo.Item do
  @moduledoc false
  use Ecto.Schema

  import Ecto.Changeset

  schema "items" do
    field :name, :string
    field :description, :string
    field :material, :string
    field :sellable, :boolean, default: false
  end

  def changeset(user, params \\ %{}) do
    user
    |> cast(params, [:name, :description, :material, :sellable])
    |> validate_required([:name, :description])
  end
end

defmodule Storybook.Examples.FormDemo do
  @moduledoc false
  use PhoenixStorybook.Story, :example

  import SaladUI.Badge
  import SaladUI.Button
  import SaladUI.Checkbox
  import SaladUI.Form
  import SaladUI.Input
  import SaladUI.Label
  import SaladUI.RadioGroup
  import SaladUI.Select
  import SaladUI.Textarea
  import SaladUI.Tooltip

  alias Storybook.Examples.FormDemo.Item

  def doc do
    "An example of convert React template for Shadcn ui to heex template using SaladUI."
  end

  @impl true
  def mount(_params, _session, socket) do
    form =
      %Item{}
      |> Item.changeset()
      |> to_form()

    {:ok, assign(socket, form: form, output: "")}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="grid h-screen w-full">
      <div class="flex flex-col">
        <main class="grid flex-1 gap-4 overflow-auto p-4 grid-cols-1 md:grid-cols-2">
          <div class="relative hidden flex-col items-start gap-8 md:flex">
            <.form :let={f} for={@form} phx-submit="create_item" class="grid w-full items-start gap-6">
              <.form_item>
                <.form_label error={not Enum.empty?(f[:name].errors)}>Item name</.form_label>
                <.input
                  field={f[:name]}
                  type="text"
                  class={error_class(f[:name])}
                  placeholder="saladui"
                />
                <.form_description>
                  This is your public display name.
                </.form_description>
                <.form_message field={f[:name]} />
              </.form_item>
              <.form_item>
                <.form_label error={not Enum.empty?(f[:description].errors)}>Description</.form_label>
                <.textarea
                  name={f[:description].name}
                  value={f[:description].value}
                  class={error_class(f[:description])}
                  placeholder="Your item description"
                />
                <.form_message field={f[:description]} />
              </.form_item>
              <.form_item>
                <.form_label error={not Enum.empty?(f[:material].errors)}>Material</.form_label>
                <.radio_group
                  :let={builder}
                  name={f[:material].name}
                  field={f[:material]}
                  default-value="wood"
                >
                  <div class="flex items-center space-x-2">
                    <.radio_group_item builder={builder} value="wood" id="option-one" />
                    <.label for="option-one">
                      Wood
                    </.label>
                  </div>
                  <div class="flex items-center space-x-2">
                    <.radio_group_item builder={builder} value="steel" id="option-two" />
                    <.label for="option-two">
                      Steel
                    </.label>
                  </div>
                  <div class="flex items-center space-x-2">
                    <.radio_group_item builder={builder} value="plastic" id="option-three" />
                    <.label for="option-three">
                      Plastic
                    </.label>
                  </div>
                </.radio_group>

                <.form_message field={f[:material]} />
              </.form_item>
              <.form_item>
                <div class="flex items-center space-x-2">
                  <.checkbox id="sellable" field={f[:sellable]} />
                  <.label for="sellable">sellable</.label>
                </div>
              </.form_item>

              <.button type="submit">Submit</.button>
            </.form>
          </div>
          <div class="p-8">
            <.label>Submitted data</.label>
            <pre class="p-4 bg-gray-50 mt-4 rounded"><%= @output %></pre>
          </div>
        </main>
      </div>
    </div>
    """
  end

  defp error_class(field) do
    if Enum.empty?(field.errors), do: "", else: "border-destructive text-destructive"
  end

  @impl true
  def handle_event("create_item", %{"item" => item_params} = params, socket) do
    case %Item{} |> Item.changeset(item_params) |> Ecto.Changeset.apply_action(:insert) do
      {:error, changeset} ->
        {:noreply, assign(socket, form: to_form(changeset), output: inspect(params, pretty: true, width: 0))}

      {:ok, _changeset} ->
        # save changeset
        {:noreply, assign(socket, :message, "Create item successfully")}
    end
  end
end
