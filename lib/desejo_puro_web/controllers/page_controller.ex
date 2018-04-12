defmodule DesejoPuroWeb.PageController do
  use DesejoPuroWeb, :controller
  alias DesejoPuro.Pilares

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def pilares(conn, _params) do
    pilares = Pilares.list_pilares()
    render(conn, "pilares.html", pilares: pilares)
  end
end
