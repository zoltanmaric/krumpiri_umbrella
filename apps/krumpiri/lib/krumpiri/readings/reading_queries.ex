defmodule Krumpiri.ReadingQueries do

  def insert_test_reading do
    {:ok, conn} = Xandra.start_link(after_connect: &Xandra.execute(&1, "USE Krumpiri"))
    statement = "INSERT INTO readings (id, net_in_wh, read_time, signature, username) VALUES (uuid(), 13, '2017-01-01 12:00:00', 'signature', 'username')"
    {:ok, %Xandra.Void{}} = Xandra.execute(conn, statement, _params = [])
  end

  def insert(reading) do
    {:ok, conn} = Xandra.start_link(after_connect: &Xandra.execute(&1, "USE Krumpiri"))

    query = "INSERT INTO readings (id, net_in_wh, read_time, signature, username)
      VALUES (uuid(), :net_in_wh, :read_time, :signature, :username)"
    prepared = Xandra.prepare!(conn, query)

    params = %{
      "net_in_wh" => reading["net_in_wh"],
      "read_time" => reading["read_time"],
      "signature" => reading["signature"],
      "username" => reading["username"]
    }

    Xandra.execute!(conn, prepared, params)
  end
end