defmodule GraniteWeb.Router do
  use GraniteWeb, :router

  @csp "default-src 'self'; script-src 'self' 'unsafe-inline' 'unsafe-eval'; style-src 'self' 'unsafe-inline' 'unsafe-eval'"

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_layout, {GraniteWeb.LayoutView, "root.html"}
    plug :protect_from_forgery
    plug :put_secure_browser_headers, %{"content-security-policy" => @csp}
  end

  scope "/", GraniteWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/privacy", PageController, :privacy
  end
end
