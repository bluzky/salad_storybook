defmodule Storybook.SaladUIComponents.AlertDialog do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias SaladUI.AlertDialog

  def function, do: &AlertDialog.alert_dialog/1

  def imports,
    do: [
      {SaladUI.AlertDialog,
       [
         alert_dialog_trigger: 1,
         alert_dialog_header: 1,
         alert_dialog_title: 1,
         alert_dialog_description: 1,
         alert_dialog_footer: 1,
         alert_dialog_cancel: 1,
         alert_dialog_action: 1,
         alert_dialog_content: 1,
         hide_alert_dialog: 1
       ]},
      {SaladUI.Button, [button: 1]}
    ]

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{id: "alert-dialog-single-popover"},
        let: :builder,
        slots: [
          """
          <.alert_dialog_trigger builder={builder}>
           <.button variant="outline">Show dialog</.button>
          </.alert_dialog_trigger>
          <.alert_dialog_content builder={builder}>
           <.alert_dialog_header>
             <.alert_dialog_title>Are you absolutely sure?</.alert_dialog_title>
             <.alert_dialog_description>
               this action cannot be undone. this will permanently delete your
               account and remove your data from our servers.
             </.alert_dialog_description>
           </.alert_dialog_header>
           <.alert_dialog_footer>
             <.alert_dialog_cancel builder={builder}>Cancel</.alert_dialog_cancel>
             <.alert_dialog_action phx-click={hide_alert_dialog(builder) |> JS.push("welcome")}>Continue</.alert_dialog_action>
           </.alert_dialog_footer>
          </.alert_dialog_content>
          """
        ]
      }
    ]
  end
end
