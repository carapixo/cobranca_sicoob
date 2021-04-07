defmodule CobrancaSicoobWeb.PageController do
  use CobrancaSicoobWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
