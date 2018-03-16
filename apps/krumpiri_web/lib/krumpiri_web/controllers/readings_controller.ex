defmodule KrumpiriWeb.ReadingsController do
  use KrumpiriWeb, :controller

  def submit(conn, %{"_json" => json}) do
    IO.puts("json: #{json}")
    json(conn, "")
  end

  def submit(conn, params) do
    IO.puts("params")
    IO.inspect(params)
    json(conn, "")
  end


end
