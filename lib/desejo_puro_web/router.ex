defmodule DesejoPuroWeb.Router do
  use DesejoPuroWeb, :router

  pipeline :auth do
    plug(DesejoPuro.Auth.Pipeline)
  end

  pipeline :ensure_auth do
    plug(Guardian.Plug.EnsureAuthenticated)
  end

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", DesejoPuroWeb do
    # Use the default browser stack
    pipe_through([:browser, :auth])

    get("/", PageController, :index)
    get("/pilares", PageController, :pilares)

    get("/signout", AuthController, :signout)
    get("/signin", UserController, :new)

    get("/login", AuthController, :login)
    post("/login", AuthController, :login_action)

    scope "/bo" do
      resources("/pilares", PilarController)
      resources("/licoes", LicaoController)

      resources("/users", UserController)
    end
  end

  # Other scopes may use custom stacks.
  # scope "/api", DesejoPuroWeb do
  #   pipe_through :api
  # end
end
