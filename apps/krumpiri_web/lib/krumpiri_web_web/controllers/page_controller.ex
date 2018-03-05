defmodule KrumpiriWebWeb.PageController do
  use KrumpiriWebWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
