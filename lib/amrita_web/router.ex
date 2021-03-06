defmodule AmritaWeb.Router do
  use AmritaWeb, :router
  import Phoenix.LiveView.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug Phoenix.LiveView.Flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", AmritaWeb do
    pipe_through :browser

    get "/", PageController, :index
    live "/search", Search, session: [:user_id]
    live "/notes/:id", Note
  end

  # Other scopes may use custom stacks.
  # scope "/api", AmritaWeb do
  #   pipe_through :api
  # end
end
