defmodule EmailWeb.EmailView do
  use EmailWeb, :view
  import EmailWeb.LayoutView, only: [plausible_url: 0, ee?: 0, ce?: 0], warn: false

  def greet_recipient(%{user: %{name: name}}) when is_binary(name) do
    "Hey #{String.split(name) |> List.first()},"
  end

  def greet_recipient(_), do: "Hey,"

  def date_format(date) do
    Calendar.strftime(date, "%-d %b %Y")
  end
end
