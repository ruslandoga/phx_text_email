defmodule EmailWeb.LayoutView do
  use EmailWeb, :view

  def plausible_url do
    EmailWeb.Endpoint.url()
  end

  def ee?, do: true
  def ce?, do: not ee?()
end
