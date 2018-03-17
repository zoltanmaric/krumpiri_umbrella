defmodule KrumpiriWeb.ReadingsController do
  use KrumpiriWeb, :controller

  alias Krumpiri.ReadingQueries

  def submit(conn, reading) do
    IO.write("received json: ")
    IO.inspect(reading)

    {:ok, parsed_read_time, _offset} = DateTime.from_iso8601(reading["read_time"])

    reading
    |> Map.put("read_time", parsed_read_time)
    |> ReadingQueries.insert

    json(conn, "")
  end


end
