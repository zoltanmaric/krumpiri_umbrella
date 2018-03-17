defmodule KrumpiriWeb.ReadingsController do
  use KrumpiriWeb, :controller

  alias Krumpiri.ReadingQueries

  def submit(conn, reading) do
    IO.write("received json: ")
    IO.inspect(reading)

    ReadingQueries.insert(reading)

    json(conn, "")
  end


end
