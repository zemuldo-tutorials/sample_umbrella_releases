defmodule SampleUmbrellaReleases.MixProject do
  use Mix.Project

  def project do
    [
      apps_path: "apps",
      version: "0.1.0",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      releases: [
        app_1_only: [
          applications: [
            app_1: :permanent
          ]
        ],
        app_2_only: [
          applications: [
            app_2: :permanent
          ]
        ],
        all_apps: [
          applications: [
            app_1: :permanent,
            app_2: :permanent
          ]
        ]
      ]
    ]
  end

  # Dependencies listed here are available only for this
  # project and cannot be accessed from applications inside
  # the apps folder.
  #
  # Run "mix help deps" for examples and options.
  defp deps do
    []
  end
end
